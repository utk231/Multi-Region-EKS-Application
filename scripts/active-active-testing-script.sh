#!/bin/bash
url=https://ga.utkarssr.people.aws.dev

flag=10

for ((n=0;n<120;n++));
do 
    if [[ $n -eq $flag ]]; then
        aws eks update-kubeconfig --name Multi-Region-EKS-ap-southeast-1-Cluster --region ap-southeast-1
        kubectl scale deploy -n default --replicas=0 --all   #Scaling primary region down
        flag=0
    else
        date; echo "$n" "$(curl -s --trace-time  $url | grep '<title>')" 
    fi
done

# Keeping setup ready for Active-Passive Failover testing

aws eks update-kubeconfig --name Multi-Region-EKS-ap-southeast-2-Cluster --region ap-southeast-2
kubectl scale deploy -n default --replicas=0 --all 
aws eks update-kubeconfig --name Multi-Region-EKS-ap-southeast-1-Cluster --region ap-southeast-1
kubectl scale deploy -n default --replicas=10 --all   
 

