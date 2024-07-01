#!/bin/bash
run_sim() {

        RUNDIR=run_$1
	(cp paramOvito.py ${RUNDIR})
	(echo "Iniciando el render en $RUNDIR")
        (cd ${RUNDIR} && python3 paramOvito.py)
}

export -f run_sim
parallel run_sim ::: $(seq 0.01 0.005 1.5)

