#encoding: utf-8
name              "gearmand"
description       "Installs Gearman Server"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
maintainer        "Jason Pirkey"
maintainer_email  "jason@tave.com"
license           "Apache 2.0"
version           "0.1.0"

recipe "gearmand::server", "Gearman Server"

supports 'redhat'
supports 'centos'
supports 'amazon'
supports 'fedora'

attribute "gearmand/job_retries",
  :display_name => "Gearmand Job Retries",
  :description => "Number of attempts to run the job before the job server removes it. This is helpful to ensure a bad job does not crash all available workers. Default is no limit.",
  :default => "0"

attribute "gearmand/port",
  :display_name => "Gearmand Port",
  :description => "Port to use for gearmand",
  :default => "4730"
