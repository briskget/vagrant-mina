module VagrantPlugins
  module Mina
    def self.source_root
      @source_root ||= Pathname.new(File.expand_path('../..', __FILE__))
    end
  end
end

require 'vagrant-mina/version'
require 'vagrant-mina/plugin'
