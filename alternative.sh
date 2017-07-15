grep -A31 "FINAL OPTIMIZED GEOMETRY" aragonite_BS1_OPTIMIZATION_EOS_ANALYSIS_NEW.out > finals.dat

sed -i '/F/d' finals.dat
sed -i '/***/d' finals.dat
sed -i '/NON/d' finals.dat

for i in      231.258240  \
     233.804750           \
     235.978198           \
     236.370909           \
     238.954760           \
     241.556358           \
     244.175148           \
     246.816007           \
     249.468797           \
     252.148054           \
     254.834741


