module VagrantPlugins
  module Mina
    class Config < Vagrant.plugin('2', :config)
      attr_accessor :verbose
      attr_accessor :simulate
      attr_accessor :trace
      attr_accessor :deploy_file
      attr_accessor :task

      def initialize
        self.verbose     = UNSET_VALUE
        self.simulate    = UNSET_VALUE
        self.trace       = UNSET_VALUE
        self.deploy_file = 'config/deploy.rb'
        self.task        = UNSET_VALUE
      end

      def finalize!
        self.verbose     = nil if verbose     == UNSET_VALUE
        self.simulate    = nil if simulate    == UNSET_VALUE
        self.trace       = nil if trace       == UNSET_VALUE
        self.deploy_file = nil if deploy_file == UNSET_VALUE
        self.task        = nil if task        == UNSET_VALUE
      end

      def validate(machine)
        errors = []

        #if deploy_file
        #  unless Pathname.new(deploy_file).expand_path(machine.env.root_path).file?
        #    errors << I18n.t(
        #      'vagrant.provisioners.mina.file_path_invalid',
        #      :path => expanded_path
        #    )
        #  end
        #else
        #  errors << I18n.t('vagrant.provisioners.mina.no_deploy_file')
        #end

        { 'Mina provisioner' => errors }
      end
    end
  end
end
