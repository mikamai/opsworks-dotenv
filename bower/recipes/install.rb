node[:deploy].each do |_, deploy|
  script "install_bower" do
    interpreter "bash"
    user "root"
    code "npm install -g bower"
  end
end
