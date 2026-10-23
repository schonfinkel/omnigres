-- REPACK, new in Postgres 19
alter type statement_type add value if not exists 'RepackStmt' after 'ClusterStmt';
