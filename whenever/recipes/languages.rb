log "installing ttf-wqy-zenhei & ttf-wqy-microhei"

node[:deploy].each do |application, deploy|
  execute 'apt-get install ttf-wqy-zenhei' do
    command 'apt-get install ttf-wqy-zenhei'
    ignore_failure true
    only_if { apt_installed? }
  end

  execute 'apt-get install ttf-wqy-microhei' do
    command 'apt-get install ttf-wqy-microhei'
    ignore_failure true
    only_if { apt_installed? }
  end
end
