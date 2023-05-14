# -*- mode: ruby -*-
# vim: set ft=ruby :

MACHINES = {
  :otuslinux => {
        :box_name => "centos/7",
        :ip_addr => '192.168.56.101',
	:disks => {
		:sata1 => {
			:dfile => './sata1.vdi',
			:size => 250,
			:port => 1
		},
		:sata2 => {
                        :dfile => './sata2.vdi',
                        :size => 250, # Megabytes
			:port => 2
		},
                :sata3 => {
                        :dfile => './sata3.vdi',
                        :size => 250,
                        :port => 3
                },
                :sata4 => {
                        :dfile => './sata4.vdi',
                        :size => 250, # Megabytes
                        :port => 4
                },
                :sata5 => {
                        :dfile => './sata5.vdi',
                        :size => 250, # Megabytes
                        :port => 5
                },
                :sata6 => {
                        :dfile => './sata6.vdi',
                        :size => 250, # Megabytes
                        :port => 6
                },
                :sata7 => {
                        :dfile => './sata7.vdi',
                        :size => 250, # Megabytes
                        :port => 7
                },
                :sata8 => {
                        :dfile => './sata8.vdi',
                        :size => 250, # Megabytes
                        :port => 8
                },
                :sata9 => {
                        :dfile => './sata9.vdi',
                        :size => 250, # Megabytes
                        :port => 9
                },
                :sata10 => {
                        :dfile => './sata10.vdi',
                        :size => 250, # Megabytes
                        :port => 10
                },
                :sata11 => {
                        :dfile => './sata11.vdi',
                        :size => 250, # Megabytes
                        :port => 11
                },
                :sata12 => {
                        :dfile => './sata12.vdi',
                        :size => 250, # Megabytes
                        :port => 12
                },
                :sata13 => {
                        :dfile => './sata13.vdi',
                        :size => 250, # Megabytes
                        :port => 13
                },
                :sata14 => {
                        :dfile => './sata14.vdi',
                        :size => 250, # Megabytes
                        :port => 14
                },
                :sata15 => {
                        :dfile => './sata15.vdi',
                        :size => 250, # Megabytes
                        :port => 15
                }


	}

		
  },
}

Vagrant.configure("2") do |config|

  MACHINES.each do |boxname, boxconfig|

      config.vm.define boxname do |box|

          box.vm.box = boxconfig[:box_name]
          box.vm.host_name = boxname.to_s

          #box.vm.network "forwarded_port", guest: 3260, host: 3260+offset

          box.vm.network "private_network", ip: boxconfig[:ip_addr]

          box.vm.provider :virtualbox do |vb|
            	  vb.customize ["modifyvm", :id, "--memory", "1024"]
                  needsController = false
		  boxconfig[:disks].each do |dname, dconf|
			  unless File.exist?(dconf[:dfile])
				vb.customize ['createhd', '--filename', dconf[:dfile], '--variant', 'Fixed', '--size', dconf[:size]]
                                needsController =  true
                          end

		  end
                  if needsController == true
                     vb.customize ["storagectl", :id, "--name", "SATA", "--add", "sata" ]
                     boxconfig[:disks].each do |dname, dconf|
                         vb.customize ['storageattach', :id,  '--storagectl', 'SATA', '--port', dconf[:port], '--device', 0, '--type', 'hdd', '--medium', dconf[:dfile]]
                     end
                  end
          end
 	  box.vm.provision "shell", inline: <<-SHELL
	      mkdir -p ~root/.ssh
              cp ~vagrant/.ssh/auth* ~root/.ssh
	      yum install -y mdadm smartmontools hdparm gdisk
  	  SHELL

      end
  end
end
