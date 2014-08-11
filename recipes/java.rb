#
# Cookbook Name:: munin-node
# Recipe:: java
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "munin-node::default"

package "perl-XML-Simple" do
  action :install
end

template "/etc/munin/plugin-conf.d/jstat" do
  source "jstat.erb"
  mode "0644"
  notifies :restart, "service[munin-node]"
end

%w{ 
  java_fd
  jstat_gccount
  jstat_gctime
  jstat_heap
}.each do |script|
  munin_node_plugin script do
    script_name script
    action [ :install, :enable ]
  end 
end

