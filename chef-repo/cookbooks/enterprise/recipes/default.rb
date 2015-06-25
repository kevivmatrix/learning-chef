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

package package_local_path

execute 'chef-server-ctl reconfigure'
