#!/bin/sh
ulimit -s unlimited
set -e
cd /afs/cern.ch/work/p/ptiwari/bb+DM_analysis/analyser/CMSSW_10_2_13/src
export SCRAM_ARCH=slc7_amd64_gcc700
source /cvmfs/cms.cern.ch/cmsset_default.sh
eval `scramv1 runtime -sh`
cd /afs/cern.ch/work/p/ptiwari/bb+DM_analysis/analyser/CMSSW_10_2_13/src/bbDMlimitmodelrateParam

if [ $1 -eq 0 ]; then
   source /afs/cern.ch/work/p/ptiwari/bb+DM_analysis/analyser/CMSSW_10_2_13/src/bbDMlimitmodelrateParam/runLimit_perbin.sh
fi
