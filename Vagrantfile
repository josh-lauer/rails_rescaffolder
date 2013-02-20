Vagrant::Config.run do |config|
  config.vm.box = "rescaffolder_base"
  config.vm.box_url = "https://s3.amazonaws.com/vagrant.cloudspace.com/cloudspace_ubuntu_12.04.box"
  config.vm.network :hostonly, "33.33.33.77"
  begin
    config.vm.share_folder("sayfie", "/srv/rescaffolder", "./", :nfs => File.exist?('./.vagrant'))
  rescue
    config.vm.share_folder "sayfie", "/srv/rescaffolder", "./"
  end

  config.vm.customize ["modifyvm", :id, "--memory", "2048", "--name", "ReScaffolder Development","--cpus", "2"]
  # config.vm.boot_mode = :gui

  config.ssh.private_key_path = File.join(ENV['HOME'], '.ssh', 'cs_vagrant.pem')

  config.vm.provision :chef_client do |chef|
    chef.chef_server_url = "https://api.opscode.com/organizations/cloudspace"
    chef.validation_key_path = "cloudspace-validator.pem"
    chef.validation_client_name = "cloudspace-validator"
    chef.node_name = "rails_rescaffolder_vagrant_#{ENV['USER']}"

    chef.add_recipe "ubuntu"
    chef.add_recipe "nfs"
    chef.add_recipe "mysql::client"
    chef.add_recipe "mysql::server"

    chef.json = {
      :mysql => {
        :server_root_password => 'password'
      }
    }
  end
end
