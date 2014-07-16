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

%w{
  entropy
  ntp_kernel_err
  ntp_kernel_pll_freq
  ntp_kernel_pll_off
  ntp_offset
  ntp_states
  postfix_mailqueue
  postfix_mailvolume
  proc_pri
  uptime
  users
}.each do |script|
  munin_node_plugin script do
    script_name script
    action :disable
  end
end

service "munin-node" do
  action [:enable, :start]
end

