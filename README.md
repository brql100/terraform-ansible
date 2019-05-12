# Worpress site on AWS

Using Terraform and Ansible

## How to use

First of all, create an AWS user. Keep its *ACCESS_KEY* and *SECRET_ACCESS_KEY*.
You will also need a key to connect in your instances.

Remember that this key **must** be created in the same region you are creating your resources using terraform. And its permissions must be *0400*.

Now, use the Vagrantfile to boot up a VM in order to install our stuff.

```
vagrant up
vagrant ssh master
```

In our master VM, install terraform:

```
curl -O https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip
yum install -y unzip git
unzip terraform_0.11.1_linux_amd64.zip
chmod +x terraform
mv terraform /usr/bin/
terraform version
```

Now, we need to get our files into our VM:

```
git clone https://github.com/mschirbel/terraform-ansible.git
cd terraform-ansible/
```

Now, we initiate our terraform folder:

```
cd terraform/
terraform init/
```

And we create our infrastructure:

```
terraform apply
```

Now, we go into our NAT instance:

```
ssh ec2-user@<NAT PUBLIC IP> -i ansible.pem
```

For our ansible example, we are going to use the Wordpress-nginx [from the offical GitHub repo](https://github.com/ansible/ansible-examples/tree/master/wordpress-nginx).

Download this file by using:

```
git clone https://github.com/ansible/ansible-examples/tree/master/wordpress-nginx.git
cd wordpress-nginx
```

Now we need to install Ansible:

```
sudo su - 
yum install ansible -y
```

Now move the hosts file to /etc/ansible:

```
mv hosts /etc/ansible
```

This hosts file looks like this:

```
[webserver]
<webserver-private-ip>

[database]
<database-private-ip>
```

Change it to use our private IP from the webserver/database instances.
