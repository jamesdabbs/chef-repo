include_recipe 'python'

python_pip 'beets' do
  action :install
end

template "#{ENV['HOME']}/.beetsconfig" do
  source "beets/beetsconfig.erb"
  mode   0644
  owner "#{ENV['USER']}"
  group "#{ENV['USER']}"
end