# PostgreSQL Database dump

This is where the database dump is stored. Create dumps is the best way to keep track of database changes

We have two files, one is a schema (tables) dump called `tensu.sql` and the other is a data dump called `data-examples.sql` 

# Restore from dump

1. (Optional) Delete an old tensu database if it exists:

```
sudo -u postgres dropdb tensu
```

2. Create a new empty database:

```
sudo -u postgres createdb tensu
```

3. cd to this directory and restore schema from local file:

```
psql -U tensu_master -d tensu -f tensu.sql
```

4. (Optional) Restore data example:

```
psql -U tensu_master -d tensu -f data-example.sql
```

### All in one:

```
sudo -u postgres dropdb tensu
sudo -u postgres createdb tensu
psql -U tensu_master -d tensu -f tensu.sql
psql -U tensu_master -d tensu -f data-example.sql
```

# Create dump

1. Open terminal and cd to this directory

2. Create schema dump:

```
pg_dump -U tensu_master -s tensu > tensu.sql
```

3. (Optional) Create data dump if you provide a new data example for changed schema:

```
pg_dump -U tensu_master -a tensu > data-example.sql
```

### All in one:

```
pg_dump -U tensu_master -s tensu > tensu.sql
pg_dump -U tensu_master -a tensu > data-example.sql
```
