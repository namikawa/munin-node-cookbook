def whyrun_supported?
  true
end

action :install do
  cookbook_file "/usr/share/munin/plugins/#{new_resource.key}" do
    source "plugins/#{new_resource.script_name}"
    action :create
    mode "0755"
  end
end

action :enable do
  link "/etc/munin/plugins/#{new_resource.key}" do
    to "/usr/share/munin/plugins/#{new_resource.script_name}"
    notifies :restart, "service[munin-node]"
  end
  new_resource.updated_by_last_action(true)
end

action :disable do
  link "/etc/munin/plugins/#{new_resource.key}" do
    action :delete
    notifies :restart, "service[munin-node]"
  end
end

