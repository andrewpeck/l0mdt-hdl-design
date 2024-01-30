### Simple script for batch-running all the cocotb tests and checking their status.
### Intended for local use (not in CI jobs)
###
### It parses the output with the same approach of the CI job, reporting if the 
### test passes, fails with TV comparison error, or if it fails due to compilation 
### error or for another reason. It will stop execution in case of errors

### Before running:
### Simply change the logdir and update the list of cocotb_tests below

LOGDIR=/home/ilongari/work/l0mdt_test_dev/test_results/$(date -u  +%Y%m%d_%H.%M.%S)/
mkdir -p $LOGDIR
echo "Logfiles will be saved in $LOGDIR"


### List of tests
declare -a cocotb_tests=(
    polmux                 
    ult_tar                
    ucm                        
    mtc                        
    mtc_no_sb              
    mpl_mtc                
    csf                    
    lsf_inn                
    lsf_mid                
    lsf_out                
    heg_3threads
    hps_inn                
    ptcalc                 
    ptc_mpi                
    ptcalc_3threads        
    ult_mpt                
    ult_upt                
    lsf_ptcalc             
    ult_mpt_mpl_mtc_primary
    ult_upt_mpl_mtc_primary
    ult_ucm_pt_mpl_mtc     
)



### Color msg
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
OKSTR=" [${GREEN}    OK${NC}]"
PASSSTR=" [${GREEN}PASSED${NC}]"
ERRSTR=" [${RED} ERROR${NC}]"

### Do the dirty job
for test_name in "${cocotb_tests[@]}"
do
    echo "Running ${test_name}..."
    nohup tb run test_config/config_${test_name}.json > ${LOGDIR}/log-${test_name}.txt 2>&1
    
    if ! grep -Eq "INFO +cocotb +Running" ${LOGDIR}/log-${test_name}.txt
    then    
        echo -e "${ERRSTR} cocotb running INFO message not found, check ${LOGDIR}/log-${test_name}.txt"
    else
        if grep -qE  "TEST.*STATUS.*SIM.*TIME.*(ns)" ${LOGDIR}/log-${test_name}.txt
        then 
            if grep -qE "cocotb.regression.*test passed" ${LOGDIR}/log-${test_name}.txt
            then 
                echo -e "${PASSSTR} Test PASSED - see ${LOGDIR}/log-${test_name}.txt"
            elif grep -q "cocotb.result.TestFailure" ${LOGDIR}/log-${test_name}.txt
            then 
                echo -e "${OKSTR} Test completed but TV comparison failed - see ${LOGDIR}/log-${test_name}.txt" 
            else 
                echo -e "${ERRSTR} Other failure - check ${LOGDIR}/log-${test_name}.txt" 
            fi 
        else 
            echo -e "${ERRSTR} Other failure during cocotb test - check ${LOGDIR}/log-${test_name}.txt" 
        fi
    fi
done
