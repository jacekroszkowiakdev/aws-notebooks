# AWS Services

## AWS Cloud Trail

CloudTrail is an auditing, compliance monitoring, and governance service provided by AWS. As part of AWS's Management and Governance tools, CloudTrail records and tracks account activity, logging API calls and actions across your AWS infrastructure. This allows you to manage data storage, perform analyses, and take remediation steps when needed. CloudTrail helps maintain visibility into user activities, which is essential for monitoring security, ensuring compliance, and troubleshooting operational issues. You can also store the logs in S3 for long-term analysis or use other AWS services like CloudWatch and Lambda for real-time monitoring and automated responses.

![CloudTrail](./img/cloud_trail_overview.png)

1. An action takes place in your AWS account.
2. CloudTrail detects and logs this action, creating what is known as a CloudTrail event. Each event contains key information, including:

-   Who initiated the request
-   The date and time when the action occurred
-   The source Internet Protocol (IP) address involved
-   How the request was made
-   Which specific actions were performed
-   Where the action took place (i.e., the AWS Region)
-   The outcome or response of the request

**CloudTrail delivers your log files to an Amazon S3 bucket that you specify**:

-   You will browse through an object hierarchy similar to the one shown below, though the bucket name, account ID, Region, and date will vary.
-   A typical log file in this hierarchy will have a name similar to:
    `123456789012_CloudTrail_us-west-1_20220209T1255ZHdkvFTXOA3Vnhbc.json.gz`
-   The object hierarchy structure might look like this:
    `bash
    All Buckets
    └── Bucket_Name
          └── AWSLogs
               └── 123456789012
                    └── CloudTrail
                         └── us-west-1
                              └── 20220209
    `
    **NOTE**:
    CloudTrail typically delivers logs within an average of about 15 minutes of an event.

CloudTrail offers several important benefits:

![CloudTrail benefits](./img/cloud_trail_key_benefits.png)

**Enhanced visibility**: CloudTrail provides detailed insight into user and resource activity in your AWS account, allowing you to track who performed specific actions and when they occurred.
**Simplified compliance audits**: Activities are automatically logged and stored, making it easier to search through logs, detect noncompliant actions, speed up incident investigations, and respond more quickly to potential issues.
**Operational troubleshooting**: By capturing a complete history of changes made in your account, CloudTrail helps you analyze and troubleshoot any operational problems.
**Security monitoring**: CloudTrail enables you to identify account changes that could increase security risks and helps streamline AWS audit requests, simplifying audits, compliance, and troubleshooting.
