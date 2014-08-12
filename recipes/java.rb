#
# Cookbook Name:: munin-node
# Recipe:: java
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "munin-node::default"

template "/etc/munin/plugin-conf.d/jstat" do
  source "jstat.erb"
  mode "0644"
  notifies :restart, "service[munin-node]"
end

%w{ 
  jstat_gccount
  jstat_gctime
  jstat_heap
}.each do |script|
  munin_node_plugin script do
    script_name script
    action [ :install, :enable ]
  end 
end

template "/usr/share/munin/plugins/java_fd" do
  source "plugins/java_fd.erb"
  mode "0755"
end

munin_node_plugin "java_fd" do
  script_name "java_fd"
  action :enable
end

