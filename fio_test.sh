#!/bin/bash

TESTDIR=/testdir
LOGFILE=${TESTDIR}/log

mkdir -p ${TESTDIR}
echo "===> test IOPS with 4k random write"
fio -direct=1 -iodepth=128 -rw=randwrite -ioengine=libaio -bs=4k -size=1G -numjobs=1 -runtime=600 -group_reporting -filename=${TESTDIR}/iotest -name=Rand_Write_Testing

echo "===> test IOPS with 4k random read"  >> ${LOGFILE}
fio -direct=1 -iodepth=128 -rw=randread -ioengine=libaio -bs=4k -size=1G -numjobs=1 -runtime=600 -group_reporting -filename=${TESTDIR}/iotest -name=Rand_Read_Testing

echo "===> test throughput with 1M sequence read"  >> ${LOGFILE}
fio -direct=1 -iodepth=32 -rw=write -ioengine=libaio -bs=1024k -size=1G -numjobs=1 -runtime=600 -group_reporting -filename=${TESTDIR}/iotest -name=Write_PPS_Testing

echo "===> test throughput with 1M sequence read"  >> ${LOGFILE}
fio -direct=1 -iodepth=32 -rw=read -ioengine=libaio -bs=1024k -size=1G -numjobs=1 -runtime=600 -group_reporting -filename=${TESTDIR}/iotest -name=Read_PPS_Testing
