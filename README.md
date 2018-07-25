# DevSecOps Pipeline Demo

## Requirements

This demo uses Virtual box to deploy a local GitLab instance and configure it to run a DevSecOps Pipeline demo.  This demonstrates a DevSecOps Pipeline using the an application that contains the Struts2 vulnerability (CVE-2017-5638) made famous in the Equifax breach.

You will need:

* VirtualBox
* Vagrant

You will also need the [Vagrant Host Manager plugin](https://github.com/devopsgroup-io/vagrant-hostmanager), you can install it with the following command:

`vagrant plugin install vagrant-hostmanager`

See <https://github.com/devopsgroup-io/vagrant-hostmanager> for more information on this plugin.

This demo assumes that 192.168.100.0/24 is available for host only network use.  You will need to adjust the vagrantfile if this is not the case.

Virtual Machine for the demo uses 8gb of ram and 2 vCPUs.

## Usage

Clone the repo and in the folder execute:

`vagrant up`

Vagrant will:

1. Provision a new VM
2. Execute Ansible to install docker, gitlab, gitlab-runner
3. Perform some base configuration of Gitlab including setting up the default root account password and an API key
4. Register the gitlab-runner with gitlab.
5. Import the struts2-rce from https://github.com/kkolk/struts2-rce/tree/master as a new project in Gitlab.

Once vagrant has finished it's work, you can access Gitlab at https://gitlab.vagrant.test/ (192.168.100.10).

Default password for Gitlab's root account has been set to 'zdYD9wLzE4jb' this can be altered before running vagrant up by adjusting the settings in ./group_vars/all.yml

