node[:deploy].each do |application, deploy|
  deploy = node[:deploy][application]

  bash "restart-delayed-jobs-#{application}" do
    layers = node[:opsworks][:instance][:layers]
    cwd "#{deploy[:deploy_to]}/current"
    user 'deploy'
    code "RAILS_ENV=#{deploy[:rails_env]} bundle exec bin/delayed_job restart -n2"
    only_if "cd #{deploy[:deploy_to]}/current && bundle show delayed_job"
  end
end
