#/bash/bin

#echo -e " $(free -h | awk '/^Mem:/{print" "$3" / "$2}')"
echo -e " $(free -h | awk '/^Mem:/{print"💻 " $3}')"
