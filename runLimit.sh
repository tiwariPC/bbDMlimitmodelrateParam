
for year in "2017" "2018" "2016" "run2"
do
   for cat in "C" "2b" "1b"
   do
      python runLimit.py -runlimit -cards /afs/cern.ch/work/p/ptiwari/bb+DM_analysis/analyser/CMSSW_10_2_13/src/bbDMlimitmodelrateParam/datacards/datacard_bbDM${year}_${cat} -tag Jan23_${year}_${cat} -scan 1d -par ma -fixpar "[mA=600,tb=35,st=0p7]" -model THDMa -c ${cat} -y ${year}
   done
done
