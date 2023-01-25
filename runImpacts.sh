dirname=$1
datacard=$2
year=$3
catg=$4

echo ${dirname} ${datacard} ${year} ${catg}

## create workspace
text2workspace.py $datacard --channel-masks
datacardws=`echo $datacard | sed  's|.txt|.root|g'`
echo $datacardws

mkdir -p "pullsANDimpacts/"${dirname}

## run limits
# combine -M AsymptoticLimits $datacard -v 0 --rMin 1e-07 --rMax 30 > ${dirname}/limit.txt
# combine -M AsymptoticLimits $datacard  -t -1  -v 0 --rMin 1e-07 --rMax 30 > ${dirname}/limit_blind.txt

#### impacts
mode="asimov_t_0" ## asimov
combineTool.py -M Impacts -d $datacardws --doInitialFit --robustFit 1 -m 125 -t -1 --expectSignal 0 --rMin -10
combineTool.py -M Impacts -d $datacardws --doFits  --robustFit 1 -m 125 --parallel 32 -t -1 --expectSignal 0 --rMin -10
combineTool.py -M Impacts -d  $datacardws -m 125 -o pullsANDimpacts/${dirname}/impacts_${mode}.json
plotImpacts.py -i  pullsANDimpacts/${dirname}/impacts_${mode}.json -o pullsANDimpacts/${dirname}/impacts_${mode}_${dirname}


mode="asimov_t_m1" ## asimov signal injected
combineTool.py -M Impacts -d $datacardws --doInitialFit --robustFit 1 -m 125 -t -1 --expectSignal 1 --rMin -10
combineTool.py -M Impacts -d $datacardws --doFits  --robustFit 1 -m 125 --parallel 32 -t -1 --expectSignal 1 --rMin -10
combineTool.py -M Impacts -d  $datacardws -m 125 -o pullsANDimpacts/${dirname}/impacts_${mode}.json
plotImpacts.py -i  pullsANDimpacts/${dirname}/impacts_${mode}.json -o pullsANDimpacts/${dirname}/impacts_${mode}_${dirname}

rm -rf higgsCombine_paramFit_Test_*
