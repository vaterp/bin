#!/usr/bin/expect
set timeout 20
set ip [lindex $argv 0]
set port [lindex $argv 1]
#set user [lindex $argv 2]
#set password [lindex $argv 3]

spawn telnet $ip $port
expect "Username: "
send "admin\n"
expect "Password: "
send "iDirect\n"
expect "> "
send "dis load_mdm 201326859 10 1234"
interact
