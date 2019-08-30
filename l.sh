for each in `grep ^eni no | awk '{ print $1 }' `
do
  echo $each; aws logs get-log-events --log-group-name  cfg-cloudwatch-vpc-5ef0b731  --log-stream-name  $each-all --query "events[].message" | awk '{ print $4 }' | sort -u 
  if [ $? -ne 0 ]
  then
    echo "issue: $each"
  fi
done

