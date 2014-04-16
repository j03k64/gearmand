# Define the gearmand service
service "gearmand" do
  service_name "gearmand"
  action :nothing
  supports :status => true,
    :start => true,
    :stop => true,
    :restart => true,
    :reload => true
end

include_recipe "supervisor"

supervisor_service "gearmand" do
  action :enable
  autostart true
  user "gearmand"
end