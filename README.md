# AWSeasy
 aws easy - an AWS CLI assited scripts

 jorgedlt@gmail.com -- 2016 JUN 28 -- 2016 AUG 18

#### -- add presentation video link - http://trentm.com/json/

## Prerequisites
This is meant to be used with AWS CLI environment in an UBUNTU/ec2 or UBUNTU/vagrant. And installed in the normal AWS recommended way.

	sudo apt-get update
	sudo apt-get upgrade
	sudo apt-get install -y python-pip
	sudo pip install awscli

	aws --version

	as this script relies on AWS CLI, please refer to this source document.
	- http://docs.aws.amazon.com/cli/latest/reference/

periodically;

	sudo pip install awscli --upgrade

## other system requirements

	sudo apt-get install -y ccze figlet

	**NOTE**: the other required bash functions will be included in .bash-genfunc

#### -- add some additional documentation on the installation and use of json
- http://trentm.com/json/ 

Now I'm using pjson, these shoudl be revisisted.

----

### Credentials - and Multi Enviroment & awswp were depricated

In favor of the ssh env pass technique

----

### Install Notes -  

My method is 

	normal gi clone
		rm -rf .awseasy/ && git clone https://usedid@bitbucket.org/sbdDigitalAccelerator/devops.awseasy.git
	
then a minor in place install

	cd devops.awseasy/ && git log --format=fuller | head -4 > /tmp/awseasy.ver && cd
	mv devops.awseasy/ .awseasy && mv /tmp/awseasy.ver .awseasy
	source .awseasy/awseasy  # or logout and log back in

making sure that   source .awseasy/awseasy is in your .bashrc, mine looks like this;

	 # Please do not modify the last few lines, they offer additional features for awseasy
	[ -z $AWS_ACCESS_KEY_ID ] && [ -z $AWS_SECRET_ACCESS_KEY ] || source .awseasy/awseasy

----

### AWS SecurityGroup commands

  sgls - AWS EC2 -- List SecurityGroup (Brief)
  
  sglsall - AWS EC2 -- List SecurityGroup with INBOUND & OUTBOUND rules
  
  sgstat - AWS EC2 -- Desc specific SecurityGroup with INBOUND & OUTBOUND rules
  
  sqscanip - AWS EC2 -- List all IPs in a common sorted and count pool, regardless of protocol or port

  sgauthaddi -- ADD authorize security group ingress
  
  sgauthdropi -- DROP authorize security group ingress
  
  sgauthaddo -- ADD authorize security group egress
  
  sgauthdropo -- DROP authorize security group egress

### AWS EC2 Commands

  ec2ls   - AWS EC2 -- List Nodes, long format - (awsls) 
    
  ec2desc - AWS EC2 -- Detail JSON dump of instance
  
  ec2stat - AWS EC2 -- breifly describe instances with key chosen parameters
  
  ec2who  - AWS EC2 -- Show which enviroment is active
  
  ec2start - AWS EC2 -- Start an EC2 Instance
  
  ec2stop - AWS EC2 -- Stop an EC2 Instance
  
  ec2kill - AWS EC2 -- Terminate an EC2 Instance
  
  ec2tag  - AWS EC2 -- re-tag

### AWS ELB commands

  elbls -- List ELBs
  
  elbstat -- AWS ELB Brief Description (Status)
  
  elbjoin -- ELB - Joins (connects) instance to ELB
  
  elbdump -- ELB - Dumps (disconnects) instance to ELB

### General Commands

  awsupdate - AWS CLI -- update awscli and required packages

  ec2type - List current ec2 list - as reference
  
  awseasy-version - List current ec2 list - as reference
  
  awshelp - AWS CLI -- help screen

### Network

  awsshowip - AWS CLI -- AWS VPC Show all private IPs active on subnet (QUICK)
  
  awsshowenc - AWS CLI -- AWS Shows ENC (Ethernet Interface) based list
  
### AWS S3 commands

  s3push - AWS CLI -- AWS/S3 push local data to s3
  
  s3pull - AWS CLI -- AWS/S3 pull get info from s3
  
  s3make - AWS CLI -- AWS/S3 make/create new s3 bucket
  
  s3ls - AWS CLI -- AWS/S3 list files
  
  s3deep - AWS CLI -- AWS/S3 list recursively

----

a similar but unrelated project - https://github.com/donnemartin/saws
