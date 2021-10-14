#!/bin/bash
echo $ORACLE_EZCONNECT
echo $SYSTEM_USER
echo $SYSTEM_PASSWORD

sed -i -e "s#ORACLE_EZCONNECT#$ORACLE_EZCONNECT#g" /hammerdb/ora_load.tcl 
sed -i -e "s#SYSTEM_PASSWORD#$SYSTEM_PASSWORD#g" /hammerdb/ora_load.tcl 
sed -i -e "s#SYSTEM_USER#$SYSTEM_USER#g" /hammerdb/ora_load.tcl 

cd /hammerdb
./hammerdbcli auto ora_load.tcl
