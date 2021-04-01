set -v
gcc generate.c -o generate -Wall
./generate 2 10 > 2-10.txt
./generate 3 50 > 3-50.txt
./generate 10 500 > 10-500.txt
gcc mylist.c -o mylist -Wall
./mylist -i
./mylist -i output
./mylist -i output.txt 10-500.txt
cat output.txt
./mylist -d output.txt 2-10.txt 3-50.txt 10-500.txt
cat output.txt
./mylist -i output.txt 10-500.txt badfile123 2-10.txt
