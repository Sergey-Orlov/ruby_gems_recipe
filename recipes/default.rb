bash "install_basic_gems" do
  user "root"
  code <<-EOH
    gem install bundler
    gem install foreman
  EOH
  action :run
end

cookbook_file "#{Chef::Config[:file_cache_path]}/Gemfile" do
  source "Gemfile"
  owner "root"
  group "root"
  mode "0644"
end

bash "install_omega_gems" do
  user "root"
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
    bundle install
  EOH
  action :run
end