#
# Cookbook Name:: munin-node
# Recipe:: tomcat
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "munin-node::default"

package "perl-XML-Simple" do
  action :install
end

template "/etc/munin/plugin-conf.d/tomcat" do
  source "tomcat.erb"
  mode "0644"
  notifies :restart, "service[munin-node]"
end

%w{ 
  java_fd
  jstat_gccount
  jstat_gctime
  jstat_heap
  tomcat_access
  tomcat_jvm
  tomcat_threads
}.each do |script|
  munin_node_plugin script do
    script_name script
    action [ :install, :enable ]
  end 
end

