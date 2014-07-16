#
# Cookbook Name:: munin-node
# Recipe:: mysql
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "munin-node::default"

%w{
  perl-DBD-MySQL
  perl-Cache-Cache
}.each do |pkg|
  package pkg do
    action :install
  end
end

%w{
  mysql_bin_relay_log
  mysql_bytes
  mysql_commands
  mysql_connections
  mysql_files_tables
  mysql_innodb_bpool
  mysql_innodb_bpool_act
  mysql_innodb_insert_buf
  mysql_innodb_io
  mysql_innodb_io_pend
  mysql_innodb_log
  mysql_innodb_rows
  mysql_innodb_semaphores
  mysql_innodb_tnx
  mysql_network_traffic
  mysql_qcache
  mysql_qcache_mem
  mysql_select_types
  mysql_slow
  mysql_sorts
  mysql_table_locks
  mysql_tmp_tables
}.each do |script|
  munin_node_plugin script do
    script_name "mysql_"
    action :enable
  end
end

%w{
  mysql_queries
  mysql_slowqueries
  mysql_threads
}.each do |script|
  munin_node_plugin script do
    script_name script
    action :enable
  end
end

