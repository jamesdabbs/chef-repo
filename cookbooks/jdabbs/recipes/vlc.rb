package "vlc" do
  action :install
end

# Allow access to the web ui on the local network
template "/etc/vlc/lua/http/.hosts" do
  source "vlc.hosts.erb"
  owner "root"
  group "root"
  mode "0644"
end

# Set up the default media library
template "/home/james/.local/share/vlc/ml.xspf" do
  source "vlc.media-library.xspf.erb"
  owner "james"
  mode 0644
end

# Set up a recurring alarm and associated playlist
cron "vlc alarm" do
  weekday "1-5"
  hour "7"
  minute "45"
  user "james"
  command "vlc -I http file:///home/james/alarm.m3u --play-and-exit"
end
template "/home/james/alarm.m3u" do
  source "vlc.alarm.m3u.erb"
  owner "james"
  mode 0644
  action :create_if_missing
end

# template "/etc/init/vlc.conf" do
#   source "vlc.upstart.conf.erb"
#   owner "root"
#   group "root"
#   mode "0644"
# end