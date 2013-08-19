# Set up local variables to be zero at the start of the file.
BEGIN{
nbb_trc_exit_found = 0;
nbb_trc_allowed = 0;
nbb_trc_in_comment = 0;
}

# If the file this is being run over is a header file we do not want this to
# happen.  Header files contain #defines which include TRC statements outside
# of functions and this would produce too many erroneous moans.
(FILENAME!~/\.c$/) {
   exit;
}

# If a NBB_nbb_trc_exit_found is found then set a flag
($0~/NBB_TRC_EXIT/){
nbb_trc_exit_found = 1;
}

# If the end of the function is found then unset the nbb_trc_exit_found flag.
($0~/^}/){
nbb_trc_exit_found = 0;
}

# If an EXIT label is encountered with the nbb_trc_exit_found flag set then moan
(nbb_trc_exit_found == 1 && $0~/^:EXIT/){
print(FILENAME,NR,": Do not place EXIT_LABEL after NBB_TRC_EXIT()");
}

# If a NBB_TRC_ENTRY is encountered set a flag.
($0~/NBB_TRC_ENTRY/){
  nbb_trc_allowed = 1;
  if ($1 == "/*")
  {
    nbb_trc_in_comment = 1;
  }
  else
  {
    nbb_trc_in_comment = 0;
  }
}

# If a NBB_nbb_trc_exit_found is found unset the flag.  Unmatched NBB_TRC_ENTRY
# and NBB_TRC_EXIT is bug we must not let these occur.
($0~/NBB_TRC_EXIT/){
  nbb_trc_allowed = 0;
  if ($1 == "/*" && nbb_trc_in_comment == 0)
  {
    print(FILENAME,NR,": NBB_TRC_EXIT must not be commented out if NBB_TRC_ENTRY is not");
  }
  else if ($1 != "/*" && nbb_trc_in_comment == 1)
  {
    print(FILENAME,NR,": NBB_TRC_ENTRY must not be commented out if NBB_TRC_EXIT is not");
  }
  nbb_trc_in_comment = 0;
}

# If a trace statement is found without the TRC_ENTRY flag being set then moan
(nbb_trc_allowed == 0 && $0~/NBB_TRC/ && $0!~/NBB_TRC_EXIT/) {
print(FILENAME,NR,": Do not use NBB_TRC_XXX without NBB_TRC_ENTRY()");
}

# If a return statement is found before the NBB_TRC_EXIT then moan.
(nbb_trc_allowed == 1 &&                       \
 ($0~/return;/ || $0~/return\(.*\);/) &&     \
 nbb_trc_in_comment == 0) {
 print(FILENAME,NR,": Do not place return statements before NBB_TRC_EXIT()");
}



