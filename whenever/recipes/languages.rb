log "installing ttf-wqy-zenhei & ttf-wqy-microhei"

node[:deploy].each do |application, deploy|
  script "apt-get -y install ttf-wqy-zenhei" do
    interpreter "bash"
    user "root"
    code "apt-get -y install ttf-wqy-zenhei"
  end

  script "apt-get -y install ttf-wqy-microhei" do
    interpreter "bash"
    user "root"
    code "apt-get -y install ttf-wqy-microhei"
  end
end
