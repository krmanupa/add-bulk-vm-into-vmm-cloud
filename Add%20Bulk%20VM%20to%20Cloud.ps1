# Add Bulk VM to Cloud
# Author Robert Smit
# Company @ClusterMVP
# Date April 10, 2015
# Version 1.0


#set cloud 
$cloud = Get-SCCloud -Name "Tenant"

# Get all VM Adjust parameter
get-VM | Where-Object Name -Like WAPload* |ft name, selfserviceuserrole,owner

#get All VM's without a Cloud
get-VM | Where-Object Name -Like WAPload* | Where-Object {-not $_.cloud} |ft name 

#place VM in Variable
$vmtocloud=get-VM | Where-Object Name -Like WAPload* | Where-Object {-not $_.cloud} |ft name 
#show Slected VM
$vmtocloud |ft name 

#Place VM in selected Cloud
$vmtocloud=get-VM | Where-Object Name -Like WAPload* | Where-Object {-not $_.cloud} |Set-VM -Cloud $cloud

