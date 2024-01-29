# Data Ingestion to PostgreSQL
The code is written in a way that it loads the parquet file directly in case of taxi trips or csv file for zones.

python data_ingestion.py --username <username> --password <password> --hostname <hostname> --port <port> --databasename <databasename> --tablename <tablename> --data_url <data_url> --file_type <file_type> --color <color>

Replace `<username>`, `<password>`, `<hostname>`, `<port>`, `<databasename>`, `<tablename>`, `<data_url>`, `<file_type>`, and `<color>` with your PostgreSQL credentials, data URL, file type ("taxi" or "zone"), and color if applicable.

## Arguments

- `--username`: Username for PostgreSQL.
- `--password`: Password for PostgreSQL.
- `--hostname`: Hostname for PostgreSQL.
- `--port`: Port number for PostgreSQL.
- `--databasename`: Name of the database in PostgreSQL.
- `--tablename`: Name of the table in PostgreSQL.
- `--data_url`: URL of the data file to ingest.
- `--file_type`: Type of the data file ("taxi" or "zone").
- `--color`: Color of the taxi data ("yellow" or "green").


[Queries for homework 1](<Homework 1.ipynb>)

This file has queries that were executed to get the relevant answers.