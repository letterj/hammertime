#!/usr/bash
####
dbset db ora

print dict
dbset db ora
dbset bm TPC-C
diset connection system_user SYSTEM_USER 
diset connection system_password SYSTEM_PASSWORD
diset connection instance ORACLE_EZCONNECT 
diset tpcc ora_driver timed
diset tpcc timeprofile true
print dict

loadscript
### Round 1
vuset vu 1
vuset logtotemp 1
vuset unique 1
vuset timestamps 1
print vuconf

vucreate
vustatus
vurun
sleep 500
### Round 2
vudestroy
vuset vu 2
print vuconf

vucreate
vustatus
vurun
sleep 500

### Round 3
vudestroy
vuset vu 3
print vuconf

vucreate
vustatus
vurun
sleep 500
