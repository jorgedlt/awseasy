# awseasy

readme.md

# AWSeasy
 aws easy - an AWS CLI assited scripts

 jorgedlt@gmail.com -- 2016 June 28 --

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

----

### Credentials - and Multi Enviroment -- awswp (aws swap)

	vagrant@vagrant:~/.aws$ ll
	-rw------- 1 vagrant vagrant  82 Jun 27 19:36 config
	-rw------- 1 vagrant vagrant 118 Jun 30 18:00 credentials
	-rw------- 1 vagrant vagrant 116 Jun 15 15:24 creds.dev
	-rw------- 1 vagrant vagrant 117 Jun 21 15:04 creds.jkn
	-rw------- 1 vagrant vagrant 118 Jun 28 17:48 creds.lcy
	-rw------- 1 vagrant vagrant 118 Jun 15 15:31 creds.prd
	-rw------- 1 vagrant vagrant 118 Jun 15 15:28 creds.stg
	-rw------- 1 vagrant vagrant 117 Jun 28 17:48 creds.tst

these files are to follow this pattern

file creds.X.dev

	[CompanyX - DEV]
	dev_AWS_ACCESS_KEY_ID=xxxxxxxxxxxxxxx
	dev_AWS_SECRET_ACCESS_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

file creds.X.prd

	[CompanyX - PROD]
	AMAZON_ACCESS_KEY_ID=xxxxxxxxxxxxxxx
	AMAZON_SECRET_ACCESS_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

permission should be set -rw------- as per AWS norms.

	chmod 0400 creds.X.dev creds.X.prd

for now the script will have to be edited to account for other enviroment
- future feature this will be configure via a sepearate yaml file

----


###. AWS EC2 Commands

####.  awsls - AWS EC2 -- List Nodes, long format - awsls
####.  awsdesc - AWS EC2 -- Detail JSON dump of instance
####.  awsquick - AWS EC2 -- describe instances with key choosen parameters
####.  awswho - AWS EC2 -- Show which enviroment is active
####.  awsswp - AWS -- Swap AUTH creds for AWS/CLI access
####.  awsstart - AWS EC2 -- Start an EC2 Instance
####.  awsstop - AWS EC2 -- Stop an EC2 Instance
####.  awskill - AWS EC2 -- Terminate an EC2 Instance
####.  awshelp - AWS CLI -- help screen

##. AWS SecurityGroup commands

###.  awslsg - AWS EC2 -- List Nodes, short format with SecurityGroup
###.  awssgdesc - AWS EC2 -- List Nodes, short format with SecurityGroup

##. AWS S3 commands

####.  s3show - AWS CLI -- AWS/S3 list top level folders
####.  s3push - AWS CLI -- AWS/S3 push local data to s3
####.  s3pull - AWS CLI -- AWS/S3 pull get info from s3
####.  s3make - AWS CLI -- AWS/S3 make/create new s3 bucket
####.  s3ls - AWS CLI -- AWS/S3 list files
####.  s3deep - AWS CLI -- AWS/S3 list recursively
####.  awsupdate - AWS CLI -- update awscli and required packages

----

a similar but unrelated project - https://github.com/donnemartin/saws
