catsanddogs
===========

This is a demo for the Data + Visualization Toronto Meetup group. It uses the Google Maps API to visualize data about Toronto's licensed cats and dogs.

## Setup Instructions
  
### Pre-requisites
1. [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. [Vagrant](http://downloads.vagrantup.com/tags/v1.3.5)
  
### Installing Dependencies
Download a base Ubuntu Vagrant box using:

```
vagrant box add precise32 http://files.vagrantup.com/precise32.box
```

Clone this repo, run `vagrant up` in the repo, and wait for the box to boot. Then,

```
vagrant ssh
wget http://bit.ly/dvto4 -O - | bash
```

This will take about ~30 minutes to install Postgres, RVM, Ruby, Rails and all other dependencies. Then, in the same shell, run:

```
source ~/.bashrc  
cd /vagrant  
rails server  
``` 

The app is now available in your browser at `http://localhost:3000`
