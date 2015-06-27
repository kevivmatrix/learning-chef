#
# Cookbook Name:: enterprise
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

package_url = node.default["enterprise"]["url"]
package_name = ::File.basename(package_url)
package_local_path = "#{Chef::Config[:file_cache_path]}/#{package_name}"

remote_file package_local_path do
  source package_url
end

package package_name do
  source package_local_path
  provider Chef::Provider::Package::Rpm
  notifies :run, 'execute[chef-server-ctl reconfigure]', :immediately
end

execute 'chef-server-ctl reconfigure' do
  command 'chef-server-ctl reconfigure'
  action :nothing
end
