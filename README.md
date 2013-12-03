catsanddogs
===========

This is a demo for the Data + Visualization Toronto Meetup group. It uses the Google Maps API to visualize data about Toronto's licensed cats and dogs.

## Setup Instructions
  
### Pre-requisites
1. [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. [Vagrant](http://downloads.vagrantup.com/tags/v1.3.5)
  
### Booting Vagrant
Add the DVTO4 Vagrant Image to your local Vagrant cache:  
`vagrant box add dvto4 http://static.crowdriff.com/dvto/4/dvto4.box`  

Clone the repo and boot the Vagrant box:  

```
git clone http://github.com/dvto/dvto4.git
cd dvto4
vagrant up
```
  
Once the Vagrant box has booted,
  
```
vagrant ssh
cd /vagrant  
sudo service postgresql start
rails server  
```

The app is now available in your browser at `http://localhost:3000`
