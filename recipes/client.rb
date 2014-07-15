#
# Cookbook Name:: munin-node
# Recipe:: client
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "munin-node" do
  action :install
end

template "/etc/munin/munin-node.conf" do
  source "munin-node.conf.erb"
  mode "0644"
  notifies :restart, "service[munin-node]"
end

service "munin-node" do
  action [:enable, :start]
end

