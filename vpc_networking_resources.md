**Recall** LAB 264

protocols which can be directly used with AWS's Security Group (SG) and Network Access Control Lists (NACLs). A VPC needs an Internet Gateway (IGW) in order for the VPC to reach the internet, which has the route as 0.0.0.0/0. These routes go on what is called a Route Table, which are associated to subnets so they know where they belong. As mentioned in previous labs, you will follow the order of the navigation console to build this VPC, and a troubleshooting method to build a fully functioning VPC. When building a VPC from scratch, it is easier to work from the top and move down to the bottom since you do not have an instance yet. Think of this as building a sandwich; the VPC is the bun, and the resources are everything in between.

Before you start, let's review VPC and its components to make it network compatible.

**A Virtual Private Cloud (VPC)** is like a data center but in the cloud. Its logically isolated from other virtual networks from which you can spin up and launch your AWS resources within minutes.

**Private Internet Protocol (IP)** addresses are how resources within the VPC communicate with each other. An instance needs a public IP address for it to communicate outside the VPC. The VPC will need networking resources such as an Internet Gateway (IGW) and a route table in order for the instance to reach the internet.

**A subnet** is a range of IP addresses within your VPC. Subnet is a range of IP addresses within your VPC. In your VPC, you can create a public and a private subnet. You can separate subnets according to specific architectural needs. For example, if you have servers that shouldn't be directly accessed by the internet, you would put them in the private subnet. For test servers or instances that require internet connectivity can be placed in the public subnet. Companies also separate subnets according to offices, teams, or floors.

**A route table** contains routes for your subnet and directs traffic using the rules defined within the route table. You ==associate the route table to a subnet==. If an IGW was on a route table, the destination would be 0.0.0.0/0 and the target would be IGW. a route table contains the rules or routes that determine where network traffic within your subnet and VPC will go. It controls the network traffic like a router, and, just like a router, it stores IP addresses within the VPC. You associate a route table to each subnet and put the routes that you need your subnet to be able to reach. For this step, you will create the route table first, and then add the routes as you create AWS resources for the VPC. **Note**: Every route table needs to be associated to a subnet. The naming convention is kept the same (public route table, public subnet, etc) in order to associate the same resources together. Keep this in mind when your network and resources grow. You can have multiples of the same resources and it can get confusing to which belongs where.

**An Internet Gateway (IGW)** is what makes it possible for the VPC to have internet connectivity. It has two jobs: perform network address translation (NAT) and be the target to route traffic to the internet for the VPC. An IGW's route on a route table is always 0.0.0.0/0. an IGW is what allows the VPC to have internet connectivity and allows communication between resources in your VPC and the internet. The IGW is used as a target in the route table to route internet-routable traffic and to perform network address translation (NAT) for EC2 instances. NAT is a bit beyond the scope of this lab, but it is referenced in the reference section if you'd like to dive deeper.

**Network Access Control Lists (NACLs)** an NACL is a layer of security that ==acts like a firewall at the subnet level==. NACLs are stateless, which means they do not block everything by default. The rules to set up a NACL are similar to security groups in the way that they control traffic.

The following rules apply: NACLs must be associated to a subnet, ==NACLs are stateless=, and they have the following parts:

-   Rule number: The lowest number rule gets evaluated first. As soon as a rule matches traffic, its applied; for example: 10 or 100. Rule 10 would get evaluated first.
-   Type of traffic; for example: HTTP or SSH
-   Protocol: You can specify all or certain types here
-   Port range: All or specific ones
-   Destination: Only applies to outbound rules
-   Allow or Deny specified traffic.

**Security groups** work as the firewall within your VPC. ==Security groups work at the instance level and are stateful, which means they block everything by default==.

Recall that a security group is a virtual firewall at the instance level that controls inbound and outbound traffic. Just like a NACL, security groups control traffic; however, security groups cannot deny traffic. Security groups are stateful; you must allow traffic through the security group as it blocks everything by default, and it must be associated to an instance. A security group has the following parts for both inbound and outbound rules:

-   Inbound Source: It can be an IP or a specific resource
-   Outbound Destination: Can by an IP such as anywhere (0.0.0.0/0)
-   Protocol: Example UDP or TCP
-   Port range: All or specific range
-   Description: You can input a description

---

## STEPS

**Note**: Although almost anything can be created in any order, it is easier to have an approach. Having a flow or an approach will assist you in troubleshooting issues and ensure that you do not forget a resource.

1. **CREATE VPC**

2. **CREATE SUBNETS**

**Logic for Public Subnet CIDR**

1. `Subnetting the VPC CIDR Block`:

You divide the VPC's CIDR block into smaller ranges for different subnets.
The subnet mask must be longer than /26 (e.g., /27, /28, etc.), as a subnet cannot exceed the size of the VPC CIDR.

2. `Public Subnet Size`:

A /27 subnet provides 32 IP addresses (2^(32-27)).
This is typically sufficient for public-facing resources like NAT gateways, bastion hosts, or load balancers. Adjust based on your needs.

3. `Routing Requirements`:

A public subnet must have a route in the route table that directs traffic destined for the internet (e.g., 0.0.0.0/0) through an internet gateway.

4. `IP Address Allocation Best Practices`:

Reserve smaller subnets for public use (e.g., /27 or /28).
Keep private subnets larger, as they usually host more resources like application servers or databases.

**Suggested Public Subnet CIDR**

For a /26 VPC CIDR, split it into smaller blocks. Examples include:

-   Subnet 1 (Public): 0.0.0.0/27 (IP range: 0.0.0.0 - 0.0.0.31)
-   Subnet 2 (Private): 0.0.0.32/27 (IP range: 0.0.0.32 - 0.0.0.63)

**Best Practices**

-   Leave Room for Expansion:
    Reserve additional CIDRs for future use when allocating subnets.

-   Tagging:
    Clearly tag subnets (e.g., "Public-Subnet", "Private-Subnet") to avoid confusion.

-   Security:
    Use network access control lists (NACLs) and security groups to limit access to resources in public subnets.

-   High Availability:
    Design multiple subnets across Availability Zones for redundancy.

3. **CREATE ROUTE TABLE**

Navigate to the VPC Console:

Log in to your AWS Management Console.
Open the VPC Dashboard and click on Route Tables.
Create a New Route Table:

Click Create Route Table.
Assign a name to the route table for identification (e.g., "Public-Route-Table").
Select the VPC in which the route table will operate.
Edit Routes:

Add or modify routes to direct traffic:
For public subnets, add a route for 0.0.0.0/0 (or equivalent IPv6 ::/0) pointing to an Internet Gateway (IGW).
For private subnets, add routes pointing to a NAT Gateway or Transit Gateway for internet access if needed.
Associate Subnets:

Assign the route table to one or more subnets by:
Selecting the route table.
Navigating to the Subnet Associations tab.
Clicking Edit Subnet Associations and selecting the desired subnets.
Save and Verify:

Save your changes and review the routing table to ensure it has the correct entries.

4. Create Internet Gateway and attach Internet Gateway to the VPC
5. Add route to route table and associate subnet to route table
6. Creating a Network ACL
