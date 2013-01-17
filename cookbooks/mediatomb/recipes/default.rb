#
# Cookbook Name:: mediatomb
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "mediatomb" do
  action :install
end

template "/etc/mediatomb/config.xml" do
  source "config.xml.erb"
  owner "mediatomb"
  group "mediatomb"
  mode "0644"
end