
# to do

### on sgstat & shauthaddi/sgauthdropi I should 

An error occurred (InvalidGroupId.Malformed) when calling the DescribeSecurityGroups operation: 
Invalid id: "i-0d9566a2e1c8fe35d" (expecting "sg-...")

before line 7 add something to gracifully verify a valid sg (I tend to put instance ID by mistakes)

--group-ids ${1} start


### add something to rotate through all AZ's 

ie.. 

 us-east-1
 us-east-2
 us-west-1
 us-west-2
...

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
 ....
