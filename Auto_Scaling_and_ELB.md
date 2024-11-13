## Elastic Load Balancing (ELB)

**ELB** automatically distributes incoming application traffic across multiple Amazon Elastic Compute Cloud (**Amazon EC2**) instances. ELB provides the required load balancing capacity to route application traffic, helping you achieve fault tolerance in your applications.

1. Choose an `Application Load Balancer` when you need a flexible feature set for your applications with HTTP and HTTPS traffic. Operating at the request level, Application Load Balancers provide advanced routing and visibility features targeted at application architectures, including microservices and containers.

2. Choose a `Network Load Balancer` when you need ultra-high performance, TLS offloading at scale, centralized certificate deployment, support for UDP, and static IP addresses for your applications. Operating at the connection level, Network Load Balancers are capable of handling millions of requests per second securely while maintaining ultra-low latencies.

3. Choose a `Gateway Load Balancer` when you need to deploy and manage a fleet of third-party virtual appliances that support GENEVE. These appliances enable you to improve security, compliance, and policy controls.

## Auto Scaling

**Auto Scaling** helps you maintain application availability and enables you to scale your Amazon EC2 capacity **in** or **out** automatically based on conditions that you define. Auto Scaling helps ensure that you are running the desired number of EC2 instances by:

-   **Increasing capacity** during demand spikes to maintain performance.
-   **Decreasing capacity** during low-traffic periods to reduce costs.

Auto Scaling is particularly well-suited for applications with:

-   **Stable demand patterns**
-   **Variable usage** such as hourly, daily, or weekly fluctuations

### Scaling Types

There are two main types of scaling to consider when optimizing your application infrastructure:

1. **Horizontal Scaling**: Adding or removing instances (or servers) to manage load. This approach involves adjusting the number of EC2 instances to distribute traffic and workload evenly, making it highly suitable for applications that need to handle significant increases in concurrent traffic.

2. **Vertical Scaling**: Increasing or decreasing the capacity of individual instances (e.g., upgrading an instance to a more powerful one). Vertical scaling is useful for applications that require more memory, CPU, or storage on a single instance, but it is limited by the capacity of the largest available instance.

Both scaling strategies can be used in combination to effectively manage performance and cost, depending on the specific demands of your application.

### Steps to configure (recall lab 174):

1. Create an `AMI` from an `EC2` instance.

    > From the `Actions` dropdown list, choose `Image and templates` > `Create image`

2. Create a load balancer.
    > create a load balancer that can balance traffic across multiple `EC2` instances and `Availability Zones`.

In the left navigation pane, locate the Load Balancing section, and choose Load Balancers.

3. Create a launch template and an Auto Scaling group.

4. Configure an Auto Scaling group to scale new instances within private subnets.

5. Use Amazon CloudWatch alarms to monitor the performance of your infrastructure.

6. Connect to the EC2 Instance
   Use Amazon EC2 Instance Connect to connect to one of the EC2 instances you created earlier:

bash
Copy code

# Example command to connect via EC2 Instance Connect

aws ec2-instance-connect send-ssh-public-key \
 --instance-id i-0abcd1234efgh5678 \
 --availability-zone us-west-2a \
 --instance-os-user ec2-user \
 --ssh-public-key file://my-key.pub 2. Configure AWS CLI with Credentials
If AWS CLI is not configured, you’ll need to set up the credentials:

bash
Copy code
aws configure
You’ll be prompted for the following:

AWS Access Key ID
AWS Secret Access Key
Default region name
Default output format
For more details, refer to the Configuration and Credential File Settings.

3. Create an AMI Using AWS CLI
   Once connected and configured, create an AMI (Amazon Machine Image) from your EC2 instance:

Identify the instance ID of the EC2 instance you want to create an AMI from.
Run the create-image command with an appropriate AMI name.
Example command:

bash
Copy code
aws ec2 create-image \
 --instance-id i-0abcd1234efgh5678 \
 --name "MyCustomAMI" \
 --no-reboot
Replace i-0abcd1234efgh5678 with your instance ID.
The --no-reboot option ensures the instance doesn’t restart during AMI creation. 4. Verify the AMI Creation
To confirm that your AMI has been created successfully, use the describe-images command:

bash
Copy code
aws ec2 describe-images --owners self --query 'Images[*].{ID:ImageId,Name:Name,State:State}'
This command lists your AMIs, showing their IDs, names, and states.

Conclusion
You have now:

Created an AMI from an EC2 instance.
Configured and tested load balancing and auto-scaling in private subnets.
Set up CloudWatch alarms for infrastructure monitoring.

## AWS CLI

Using Command Line Interface (AWS CLI) to create an Amazon Elastic Compute Cloud (EC2) instance to host a web server and create an Amazon Machine Image (AMI) from that instance.

1. To confirm that the Region in which the Command Host instance is running is the same as the lab (the us-west-2 Region), run the following command:

```sh
curl http://169.254.169.254/latest/dynamic/instance-identity/document | grep region
```

2. To update the AWS CLI software with the correct credentials, run the following command:

```sh
aws configure
```

3. enter the following command to navigate to their directory:

```sh
cd /home/ec2-user/
```

## Scenarios

**Scenario 1**: Auto Scaling
Imagine you are running an e-commerce website that experiences varying levels of traffic throughout the day. During regular business hours, the traffic is moderate, but during flash sales or holiday promotions, it spikes significantly. You want to ensure your infrastructure can handle these traffic surges without manual intervention or downtime.
AWS Solution: Implement Auto Scaling using Amazon EC2 Auto Scaling. You set up an auto-scaling group configured to launch new EC2 instances when the average CPU utilization across your current instances exceeds 70%. This ensures that when a flash sale occurs, additional instances are automatically spun up to handle the increased load. When the traffic subsides and CPU utilization drops below a set threshold (e.g., 30%), the auto-scaling group terminates unneeded instances to save on costs. This elastic behavior provides high availability and cost-efficiency by dynamically adjusting resources based on demand.

**Scenario 2**: Load Balancing
You are managing a social media platform hosted on multiple EC2 instances across two availability zones to ensure high availability. During peak usage hours, many users are accessing the platform simultaneously, potentially overloading some instances if the traffic is not properly distributed.
AWS Solution: Deploy an Elastic Load Balancer (ELB) in front of the EC2 instances. The Application Load Balancer (ALB) routes incoming HTTP and HTTPS traffic to instances in both availability zones, distributing the requests evenly. The ALB supports path-based and host-based routing, which means that specific types of traffic (e.g., image uploads or API requests) can be directed to specific targets. This setup ensures no single instance is overwhelmed, leading to improved performance, fault tolerance, and uptime. If one instance fails or becomes unresponsive, the ELB automatically reroutes traffic to healthy instances, maintaining a seamless user experience.
These scenarios provide a clear understanding of how Auto Scaling and Load Balancing can be used to handle varying workloads and ensure reliability on
