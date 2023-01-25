
# pythonFile="prepareCards.py"
# pythonFile="prepareCards_perbin.py"
pythonFile="prepareCards_perbin_channel.py"
for year in "16" "17" "18"
do
   rootfile="allmethistos/AllMETHistos_v${year}_12-02-02.root"
   python ${pythonFile} -y 20${year} -c 1b -reg SR_bin1 SR_bin2 SR_bin3 SR_bin4 WE_bin1 WE_bin2 WE_bin3 WE_bin4 WMU_bin1 WMU_bin2 WMU_bin3 WMU_bin4 ZEE_bin1 ZEE_bin2 ZEE_bin3 ZEE_bin4 ZMUMU_bin1 ZMUMU_bin2 ZMUMU_bin3 ZMUMU_bin4 -f $rootfile
   python ${pythonFile} -y 20${year} -c 2b -reg SR_bin1 SR_bin2 SR_bin3 SR_bin4 TOPE_bin1 TOPE_bin2 TOPE_bin3 TOPE_bin4 TOPMU_bin1 TOPMU_bin2 TOPMU_bin3 TOPMU_bin4 ZEE_bin1 ZEE_bin2 ZEE_bin3 ZEE_bin4 ZMUMU_bin1 ZMUMU_bin2 ZMUMU_bin3 ZMUMU_bin4 -f $rootfile
   python mergeCategoryDatacards.py -O datacards/datacard_bbDM20${year}_1b -T datacards/datacard_bbDM20${year}_2b -D datacards/datacard_bbDM20${year}_C
done
