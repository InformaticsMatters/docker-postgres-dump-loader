# A PostgreSQL 'dump' loader image
A PostgreSQL v12.3 client image to simplify the loading of postgres *dumps*
taken from one database using [pg_dump] to a (Kubernetes-based) new database.

## Usage
Build the container with the database dumps in the `dumps` directory
(ideally encrypted with gpg). Then, when built and pushed the image can be run
as a Kubernetes Job using the simple Job template in the repo and psql
commands issued to load the data into the new DB.

    $ docker build . -t informaticsmatters/postgres-loader:latest
    $ docker push informaticsmatters/postgres-loader:latest
    
    $ kubectl create -f job.yaml

From within the container you can then decrypt the dumps...

    # gpg --output squonk-20200805.sql.gz --decrypt squonk-20200805.sql.gz.gpg

And then load into the im-infra database...

    # gunzip -c squonk-20200805.sql.gz | \
        psql --set ON_ERROR_STOP=on --host=database --username=<uaername> squonk

When done, delete the loader Job/Pod...

    $ kubectl delete job/pg-loader -n im-infra

---

[pg_dump]: https://www.postgresql.org/docs/9.5/backup-dump.html
