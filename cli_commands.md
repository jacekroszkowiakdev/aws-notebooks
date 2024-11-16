aws ec2 run-instances --image-id "ami-00ec1ed16f4837f2f" --instance-type "t2.micro" --key-name "vockey" --network-interfaces '{"SubnetId":"subnet-086a5307b9656be67","AssociatePublicIpAddress":true,"DeviceIndex":0,"Groups":["sg-05436a353e943297c"]}' --credit-specification '{"CpuCredits":"standard"}' --tag-specifications '{"ResourceType":"instance","Tags":[{"Key":"Name","Value":"docker-web-server"}]}' --metadata-options '{"HttpEndpoint":"enabled","HttpPutResponseHopLimit":2,"HttpTokens":"required"}' --private-dns-name-options '{"HostnameType":"ip-name","EnableResourceNameDnsARecord":false,"EnableResourceNameDnsAAAARecord":false}' --count "1"