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

```bash
    All Buckets
    └── Bucket_Name
          └── AWSLogs
               └── 123456789012
                    └── CloudTrail
                         └── us-west-1
                              └── 20220209
```

**NOTE**:
CloudTrail typically delivers logs within an average of about 15 minutes of an event.

**CloudTrail offers several important benefits**:

![CloudTrail benefits](./img/cloud_trail_key_benefits.png)

-   **Enhanced visibility**: CloudTrail provides detailed insight into user and resource activity in your AWS account, allowing you to track who performed specific actions and when they occurred.

-   **Simplified compliance audits**: Activities are automatically logged and stored, making it easier to search through logs, detect noncompliant actions, speed up incident investigations, and respond more quickly to potential issues.

-   **Operational troubleshooting**: By capturing a complete history of changes made in your account, CloudTrail helps you analyze and troubleshoot any operational problems.

-   **Security monitoring**: CloudTrail enables you to identify account changes that could increase security risks and helps streamline AWS audit requests, simplifying audits, compliance, and troubleshooting.

**CloudTrail Best Practices**:

-   **Turn on log file integrity validation**: Enabling this feature ensures the security of your log files by verifying whether they have been tampered with, deleted, or modified after being delivered to the specified S3 bucket.

-   **Aggregate log files to a single S3 bucket**: Centralize your CloudTrail logs by configuring them to be stored in a single S3 bucket. This simplifies management and enhances security, as you can define permissions for access. Use multi-factor authentication (MFA) for added protection when managing or deleting these logs.

-   **Enable CloudTrail across all AWS Regions**: Ensure that CloudTrail is turned on globally, so all settings apply consistently across both existing and newly launched Regions, ensuring comprehensive monitoring.

-   **Restrict access to CloudTrail S3 buckets**: Limit access to your S3 buckets that store CloudTrail logs to protect sensitive information. Implement strict access control and permissions for security.

-   **Integrate CloudTrail with Amazon CloudWatch**: Use Amazon CloudWatch for real-time monitoring and alerting based on CloudTrail logs. This enables automated detection and responses to potential security risks or operational issues.

These practices help ensure the security, integrity, and accessibility of your CloudTrail logs, improving your auditing and troubleshooting processes.

## Amazon Simple Notification Service (SNS)

Amazon SNS is a fully managed Pub/Sub (publish/subscribe) service for both Application-to-Application (A2A) and Application-to-Person (A2P) messaging.

Key Benefits:

-   **A2A Notifications**: Enables decoupling and integration of distributed applications by delivering application-to-application notifications.
-   **A2P Notifications**: Allows applications to send notifications directly to customers via SMS, push notifications, and email.
-   **Simplified Architecture**: Reduces complexity and costs through message filtering, batching, ordering, and deduplication.
-   **Increased Message Durability**: Enhances durability with features like message archiving, replay, delivery retries, and dead-letter queues (DLQs).

SNS provides a scalable solution to streamline communication between applications and users while maintaining efficiency and reliability.

AWS CONFIG
AWS LAMBDA
AWS IAM
AWS TRUSTED ADVISOR
