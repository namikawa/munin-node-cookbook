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

service "munin-node" do
  action [:enable, :start]
end

