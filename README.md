# Rails tutorial

This project follows along with the Rails tutorial at
http://code.tutsplus.com/tutorials/zero-to-sixty-creating-and-deploying-a-rails-app-in-under-an-hour--net-8252.
There have been some changes to Rails since this was put together.
Also, this project deploys Rails in a VM, which requires some other
provisioning adjustments.

## Following along with the Tutorial

The
[tutorial](http://code.tutsplus.com/tutorials/zero-to-sixty-creating-and-deploying-a-rails-app-in-under-an-hour--net-8252)
breaks things down by assumed time interval.  I'm following those time
markings, and adding notes for each below.

## Before Twenty

`vagrant up` should set up the complete environment.

* See notes in the `Vagrantfile` and `provision.sh`
* There are some errors in the output (eg, "bash: cannot set terminal
  process group (...): Inappropriate ioctl for device"), but these
  don't appear to be fatal.

After log in with `vagrant ssh`, was given a message "System restart
required", so rebooted:

```
$ vagrant ssh
$ sudo reboot
$ vagrant ssh  # kicked out, relog in
```

## Twenty

At this point, switching over to the tutorial at
http://guides.rubyonrails.org/getting_started.html

Building the project in the /vagrant folder, as the `Vagrantfile` has
a synced_folder `blog`.


```
$ vagrant ssh
$ cd /vagrant
$ rails new blog
```

Start the server:

```
$ cd /vagrant/blog
$ bin/rails server -b 0.0.0.0
```

Note re `-b`: Rails 4.2 only accepts connections from localhost by
default, so you can only access the server from localhost (eg. inside
the VM); connections from another machine (eg. VM's host) will not
work.  Can change the binding with `-b` so that anything can connect,
including the host machine.

```
vagrant@rails:/vagrant/bookshelf$ rails server -b 0.0.0.0
=> Booting WEBrick
=> Rails 4.2.6 application starting in development on http://0.0.0.0:3000
=> Run `rails server -h` for more startup options
=> Ctrl-C to shutdown server
[2016-03-28 22:18:38] INFO  WEBrick 1.3.1
[2016-03-28 22:18:38] INFO  ruby 2.1.3 (2014-09-19) [x86_64-linux]
[2016-03-28 22:18:38] INFO  WEBrick::HTTPServer#start: pid=31345 port=3000
```

Can see the site at http://172.28.33.10:3000/, due to the private network set up.

