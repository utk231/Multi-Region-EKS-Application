#!/bin/bash
url=https://online.utkarssr.people.aws.dev

flag=10

for ((n=0;n<1500;n++));
do 
if [[ $n -eq 10 ]]; then
        aws eks update-kubeconfig --name Multi-Region-EKS-ap-southeast-1-Cluster --region ap-southeast-1
        kubectl scale deploy -n default --replicas=0 --all
    else
        date; echo "$n" "$(curl -s --trace-time  $url | grep '<title>')" 
    fi
done

# To restore primary region application

aws eks update-kubeconfig --name Multi-Region-EKS-ap-southeast-1-Cluster --region ap-southeast-1
kubectl scale deploy -n default --replicas=1 --all

# If primary is up & running for 1 hour, the failover lambda will automatically scale down the seconmdary region
