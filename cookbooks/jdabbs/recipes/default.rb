#
# Cookbook Name:: jdabbs
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
template "#{ENV['HOME']}/.bashrc" do
  source "bashrc.erb"
  mode   "0644"
end

package "tree" do
  action :install
end
