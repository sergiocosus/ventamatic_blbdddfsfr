#!/bin/sh

mysql -u $1 -p$2 < tables.sql 
mysql -u $1 -p$2 ventamatic < Places/data_states.sql
mysql -u $1 -p$2 ventamatic < Places/data_municipalities.sql
mysql -u $1 -p$2 ventamatic < Places/data_localities.sql
mysql -u $1 -p$2 ventamatic < Places/data_localities1.sql
mysql -u $1 -p$2 ventamatic < Places/data_localities2.sql
mysql -u $1 -p$2 ventamatic < Places/data_localities3.sql
