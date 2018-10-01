# Nginx cookbook

## Requirements

- [x] Create an nginx cookbook that can provision a machine
- Run unit tests for:

  - [x] Apt update running correctly
  - [x] Nginx will install
  - [x] A reverse proxy template will be created
  - [x] A link will be created between the proxy.conf file in sites-available and sites-enabled
  - [x] A link will be removed between the default file in sites-available and sites-enabled



- Run integration tests for:

  - [x] Nginx is installed
  - [x] Nginx is running and is enabled
  - [x] Nginx is listening to port 80
  - [x] A request to localhost:80 should return 502 if the reverse proxy is working correctly


## How to use
- In your projects Berksfile, include this line:
```ruby
cookbook "nginx", git: "git@github.com:RCollettSG/NginxCookbook.git"
```
- Run this line in your console:
```bash
berks vendor cookbooks
```
- This cookbook is now ready to provision! For vagrant use this in your Vagrantfile:
```ruby
config.vm.provision("chef_solo") do |chef|
    chef.add_recipe("nginx::default")
  end
```
