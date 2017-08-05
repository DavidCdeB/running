#
run='/home/dcarrasc/../gmallia/CRYSTAL14_cx1/qcry14.v4dev1'

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

mkdir SCLPHONO_Lanadau
rm -Rf FREQCALC_Landau_Supercell

cd FREQCALC_Landau_Supercell

cp *.d12 $i\.d12
 
mv $i\.d12 ./FREQCALC_Landau_Supercell
 
cd FREQCALC_Landau_Supercell
 
rm -rf *.out
 
sed -i '/CVOLOPT/a SUPERCELL\n1 0 0\n0 -1 1\n1 -1 -1\nFREQCALC\nNOINTENS\nNOOPTGEOM' *.d12
 
sed -i '/CVOLOPT/d' *.d12
 
sed -i '/^OPTGEOM/d' *.d12
 
$run $i  64 24:00
 
sed -i 's/=16/=24/' *.qsub
 
qsub -q pqnmh  *.qsub
 
cd ../../
 
done
