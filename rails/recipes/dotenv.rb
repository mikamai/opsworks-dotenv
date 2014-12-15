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

  Chef::Log.info("Generating dotenv for app: #{application} with env: #{rails_env}...")

  begin
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


