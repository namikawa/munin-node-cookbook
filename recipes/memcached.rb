#
# Cookbook Name:: munin-node
# Recipe:: memcached
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "munin-node::default"

%w{
  perl-Cache-Cache
  perl-Cache-Memcached
}.each do |pkg|
  package pkg do
    action :install
  end
end

%w{
  memcached_bytes
  memcached_connections
  memcached_hits
  memcached_items
  memcached_requests
  memcached_traffic
}.each do |script|
  munin_node_plugin "#{script}_127.0.0.1_11211" do
    script_name script
    action [ :install, :enable ]
  end
end

