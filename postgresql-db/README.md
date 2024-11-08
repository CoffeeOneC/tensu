# PostgreSQL Database dump

This is where the database dump is stored

# Restore from dump

## From command-line

1. (Optional) Create a new database if it doesn't exist:

```
sudo -u postgres createdb tensu
```

2. cd to this directory and restore from local file:

```
psql -U postgres -d tensu -f tensu.sql
```

## Using pgAdmin

1. Open pgAdmin and connect to the server

2. (Optional) Navigate to the "Databases" section, right-click on the server, and select "Create" > "Database...". Enter "tensu" as the database name and click "Save"

3. Right-click on the "tensu" database and select "Restore". In the dialog box that appears, navigate to this directory and select "tensu.sql" file. Click "Restore"

# Create dump

## From command-line

1. Open terminal and cd to this directory

2. Create dump:

```
pg_dump -U postgres tensu > tensu.sql
```

## Using pgAdmin

1. Open pgAdmin and connect to the server

2. Navigate to the "Databases" section and right-click on the "tensu" database and select "Backup..."

3. In the window that appears, click on folder icon in "Filename" field, select the "tensu.sql" file in this directory. Click "Backup"
