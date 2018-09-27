#
# Cookbook:: nginx
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

apt_update "update" do
  action :update
end

package("nginx") do
  action :install
end

template "/etc/nginx/sites-available/proxy.conf" do
  source "proxy.conf.erb"
end

link "/etc/nginx/sites-enabled/proxy.conf" do
  to "/etc/nginx/sites-available/proxy.conf"
end

link "/etc/nginx/sites-enabled/default" do
  action :delete
  notifies(:restart, "service[nginx]")
end

service("nginx") do
  action [:enable, :start]
end
