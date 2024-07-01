#!/bin/bash
sp="/-\|"
sc=0
spin() {
   printf "\b${sp:sc++:1}"
   ((sc==${#sp})) && sc=0
}
endspin() {
   printf "\r%s\n" "$@"
}
Filename=/home/miguel/Proyectos/ParaBash/run_0.260/pos.xyz
vale=()
echo "calculating"
for i in {1..10}	
do
spin
File0=$(stat -c%s "$Filename")
sleep 1
File1=$(stat -c%s "$Filename")
rat=$(($File1-$File0))
rat=$(($rat/3))
vale+=($rat)
done

sum=0
for ele in ${vale[@]}; do
  let sum=sum+ele
done
len=${#vale[@]}
let avg=sum/len

echo "Speed is : $avg bytes/sec"
endspin
