#
for i in      97.335810 \
      98.720838 \
     100.197756 \
     101.640626 \
     103.066195 \
     104.524931 \
     106.008971 \
     107.486114 \
     108.963884 \
     110.449426 \
     127.054446 


do 

cd $i 

mkdir SCELPHONO_4_4_4

cd -
done 

for i in      97.335810 \
      98.720838 \
     100.197756 \
     101.640626 \
     103.066195 \
     104.524931 \
     106.008971 \
     107.486114 \
     108.963884 \
     110.449426 \
     127.054446 


do

cd $i/SCELPHONO_4_4_4

# Remove RANGE:
sed -i '/RANGE/d' ./calcite_optimization_bulk_modif_1_optimised_EOS_analysis.d12

# Remove 0.77
sed -i '/0.77/d' ./calcite_optimization_bulk_modif_1_optimised_EOS_analysis.d12


# sed EOS for:
#SCELPHONO
#4 0 0
#0 4 0
#0 0 4
#FREQCALC
#NOINTENS
#NOOPTGEOM
#DISPERSI

newstring="SCELPHONO\n4 0 0\n0 4 0\n0 0 4\nFREQCALC\nNOINTENS\nDISPERSI"
sed -i "s/EOS/$newstring/" calcite_optimization_bulk_modif_1_optimised_EOS_analysis.d12

qcry14.check  calcite_optimization_bulk_modif_1_optimised_EOS_analysis 1152 24:00
qsub calcite_optimization_bulk_modif_1_optimised_EOS_analysis.qsub

cd -

done
