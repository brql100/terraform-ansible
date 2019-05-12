# Worpress site on AWS

Using Terraform and Ansible

## How to use

First of all, create an AWS user. Keep its *ACCESS_KEY* and *SECRET_ACCESS_KEY*.
You will also need a key to connect in your instances.

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