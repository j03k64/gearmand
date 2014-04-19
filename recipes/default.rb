# install
case node.platform_family
when "rhel", "fedora", "amazon", "centos"
  pkg = "gearmand"
else
  raise 'Bailing out, unknown platform.  Not sure which package to install'
end

package "gearmand" do
  package_name pkg
  action :install
end


# setup the service to autostart and autorun
service "gearmand" do
  action [:enable, :start]
  supports :status => true, :start => true, :stop => true, :restart => true
end


# setup config file
case node[:platform]
when 'centos','redhat','fedora','amazon'
  template '/etc/sysconfig/gearmand' do
    source 'gearmand.sysconfig.erb'
    owner 'root'
    group 'root'
    mode 0644
    variables(
      :job_retries => node[:gearmand][:job_retries],
      :port => node[:gearmand][:port],
      :more_options => node[:gearmand][:more_options]
    )
    notifies :reload, "service[gearmand]", :immediately
  end
end
