begin
  require 'vagrant'
rescue LoadError
  raise 'vagrant-mina must be loaded within Vagrant.'
end


module VagrantPlugins
  module Mina
    class Plugin < Vagrant.plugin('2')
      name 'mina'
      description 'Adds a mina provisioner to Vagrant.'

      config(:mina, :provisioner) do
        require_relative 'config'
        Config
      end

      provisioner(:mina) do
        I18n.load_path << File.expand_path(
          'locales/en.yml',
          Mina.source_root
        )
        I18n.reload!

        require_relative 'provisioner'
        Provisioner
      end
    end
  end
end
