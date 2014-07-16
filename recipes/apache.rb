#
# Cookbook Name:: munin-node
# Recipe:: apache
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "munin-node::default"

munin_node_plugin "apache_activity" do
  script_name "apache_activity"
  action :install
end

%w{
  apache_accesses
  apache_activity
  apache_processes
  apache_volume
}.each do |script|
  munin_node_plugin script do
    script_name script
    action :enable
  end 
end

