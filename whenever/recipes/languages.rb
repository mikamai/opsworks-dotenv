log "installing ttf-wqy-zenhei & ttf-wqy-microhei"

node[:deploy].each do |application, deploy|
  script "apt-get install ttf-wqy-zenhei" do
    interpreter "bash"
    user "root"
    code "apt-get install ttf-wqy-zenhei"
  end

  script "apt-get install ttf-wqy-microhei" do
    interpreter "bash"
    user "root"
    code "apt-get install ttf-wqy-microhei"
  end
end
