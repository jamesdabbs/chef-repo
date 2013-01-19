include_recipe 'python'

python_pip "flexget" do
  action :install
end

user = node['flexget']['user']

directory "#{node['flexget']['home_dir']}/.flexget" do
  owner user
  group user
  mode "0755"
  action :create
end

['', 'This American Life', 'Radiolab', 'Comedy Bang! Bang!'].each do |dir|
  directory "#{node['flexget']['home_dir']}/Podcasts/#{dir}" do
    owner user
    group user
    mode "0755"
    action :create
  end
end

template "#{node['flexget']['home_dir']}/.flexget/config.yml" do
  owner user
  group user
  source "config.yml.erb"
  variables(:config => node['flexget']['config'])
end

cron "flexget" do
  hour node['flexget']['cron_hours']
  user node['flexget']['user']
  command node['flexget']['cron_command']
end