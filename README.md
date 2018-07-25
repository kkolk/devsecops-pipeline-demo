# DevSecOps Pipeline Demo

## Requirements

This demo uses Virtual box to deploy a local GitLab instance and configure it to run a DevSecOps Pipeline demo.  This demonstrates a DevSecOps kill-chain using the an application that contains the Struts2 vulnerability (CVE-2017-5638) made famous in the Equifax breach.

* VirtualBox
* Vagrant

You will also need the [Vagrant Host Manager plugin](https://github.com/devopsgroup-io/vagrant-hostmanager), you can install it with the following command:

`vagrant plugin install vagrant-hostmanager`

See <https://github.com/devopsgroup-io/vagrant-hostmanager> for more information on this plugin.

## Notes

On windows with UAC enabled, several pop-ups will appear asking for permission to modify the system/run as administrator related to the Landrush DNS plugin for Vagrant.   This is local DNS server is needed in order for the demo to operate correctly.