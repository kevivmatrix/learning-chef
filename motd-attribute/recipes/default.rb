#
# Cookbook Name:: motd-attribute
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require "pp"

node.default["ipaddress"] = "1.1.1.1"
pp node.debug_value "ipaddress"
node.default["motd-attribute"]["company"] = "My company"
node.default["motd-attribute"]["message"] = "It's a wonderful day today!"

pp node.debug_value "motd-attribute", "company"
include_recipe 'motd-attribute::_message'
pp node.debug_value "motd-attribute", "company"

template '/etc/motd' do
  source 'motd.erb'
  mode '0644'
end
