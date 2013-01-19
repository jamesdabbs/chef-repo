package "vlc" do
  action :install
end

template "/etc/vlc/lua/http/.hosts" do
  source "vlc.hosts.erb"
  owner "root"
  group "root"
  mode "0644"
end