# vagrant-mina

A [Vagrant](http://www.vagrantup.com/) plugin to provision virtual machines with [mina](https://github.com/mina-deploy/mina).

## Installation

```
$ vagrant plugin install vagrant-mina
```

## Usage

### In the Vagrantfile

Use `:mina` as the provisioner in your Vagrantfile:

``` ruby
Vagrant.configure('2') do |config|
  config.vm.box = 'chef/centos-6.6'
  config.vm.provision(:mina) do |mina|
    mina.task        = 'deploy'
    mina.deploy_file = 'deploy.rb'
    mina.trace       = true
    mina.verbose     = true
  end
end
```

## Options

The following options can be set:
  verbose     = true                #optional
  simulate    = true                #optional
  trace       = true                #optional
  deploy_file = 'config/deploy.rb'  #required
  
## Need Help or Want to Contribute?

All contributions are welcome: ideas, patches, documentation, bug reports,
complaints

It is more important to me that you are able to contribute and get help if you
need it..

Basic Guidelines

* Have an idea or a feature request? File a ticket on
  [github](https://github.com/briskget/vagrant-mina/issues)
* If you think you found a bug, it probably is a bug. File it on
  [github](https://github.com/briskget/vagrant-mina/issues)
* If you want to send patches, best way is to fork this repo and send me a pull
  request.

## License

[MIT](http://opensource.org/licenses/MIT)
