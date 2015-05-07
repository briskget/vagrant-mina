module VagrantPlugins
  module Mina
    class Provisioner < Vagrant.plugin('2', :provisioner)

      def initialize(machine, config)
        super
      end

      def provision
        command = ['mina'].concat(compile_options).join(' ')

        r, io = IO.pipe
        fork do
          system(command, out: io, err: :out)
        end
        io.close
        r.each_line do |l|
          puts l
        end

        # alternate to the above command
        #IO.popen(command2).each do |line|
        #  p line.chomp
        #end

        # alternate to the above command but
        # this is broken based on what I was trying to accomplish
        #Vagrant::Util::Subprocess.execute(*command) do |type, data|
        #  if type == :stdout || type == :stderr
        #    machine.env.ui.info(data.chomp, :prefix => false)
        #  end
        #end

        #in case we want to send stuff to the vm
        #machine.communicate.tap do |comm|
        #  comm.execute(command) do |type, data|
        #    color = type == :stdout ? :green : :red

        #    options = {
        #        new_line: false,
        #        prefix: false,
        #    }
        #    options[:color] = color if !config.keep_color

        #    machine.env.ui.info(data, options)
        #  end
        #end

      end

      private

      def compile_options
        options = []
        options << '--verbose' if config.verbose
        options << '--simulate' if config.simulate
        options << '--trace' if config.trace
        options << "-f #{config.deploy_file}" if config.deploy_file
        options << config.task if config.task
        return options
      end
    end
  end
end
