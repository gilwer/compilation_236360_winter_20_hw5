#!/bin/bash
# $1 is highest test number

# sub_folder="Dean/Artihmetics"
# sub_folder="Staff"

test_to_skip=('')
path="tests"
sub_folders=("Staff" "Spring18" "Dean/Artihmetics" "Dean/basic_expression_tests" "Dean/basic_tests_last_semester" \
"Dean/func_tests" "Dean/If_tests" "Dean/more_tests" "Dean/vars_tests" "Dean/LASTSEM" "Dean/booleans_tests" \
"Dean/overflow_tests" "Dean/while_tests" "Self" "Whatsapp" "omeran_tests")

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

# $1: folder
function run_tests_in_folder {
    curr_dir=`pwd`
    cd $1

    for test in `ls *.in`; do
        test_name=`echo $test | cut -d '.' -f 1` 
        echo -n "TEST ${test_name}..."
        if [ ! -f "${test}" ]; then
            echo "FILE NOT FOUND"
            continue
        fi
        if [[ `skip_test? $test_name` == "true" ]]; then
            echo "SKIPPING"
            continue
        fi
        "${curr_dir}/hw5" < "${test_name}.in" > "${test_name}.ll"
        /usr/local/opt/llvm/bin/lli < "${test_name}.ll" > "${test_name}.res"
        res=`diff "${test_name}.res" "${test_name}.out"`
        if [[ -z $res ]]; then
            echo "Done"
        else
            echo "Failed"
            echo "res: ${res}"
            exit 0
        fi
        rm "${test_name}.ll" "${test_name}.res"
    done

    cd $curr_dir
}

for d in ${sub_folders[@]}; do
    echo "--------------------------------------"
    echo "Running tests in folder ${d}"
    echo "--------------------------------------"
    run_tests_in_folder "$path/${d}"
    echo "--------------------------------------"
    echo "Passed tests in folder ${d}"
    echo "--------------------------------------"
    echo ""
done

