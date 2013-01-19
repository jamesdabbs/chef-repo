package "mediatomb" do
  action :install
end

template "/etc/mediatomb/config.xml" do
  source "mediatomb.config.xml.erb"
  owner "mediatomb"
  group "mediatomb"
  mode "0644"
end