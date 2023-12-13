# Cloud

## A way to access and use computer resources over the internet, just like you might use a streaming service to watch movies or videos.

1. On-Demand Resources: Instead of buying and maintaining your own computers, you can use cloud computing services whenever you need them. It's like renting a car for a trip instead of owning one all the time.
2. Pay-as-You-Go: With cloud computing, you usually pay only for what you use. It's similar to paying for electricity: you pay based on how much you consume, rather than having to own and run your own power plant.
3. Scalability: Cloud services can grow or shrink with your needs. If your website or app becomes popular, you can easily get more computing power and storage from the cloud provider. This is like having a store that can instantly get bigger when more customers arrive.
4. Accessibility: You can access your cloud resources from anywhere with an internet connection. It's like having your files and software available on any device, whether it's your computer, smartphone, or tablet.
5. Managed Services: Cloud providers offer various tools and services, such as databases, machine learning, and security features. They handle the maintenance and updates, so you can focus on using these services without worrying about the technical details.
6. Reliability: Cloud providers often have multiple data centers in different locations, which means your data and applications are backed up and protected. This helps ensure that your services are available even if one data center has a problem.
7. Examples: Common cloud services include Amazon Web Services (AWS), Microsoft Azure, Google Cloud Platform (GCP), and services like Dropbox, Netflix, and Gmail, which use the cloud to store and deliver content and services.

## Different types/model of Cloud

- Public = External cloud providers deliver the resources as a fully managed service
- Private = A single organization uses a cloud service, either on site or via a third party
- Hybrid = Combination of onsite and cloud
- Multi = Combination of different cloud providers

## Different types of Cloud service

-	On-Premises = All physically onsite (more control but more responsibility)
-	IaaS (Infrastructure as a Service) = Virtualisation, servers, storage and networking off site which provider manages.
-	PaaS (Platform as a Service) = We only provide the code (data and application), the provider provides hardware and software. Use cases: Web application development, API development, DevOps, and continuous integration.
-	SaaS (Software as a Service) = Data only on our side such as cloud streaming/gaming (e.g. save files). Popular SaaS applications include Gmail (email), Microsoft Office 365 (productivity suite), and Salesforce (customer relationship management).

## OpEx vs CapEx - Wwo financial categories that organizations use to classify and manage their spending.

1. Operational Expenditure (OpEx):

Nature: OpEx represents day-to-day expenses incurred in the regular operation of a business. These expenses are typically recurring and are essential for running the business smoothly.

Accounting Treatment: OpEx is treated as a current expense on the income statement. It is deducted from the company's revenue to calculate the operating profit or loss.

Tax Treatment: OpEx is usually fully deductible from the organization's taxable income in the year it is incurred, reducing the tax liability.

Examples: Employee salaries, rent, utilities, office supplies, software subscriptions, maintenance contracts, and marketing expenses are all examples of operational expenditures.

Impact on Balance Sheet: OpEx does not affect the organization's assets or liabilities. It is an expense that reduces the net income.

2. Capital Expenditure (CapEx):

Nature: CapEx represents expenses incurred for acquiring, upgrading, or improving assets that have long-term value and are expected to benefit the organization for several years. These are investments in the future of the business.

Accounting Treatment: CapEx is capitalized on the balance sheet as an asset. Instead of being deducted immediately from revenue, the cost of the asset is spread over its useful life through depreciation or amortization (focuses on spreading out loan payments over time), and this expense is reflected in the income statement over time.

Tax Treatment: CapEx is typically not fully deductible in the year it is incurred. Instead, it is depreciated or amortized over several years, which can lead to tax benefits over time.

Examples: Purchasing real estate, buying machinery, building infrastructure, and developing custom software are examples of capital expenditures.

Impact on Balance Sheet: CapEx increases the organization's assets (the value of the acquired asset) on the balance sheet. Over time, the asset's value is reduced through depreciation or amortization.

## Four Pillars of DevOps

1.	Collaboration
-	DevOps: Collaboration is at the core of DevOps. It involves breaking down silos between development and operations teams, encouraging communication, and fostering a culture of collaboration and shared responsibility.
-	Link to Cloud: Cloud computing enables collaboration by providing a common platform accessible to both development and operations teams. Cloud-based tools and services facilitate collaboration by allowing teams to work on shared resources, automate processes, and monitor applications together.

2.	Automation
-	DevOps: Automation is a fundamental principle of DevOps. It involves automating repetitive tasks, such as building, testing, and deploying code, to improve efficiency and reduce manual errors.
-	Link to Cloud: Cloud platforms offer a wide range of automation capabilities. DevOps teams can leverage cloud services to automate provisioning, scaling, and management of infrastructure, as well as deployment pipelines. This leads to faster development cycles and more reliable operations.

3.	Measurement
-	DevOps: Measurement involves collecting data and metrics throughout the software development lifecycle to gain insights into the performance of applications and processes. This helps teams make informed decisions and continuously improve.
-	Link to Cloud: Cloud providers offer monitoring and analytics tools that make it easier to collect and analyze data related to application performance, resource utilization, and user behavior. DevOps teams can use these tools to measure and optimize their applications running in the cloud.
4.	Culture
-	DevOps: Culture is a critical aspect of DevOps, emphasizing the importance of a collaborative and customer-centric mindset. It encourages a culture of continuous improvement, experimentation, and feedback.
-	Link to Cloud: The cloud can influence an organization's culture by promoting agility and innovation. Cloud adoption often goes hand in hand with a shift in mindset, where teams become more focused on delivering value to customers and iterating quickly based on feedback.

## NB.

- Serverless: No control over what servers or how many, improves scalability as this scales based on demand
- Scaling: Vertical (up and down) means want bigger VMs with more memory, CPU etc. Old VM transfers to larger one and is terminated. Horizontal (in and out) is serverless so just creates more VMs
- Select region based mainly on location of end users re latency
- Points of service?
- Availability zones?
- Bash is Linux but GitBash is software emulating Linux that runs on top of our OS