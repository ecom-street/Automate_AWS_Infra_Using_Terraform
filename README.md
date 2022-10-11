# Build Infrastructure Using Terraform

Terraform Cloud:-
Terraform Cloud enables infrastructure automation for provisioning, compliance, and management of any cloud, datacenter, and service.

Write configuration:-
The set of files used to describe infrastructure in Terraform is known as a Terraform configuration. You will write your first configuration to define a configure VPC and launch a EC2 instance.
Each Terraform configuration must be in its own working directory. Create a directory for your configuration.

<img width="578" alt="t1" src="https://user-images.githubusercontent.com/115148205/194996722-f9af386a-7d38-4184-ae17-8c37e5f82cc2.PNG">



Change into the directory.

<img width="571" alt="t2" src="https://user-images.githubusercontent.com/115148205/194996535-f09c98fe-6ae0-4b4c-b303-d7c83b8b4353.PNG">


Create a file to define your infrastructure.

<img width="575" alt="t3" src="https://user-images.githubusercontent.com/115148205/194996652-6407b7ee-733c-4b96-a2a4-ec44884c009a.PNG">

Open main.tf in your text editor, paste in the configuration below, and save the file.

Terraform Configuration file:-

The input file for terraform is known as Terraform Configuration. Terraform configuration is written in a specific language named  Hashicorp Configuration Language and it can optionally be written in JSON as well.

Here is the sample Terraform Configuration file saved with *.tf extension

The following file presumes that you are using the AWS Config profile. So it refers to the profile: default for the authentication.

<img width="579" alt="vpc1" src="https://user-images.githubusercontent.com/115148205/194997838-06eab9d0-0943-4556-b3a6-a71dd64db9d1.PNG">

Terraform configuration file would ideally have lot of elements known as blocks such as provider , resource etcetera.

This is a Syntax of how Terraform Configuration file block is formatted

<img width="479" alt="provider" src="https://user-images.githubusercontent.com/115148205/194997985-40acf808-a632-47f1-b831-b63303f95c1a.PNG">

There are ample amount of BLOCK_TYPE available in Terraform and the resource is primary and all others are to support building that specified resource.
Some of the Terraform blocks (elements) and their purpose is given below
Providers:-
The provider block configures the specified provider, in this case aws. A provider is a plugin that Terraform uses to create and manage your resources.

You can use multiple provider blocks in your Terraform configuration to manage resources from different providers. You can even use different providers together. For example, you could pass the IP address of your AWS EC2 instance to a monitoring resource from DataDog.

<img width="479" alt="provider" src="https://user-images.githubusercontent.com/115148205/194998252-fd347db4-c9a6-4333-a1b4-94c489906cf1.PNG">











