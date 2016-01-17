make
sudo dmesg -C
sudo insmod mp2.ko
# userapp duration period
./userapp 13 305 &
./userapp 13 300 &
./userapp 400 500 &
./userapp 13 600
# ./userapp 19 100
#sleep 
cat /proc/mp2/status
#pkill userapp
sudo rmmod mp2
dmesg 
