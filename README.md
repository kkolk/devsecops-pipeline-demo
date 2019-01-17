# DevSecOps Pipeline Demo

## Requirements

This demo uses Virtual box to deploy a local GitLab instance and configure it to run a DevSecOps Pipeline demo.  This demonstrates a DevSecOps Pipeline using an application that contains the Struts2 vulnerability (CVE-2017-5638) made famous in the Equifax breach.

### Pre-requisites

* VirtualBox
* Vagrant
* Python

You will also need the [Vagrant Host Manager plugin](https://github.com/devopsgroup-io/vagrant-hostmanager), you can install it with the following command:

```
vagrant plugin install vagrant-hostmanager
```

See <https://github.com/devopsgroup-io/vagrant-hostmanager> for more information on this plugin.

This demo assumes that 192.168.100.0/24 is available for host only network use.  You will need to adjust the vagrantfile if this is not the case.

### System Requirements

* Virtual Machine for the Gitlab demo uses 8gb of ram and 2 vCPUs.
* Virtual Machine for hosting the exploitable site uses 512mb of ram and 1 vCPU.

## Getting Started

Clone the repo and in the folder execute:

```
vagrant up
```

Vagrant will:

1. Provision 2 new VMs
2. Execute Ansible to install docker, gitlab, gitlab-runner on a **Gitlab** VM.
3. Perform some base configuration of Gitlab including setting up the default root account password and an API key
4. Register the gitlab-runner with gitlab.
5. Import the struts2-rce from https://github.com/kkolk/struts2-rce/tree/master as a new project in Gitlab.
6. Execute Ansible to install docker and setup an SSH-key for Gitlab on a **Dev** VM to serve as a running host for the struts2-rce app.

Once Vagrant has finished it's work, you can access Gitlab at https://gitlab.vagrant.test/ (192.168.100.10).

Default password for Gitlab's root account has been set to '`DevSecOps`' this can be altered before running vagrant up by adjusting the settings in `/group_vars/all.yml`.

## Executing a Build

Once logged in you should see the Projects view with a single project showing **'Administrator / struts2-rce'** click on that project to open it.

You should now see the struts2-rce repository, to launch a build of the project select **CI/CD** on the left hand menu, then click **pipelines**.

The pipelines screen will appear showing that there are currently no pipelines.  Click the **Run Pipeline** button, accept the default values, and click **Create Pipeline**.

This will build the application, create a docker container, and deploy it to a test host.   Once the **deploy_development** step is completed, you can verify that tomcat is running the struts2-rce app by visiting: http://dev.vagrant.test:8080/orders

## Testing the exploit

Run the exploit.py file with a command of your choice. 

```
python exploit.py http://dev.vagrant.test:8080/orders/3 "%CMD%" 
```

Try with different CMDs like

- `pwd` - where are we?
- `whomai` - what user are we running this?
- `ls -la` - what's in my directory?
- `ls /` - what's my machine
- `ls /etc` - what else we can find?
