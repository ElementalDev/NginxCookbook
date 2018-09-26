#
# Cookbook:: nginx
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package("nginx") do
  action :install
end

service("nginx") do
  action [:start, :enable]
end

template "/etc/nginx/sites-available/proxy.conf" do
  source "./proxy.conf"
end

link "/etc/nginx/sites-enabled/proxy.conf" do
  to "/etc/nginx/sites-available/proxy.conf"
end

link "/etc/nginx/sites-enabled/default" do
  action :delete
end
