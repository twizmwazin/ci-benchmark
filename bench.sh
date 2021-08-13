#!/bin/bash

function fileio() {
        sysbench --test=fileio --file-total-size=128G prepare
        sysbench --test=fileio --file-total-size=128G --file-test-mode=rndrw --max-time=300 --max-requests=0 run
        sysbench --test=fileio --file-total-size=128G cleanup
}

function cpu() {
        sysbench --test=cpu --cpu-max-prime=20000 --num-threads=2 run
}

function threads() {
        sysbench --test=threads --thread-locks=1 --max-time=20s run
}

function mutex() {
        sysbench --test=mutex --num-threads=64 run
}

function memory() {
        sysbench --test=memory --num-threads=4 run
}

fileio
cpu
threads
mutex
memory
