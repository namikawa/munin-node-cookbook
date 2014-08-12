#
# Cookbook Name:: munin-node
# Recipe:: nginx
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "munin-node::default"

package "perl-libwww-perl" do
  action :install
end

%w{
  nginx_combined_
  nginx_memory
}.each do |script|
  munin_node_plugin script do
    script_name script
    action :install
  end
end

%w{
  nginx_memory
  nginx_status
  nginx_request
}.each do |script|
  munin_node_plugin script do
    script_name script
    action :enable
  end
end

munin_node_plugin "nginx_combined_127.0.0.1" do
  script_name "nginx_combined_"
  action :enable
end

