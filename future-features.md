
# to do

## show ec2-instance-limits

aws gamelift describe-ec2-instance-limits --ec2-instance-type t2.small

or 

aws gamelift describe-ec2-instance-limits

## New S3 Size and Age scanner - add to main code

	#
	Buckets=$(aws s3 ls| awk '{print $3}')
	for b in $Buckets; do
	    S3raw=$(aws s3 ls s3://${b} --summarize --human-readable --recursive )   # has to go
	
	    S3bsize=$(echo "${S3raw}" | grep 'Total.Size' | cut -d':' -f2 | tr -s ' ')
	    S3bfiles=$(echo "${S3raw}" | grep 'Total.Objects' | cut -d':' -f2 | tr -s ' ')
	
	
	    S3raw2=$(echo "${S3raw}" | grep '^20' | awk '{print $1}' | sort | uniq -c )
	    S3dused=$(echo "${S3raw2}" | wc -l | tr -d ' ' )
	    S3since=$(echo "${S3raw2}" | head -1 | awk '{print $2}')
	    S3last3=$(echo "${S3raw2}" | tail -3 )
	
	    # no activity
	    S3last=$(echo "${S3raw2}" | tail -1 | awk '{print $2}')
	    S3quiet=$(echo "$(( ($(gdate +%s) - $(gdate --date="${S3last}" +%s) )/(60*60*24) )) days")
	
	    echo "  $b"
	    descDUMP 'Bucket Size' "${S3bsize}" 'Files' "${S3bfiles}"
	    descDUMP Since "${S3since}" Last "${S3last}"
	    descDUMP 'Days Used' "${S3dused}" 'Dormant' "${S3quiet}"
	    echo "${RESET}"
	done
	#


## add version info for lambda

see notes from 25MAY2017

## add apiGW

add at least apigwls
  - concat api url based on serial number plus known.region.aws.domain.com

## tweak cfls and cfstat

to include DomainName for cf and actual like API URL

## on sgstat & shauthaddi/sgauthdropi I should

An error occurred (InvalidGroupId.Malformed) when calling the DescribeSecurityGroups operation:
Invalid id: "i-0d9566a2e1c8fe35d" (expecting "sg-...")

before line 7 add something to gracifully verify a valid sg (I tend to put instance ID by mistakes)

--group-ids ${1} start


## add something to rotate through all AZ's

ie..

 us-east-1
 us-east-2
 us-west-1
 us-west-2

'''
 for az in $(aws ec2 describe-regions | grep Endpoint | awk '{print $2}' \
 | cut -d'.' -f2 | grep -v 'sa-east-1' | grep -v 'ca-east-1' ); do

    export AWS_DEFAULT_REGION="$az"
    echo ${RESET}

    echo $az
    echo "      with 4.3 - $(aws lambda list-functions | grep "Runtime" | grep -c nodejs4.3)"
    echo "      not 4.3 - $(aws lambda list-functions | grep "Runtime" | grep -vc nodejs4.3)"
    echo ${RESET}
 done

 ap-south-1
      with 4.3 - 0
      not 4.3 - 0
eu-west-2
      with 4.3 - 0
      not 4.3 0
'''

### More IAM features

downplay iamls ... more simple 'iamls | egrep 'UserName|UserId''

         add a iamstat <UserID>
         
         iamadd & iamdel -- https://docs.google.com/document/d/1CAhmsqNaYvDNDTbryo0zEBkr6utAVGJdOdOdbqDwF14


## How to delete a VPC with --all-dependencies

### aws ec2 describe-subnets --filters Name=vpc-id,Values=<VPC-ID>

aws ec2 describe-subnets --filters Name=vpc-id,Values=vpc-6a15ab03 |
  egrep 'Value|SubnetId|AvailableIpAddressCount'

    aws ec2 delete-subnet --subnet-id=subnet-4f017b73
    aws ec2 delete-subnet --subnet-id=subnet-b003798c

### aws ec2 describe-network-acls --filters Name=vpc-id,Values=<vpc-id>

### aws ec2 describe-internet-gateways --filters Name=vpc-id,Values=<vpc-id>

    aws ec2 detach-internet-gateway --internet-gateway-id=igw-1acc367c --vpc-id=vpc-cb5456ad

    aws ec2 delete-internet-gateway --internet-gateway-id=igw-1acc367c

### aws ec2 describe-route-tables --filters Name=vpc-id,Values=<vpc-id>

 aws ec2 describe-route-tables
 aws ec2 delete-route-table --route-table-id rtb-0ab0eb73

 aws ec2 describe-security-groups

 aws ec2 describe-security-groups --filters Name=vpc-id,Values=vpc-6a15ab03 |
  egrep 'VpcId|GroupName|GroupId'

also -
aws ec2 describe-security-groups --filters Name=vpc-id,Values=vpc-6a15ab03  --output table

aws ec2 delete-security-group --group-id sg-64bfe01b

#### Finally !!
aws ec2 delete-vpc --vpc-id=vpc-cb5456ad


###

extra notes form initial vpc .. add 24APR2017

# source vpcstat ; vpcstat vpc-665b5601

aws ec2 describe-security-groups --filters Name=vpc-id,Values=vpc-665b5601 \
--query 'SecurityGroups[*].{Name:GroupName,ID:GroupId}'

aws ec2 describe-security-groups --filters Name=vpc-id,Values=vpc-665b5601 \
--query 'SecurityGroups[*].{ID:GroupId}'

# this is a correct formated query with grep and/or tr
aws ec2 describe-security-groups --filters Name=vpc-id,Values=vpc-665b5601 --query 'SecurityGroups[*].{ID:GroupId}' --output text
sg-33b5a549
sg-78b5a502
sg-79b5a503
sg-bcb4a4c6

# try

these kind of work ...
2032  2017-04-23 19:57:09  aws ec2 describe-security-groups --filters Name=vpc-id,Values=vpc-665b5601 --query 'SecurityGroups[*].{Description:value, ID:GroupId}'
2033  2017-04-23 19:57:49  aws ec2 describe-security-groups --filters Name=vpc-id,Values=vpc-665b5601 --query 'SecurityGroups[*].{Description:text, ID:GroupId}'
2034  2017-04-23 19:57:58  aws ec2 describe-security-groups --filters Name=vpc-id,Values=vpc-665b5601 --query 'SecurityGroups[*].{Description:name, ID:GroupId}'

# Query all instances with security group rule matching (to-port 22 and from-cidr 0.0.0.0/0) not working as expected
https://github.com/aws/aws-cli/issues/971

# DIYZprod
aws ec2 describe-security-groups --filters Name=ip-permission.from-port,Values=22 Name=ip-permission.to-port,Values=22 Name=ip-permission.cidr,Values='0.0.0.0/0' --query 'SecurityGroups[*].{Name:GroupName}'
[
    {
        "Name": "DIYZ-PROD-NetworkSecurity-EDD2EORSC7WU-PublicCoreSG-LZTSTRZTU8E0"
    }
]

# !!

	aws rds describe-db-instances --query 'DBInstances[].DBInstanceIdentifier'
	[
	    "international-papers",
	    "wr-mahrt"
	]
	
	aws rds describe-db-instances --query 'DBInstances[].{DBInstanceIdentifier:DBInstanceClass}'
	[
	    {
	        "DBInstanceIdentifier": "db.t2.medium"
	    },
	    {
	        "DBInstanceIdentifier": "db.t2.medium"
	    }
	]
