make
sudo dmesg -C
sudo insmod mp2.ko
# userapp duration period
./userapp 133 3005 &
./userapp 133 3000 &
./userapp 4000 5000 &
./userapp 132 6000
# ./userapp 19 100
#sleep 
cat /proc/mp2/status
#pkill userapp
sudo rmmod mp2
dmesg 
