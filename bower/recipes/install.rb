node[:deploy].each do |_, deploy|
  script "install_bower" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
    code "npm install -g bower"
  end
end
