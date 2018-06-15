.mode csv
.bail on
.echo on

-- drop/create new tables
.open ./data/processed/congress-legislators-simplified.vanilla.sqlite
.read ./src/dba/vanilla/schema.sql

-- import the data
.changes on
.import ./data/raw/legislators-current.csv legislator
-- remove the repeated headers
DELETE FROM legislator WHERE bioguide_id = 'bioguide_id';

.import ./data/raw/legislators-historical.csv legislator
DELETE FROM legislator WHERE bioguide_id = 'bioguide_id';


-- index the data
.read ./src/dba/vanilla/indexes.sql

