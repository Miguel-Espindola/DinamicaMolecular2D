#!/bin/bash

run_sim() {

        RUNDIR=run_$1
        mkdir ${RUNDIR}
        {
                echo "200"
                echo "100"
                echo "50"
                echo "10000000"
                echo "0.003"
                echo "10000"
                echo "$1"
        } > ${RUNDIR}/config.txt
        (cd ${RUNDIR} ; ../code)
}

export -f run_sim

parallel run_sim ::: $(seq 0.01 0.005 1.5)

