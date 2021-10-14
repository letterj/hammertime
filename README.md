
## Using docker to run hammerdb

https://www.hammerdb.com/


### Build the docker image

```
docker build —tag=hammerdb ./
```

### Run the docker image

Run the docker image with oracle ora_load.sh script:

```
docker run -it --env SYSTEM_USER=system --env ORACLE_EZCONNECT=192.168.0.172:1521/orcl --env SYSTEM_PASSWORD=oracle hammerdb
```

Run the docker image with postgresql pg_load.sh script:

```
docker build --tag=hammerdb ./
docker run -it hammerdb
```

Run the docker image with bash and call hammdbcli to manually run tests:

```
docker run -it --rm hammerdb /bin/bash
```

### Hammerdb Commands

Great getting started guide. (here)[https://www.hammerdb.com/blog/uncategorized/hammerdb-cli-101/]

Check which client libraries are installed
```
librarycheck
```

Set the database
```
dbset db pg
```

You can use either the TPROC or TPC terminology at the CLI.
```
dbset bm TPROC-C
```
```
dbset bm TPC-C
```

In the CLI the print dict command shows us the available options.
```
print dict
```

Set the pg_host variable for running hammerdb in a docker container
```
diset connection pg_host host.docker.internal
```



