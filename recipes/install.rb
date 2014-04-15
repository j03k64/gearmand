# determine which the package to install
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