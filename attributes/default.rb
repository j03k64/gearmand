###
# Do not use this file to override the memcached cookbook's default
# attributes.  Instead, please use the customize.rb attributes file,
# which will keep your adjustments separate from the AWS OpsWorks
# codebase and make it easier to upgrade.
#
# However, you should not edit customize.rb directly. Instead, create
# "memcached/attributes/customize.rb" in your cookbook repository and
# put the overrides in YOUR customize.rb file.
#
# Do NOT create an 'memcached/attributes/default.rb' in your cookbooks. Doing so
# would completely override this file and might cause upgrade issues.
#
# See also: http://docs.aws.amazon.com/opsworks/latest/userguide/customizing.html
###

default[:gearmand][:job_retries] = 0
default[:gearmand][:port] = 4730

case node[:platform]
when 'redhat', 'centos', 'fedora', 'amazon'
  default[:gearmand][:pid_file] = '/var/run/gearmand/gearmand.pid'
else
  raise 'Bailing out, unknown platform.'
end

default[:gearmand][:start_command] = "/etc/init.d/gearmand start"
default[:gearmand][:stop_command] = "/etc/init.d/gearmand stop"

include_attribute "gearmand::customize"
