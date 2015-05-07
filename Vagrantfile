#!/usr/bin/env ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'chef/centos-6.6'
  config.vm.provision 'mina', type: 'mina' do |m|
    m.task        = 'deploy'
    m.deploy_file = 'deploy.rb'
    m.trace       = true
    m.verbose     = true
  end
end
