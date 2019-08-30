#set -x
#for vpc in `aws ec2 describe-instances --query 'Reservations[*].Instances[*].VpcId' --output text | sort -u`
#do
#  for interface in `aws ec2 describe-instances --filters \"Name=vpc-id,Values=$vpc\"`
# #    aws logs get-log-events --log-group-name cfg-cloudwatch-$vpc  --log-stream-name  $interface-all | jq .events[].message | awk '{ print $4 }' | sort -u
#    echo "ba"
#  done
#done

#"cfg-cloudwatch-vpc-5ef0b731"
#"cfg-cloudwatch-vpc-64c92c01"

aws logs get-log-events --log-group-name cfg-cloudwatch-$vpc  --log-stream-name  $interface-all | jq .events[].message | awk '{ print $4 }' | sort -u

for i in eni-9263bfe5 eni-23395d54 eni-deaa76f5 eni-5c925a07 eni-bf1fde93 eni-8c20e1a0 eni-7d088451 eni-d90985f5 eni-e1c0e3ac eni-d7b6d298 eni-c855a588 eni-06ed5423 eni-8fb8e49e eni-614fef78 eni-0e09536cba5691e02 eni-001f2b13f5897cb11 eni-08b4a1e193a266c8d eni-091ebebcea03e4ebf eni-0feb6c6cc049f8822
do
  echo $i
  aws logs get-log-events --log-group-name  cfg-cloudwatch-vpc-5ef0b731  --log-stream-name  $i-all | jq .events[].message | awk '{ print $4 }' | sort -u > $i.log 2>&1
done
