rpm -qa --queryformat '%{installtime} %{installtime:date} %{name}\n' | sort -n | cut -d' ' -f2-

