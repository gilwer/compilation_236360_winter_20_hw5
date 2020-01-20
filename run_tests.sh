#!/bin/bash
# $1 is highest test number

sub_folder="Spring18"
path="tests/${sub_folder}"
test_to_skip=(0)
# test_to_skip=(21 23)

# $1: array
# $2: value
function skip_test? {
    res="false"
    for test in ${test_to_skip[@]} ; do
        if (( $test == $1 )); then
            res="true"
        fi
    done

    echo $res
}

for i in `seq 1 ${1}`; do
    echo -n "TEST ${i}..."
    if [ ! -f "${path}/t${i}.in" ]; then
        echo "FILE NOT FOUND"
        continue
    fi
    if [[ `skip_test? $i` == "true" ]]; then
        echo "SKIPPING"
        continue
    fi
    ./hw5 < "${path}/t${i}.in" > "${path}/t${i}.ll"
    /usr/local/opt/llvm/bin/lli < "${path}/t${i}.ll" > "${path}/t${i}.res"
    res=`diff "${path}/t${i}.res" "${path}/t${i}.out"`
    if [[ -z $res ]]; then
        echo "Done"
    else
        echo "Failed"
        exit 0
    fi
    rm "${path}/t${i}.ll" "${path}/t${i}.res"
done