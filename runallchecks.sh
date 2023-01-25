# for year in "2016" "2017" "2018" #"run2"
# do
#    for catg in "1b" "2b"
#    do
#       source runPulls.sh "pullsNimpacts"${year} "datacards/datacard_bbDM"${year}"_"${catg}"/bbDM_datacard_"${year}"_THDMa_${catg}_allregion_2HDMa_Ma150_MChi1_MA600_tb35_st_0p7.txt" ${year} ${catg}
#    done
# done


for year in "run2" #"2016" "2017" "2018" "run2"
do
   for catg in "C" #"1b" "2b"
   do
      source /afs/cern.ch/work/p/ptiwari/bb+DM_analysis/analyser/CMSSW_10_2_13/src/bbDMlimitmodelrateParam/runPulls_perbin.sh "pullsNimpacts"${year} "datacards/datacard_bbDM"${year}"_"${catg}"/bbDM_datacard_"${year}"_THDMa_${catg}_allregion_2HDMa_Ma150_MChi1_MA600_tb35_st_0p7.txt" ${year} ${catg}
      source /afs/cern.ch/work/p/ptiwari/bb+DM_analysis/analyser/CMSSW_10_2_13/src/bbDMlimitmodelrateParam/runImpacts.sh "pullsNimpacts"${year} "datacards/datacard_bbDM"${year}"_"${catg}"/bbDM_datacard_"${year}"_THDMa_${catg}_allregion_2HDMa_Ma150_MChi1_MA600_tb35_st_0p7.txt" ${year} ${catg}
   done
done
