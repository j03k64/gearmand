include_recipe "gearmand::install"
include_recipe "gearmand::service"

case node[:platform]
when 'centos','redhat','fedora','amazon'
  template '/etc/sysconfig/gearmand' do
    source 'gearmand.sysconfig.erb'
    owner 'root'
    group 'root'
    mode 0644
    variables(
      :job_retries => node[:gearmand][:job_retries],
      :port => node[:gearmand][:port]
    )
    notifies :reload, "service[gearmand]", :immediately
  end
end