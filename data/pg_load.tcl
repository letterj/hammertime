#!/usr/bash
####
dbset db pg

print dict
dbset db pg
dbset bm TPC-C
diset connection pg_host host.docker.internal
diset tpcc pg_total_iterations 1
print dict

loadscript
### Round 1
vuset vu 2
vuset logtotemp 1
vuset unique 1
vuset timestamps 1
print vuconf

vucreate
vustatus
vurun
