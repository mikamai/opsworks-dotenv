# import JSON custom config into .env to emulate ENV
# example:
# {
#   "deploy": {
#     "app_name" {
#       "app_env": {
#         "DATABASE_URL": "",
#         "bar": "foo"
#       }
#     }
#   }
# }

require 'shellwords'
node[:deploy].each do |application, deploy|
  rails_env = deploy[:rails_env]

  Chef::Log.info("Creating directory..")


  directory "#{deploy[:deploy_to]}/shared" do
      owner "deploy"
      group "www-data"
      mode 0774
      recursive true
      action :create
  end


  Chef::Log.info("Generating dotenv for app: #{application} with env: #{rails_env}...")

  begin
    Chef::Log.info("#{deploy[:deploy_to]}")
    Chef::Log.info(File.exists?("#{deploy[:deploy_to]}/shared/"))
    open("#{deploy[:deploy_to]}/shared/.env", 'w') do |f|
      require 'yaml'
      deploy[:app_env].to_h.each do |name, value|
        f.puts "#{name}=#{value.to_s}"
      end
    end
  rescue => e
    Chef::Log.info("Generating dotenv for app: #{application} with env: #{rails_env} failed")
    Chef::Log.info("#{e.message}")
  end  
end


