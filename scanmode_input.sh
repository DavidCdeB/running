#
run='/home/dcarrasc/../gmallia/CRYSTAL14_cx1/qcry14.v4'

for i in                                          115.170876\
                                                  115.326384\
                                                  115.481971\
                                                  115.637640\
                                                  115.793389\
                                                  115.949219\
                                                  116.105130\
                                                  116.261121\
                                                  116.417193


do

cd $i

cd FREQCALC_Landau_Supercell

mkdir SCANMODE_1

cp  * ./SCANMODE_1

#rm -rf *.out

cp  $i\.d12  $i\_SCANMODE_1.d12

mv $i\_SCANMODE_1.d12 ./SCANMODE_1

cd SCANMODE_1

# Append line after match: (a)
sed -i '/FREQCALC/a RESTART' $i\_SCANMODE_1.d12

sed -i 's/NOINTENS/SCANMODE/' $i\_SCANMODE_1.d12

sed -i 's/NOOPTGEOM/1 -10 10 0.4/' $i\_SCANMODE_1.d12

sed -i '/1 -10 10 0.4/a 1' $i\_SCANMODE_1.d12

$run $i\_SCANMODE_1 $i  64 24:00

sed -i 's/=16/=24/' $i\_SCANMODE_1.qsub

qsub -q pqnmh  $i\_SCANMODE_1.qsub

cd ../../../

done
