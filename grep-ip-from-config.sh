for i in $(grep -o --regexp="[0-9]\{1,3\}[\.][0-9]\{1,3\}[\.][0-9]\{1,3\}[\.][0-9]\{1,3\}" PSIC.mxtsessions); do sed "s/$i/$(dig -x $i | grep -o --regexp="[us].*[g][m][\.][c][o][m]")/g" -i PSIC.mxtsessions; done;