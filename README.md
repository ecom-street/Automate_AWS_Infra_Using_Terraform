# Build AWS Infrastructure Using Terraform

Terraform Cloud:-
Terraform Cloud enables infrastructure automation for provisioning, compliance, and management of any cloud, datacenter, and service.

# Write configuration:-
The set of files used to describe infrastructure in Terraform is known as a Terraform configuration. You will write your first configuration to define a configure VPC and launch a EC2 instance.
Each Terraform configuration must be in its own working directory. Create a directory for your configuration.

<img width="578" alt="t1" src="https://user-images.githubusercontent.com/115148205/194996722-f9af386a-7d38-4184-ae17-8c37e5f82cc2.PNG">



Change into the directory.

<img width="571" alt="t2" src="https://user-images.githubusercontent.com/115148205/194996535-f09c98fe-6ae0-4b4c-b303-d7c83b8b4353.PNG">


Create a file to define your infrastructure.

<img width="575" alt="t3" src="https://user-images.githubusercontent.com/115148205/194996652-6407b7ee-733c-4b96-a2a4-ec44884c009a.PNG">

Open main.tf in your text editor, paste in the configuration below, and save the file.

# Terraform Configuration file:-

The input file for terraform is known as Terraform Configuration. Terraform configuration is written in a specific language named  Hashicorp Configuration Language and it can optionally be written in JSON as well.

Here is the sample Terraform Configuration file saved with *.tf extension

The following file presumes that you are using the AWS Config profile. So it refers to the profile: default for the authentication.

<img width="579" alt="vpc1" src="https://user-images.githubusercontent.com/115148205/194997838-06eab9d0-0943-4556-b3a6-a71dd64db9d1.PNG">


Terraform configuration file would ideally have lot of elements known as blocks such as provider , resource etc.

This is a Syntax of how Terraform Configuration file block is formatted

<img width="822" alt="ec2" src="https://user-images.githubusercontent.com/115148205/195038533-ebb6a273-1adb-480c-8e3e-7918dcca5078.PNG">

There are sample amount of BLOCK_TYPE available in Terraform and the resource is primary and all others are to support building that specified resource.
Some of the Terraform blocks (elements) and their purpose is given below.

# Providers:-
The provider block configures the specified provider, in this case aws. A provider is a plugin that Terraform uses to create and manage your resources.

You can use multiple provider blocks in your Terraform configuration to manage resources from different providers. You can even use different providers together. For example, you could pass aws credentials like access key and secret key.

<img width="479" alt="provider" src="https://user-images.githubusercontent.com/115148205/194998252-fd347db4-c9a6-4333-a1b4-94c489906cf1.PNG">

# Resources:-
Use resource blocks to define components of your infrastructure. A resource might be a physical or virtual component such as an EC2 instance, or it can be a logical resource such as a Heroku application.

Resource blocks have two strings before the block: the resource type and the resource name. In this example, the resource type is aws_instance and the name is web-server. The prefix of the type maps to the name of the provider. In the example configuration, Terraform manages the aws_instance resource with the aws provider. Together, the resource type and resource name form a unique ID for the resource. For example, the ID for your EC2 instance is aws_instance.web-server.

Resource blocks contain arguments which you use to configure the resource. Arguments can include things like machine sizes, disk image names, or VPC IDs. Our providers reference lists the required and optional arguments for each resource. For your EC2 instance, the example configuration sets the AMI ID to an Ubuntu image, and the instance type to t2.micro, which qualifies for AWS' free tier. It also sets a tag to give the instance a name.

<img width="714" alt="resource" src="https://user-images.githubusercontent.com/115148205/194999689-bb6aa0ad-d45d-42a7-9e4b-e3554458c745.PNG">

# Variable :-
To declare input variables.

<img width="440" alt="variable" src="https://user-images.githubusercontent.com/115148205/195000033-11bb9ddc-cbfb-4b21-b0ae-6bd5900dcb81.PNG">

# Output :- 
To declare output variables which would be retained the Terraform state file.

<img width="601" alt="output" src="https://user-images.githubusercontent.com/115148205/195000236-30ced75c-9d09-4893-8cc9-9eb785e4dbd0.PNG">

# Local:-
To assign value to an expression, these are local temporary variables work with in a modul.
<img width="286" alt="local" src="https://user-images.githubusercontent.com/115148205/195004133-7b598640-4b69-4480-bfe5-37cbf917eefa.PNG">

# Module :-
A module is a container for multiple resources that are used together.
<img width="544" alt="Module" src="https://user-images.githubusercontent.com/115148205/195003903-e3196314-bfed-403b-aa60-04c695dcc476.PNG">

# Data :-
To Collect data from the remote provider and save it as a data source.
<img width="812" alt="data" src="https://user-images.githubusercontent.com/115148205/195004272-1259e0b2-5079-45b0-a441-2e6f6874b0da.PNG">

# These are the followings steps to build AWS VPC Using Terrafrom.
1. Step1:- Need to define provider as shown in the attachemnets.
<img width="479" alt="provider" src="https://user-images.githubusercontent.com/115148205/195005215-ee41327d-02ab-458f-9b1b-050c6d887a70.PNG">
After giving aws keys we need to initialise the the terraform by usning terraform init command.
<img width="865" alt="initialize" src="https://user-images.githubusercontent.com/115148205/195005707-280988b9-12eb-4c3b-aab8-b925c37e2a4f.PNG">

2. Step2:- for create a vpc we need to define  terraform aws resouces.
<img width="785" alt="vpc" src="https://user-images.githubusercontent.com/115148205/195005966-4b0e3dfa-111b-42f0-baa8-3351ac08cfe0.PNG">

In VPC we need to define CIDR and after defining we need to run the terraform plan command to review the all changes.
<img width="823" alt="plan" src="https://user-images.githubusercontent.com/115148205/195007028-ce148ee8-8f79-4d1e-8c69-ae304ac9e4fb.PNG">

Than run the terraform apply command.
<img width="877" alt="apply" src="https://user-images.githubusercontent.com/115148205/195007324-e3eac2bb-949f-4b08-b7f0-2776f4f2cb45.PNG">

Now go to aws console and check in vpc service .

3. Step3:- For create a internet Gateway we need to define terraform internet gateway resouces as shown below.
<img width="814" alt="IGW" src="https://user-images.githubusercontent.com/115148205/195006552-b6a2c0c5-2f11-4837-9670-c52f986a8453.PNG">

After define Internet Gateway we need to run the terraform plan and terraform apply commands and check in the aws vpc service console.

4. Step4:- For cetare a route table we need to define terraform aws route table resouces.
<img width="811" alt="route_table" src="https://user-images.githubusercontent.com/115148205/195012155-2f104bb2-4421-4372-9b98-a868e586a330.PNG">

After defining Route Table we need to run the terraform plan and terraform apply commands and check in the aws vpc service console.

5. Step5:- For create a subnet we need to define terraform aws subnet resouces.
<img width="819" alt="subnet" src="https://user-images.githubusercontent.com/115148205/195012560-8fac082f-31ed-4d3b-8eae-fc961e2a53a5.PNG">

After defining Subnet we need to run the terraform plan and terraform apply commands and check in the aws vpc service console.

6. Step6:- For associate route table with subnet we need to define terraform aws associate route table with subnet resource.
<img width="813" alt="associate" src="https://user-images.githubusercontent.com/115148205/195013139-d957d181-6fc1-47d1-9672-4eff65d3d96b.PNG">

After defining associate route table with subnet resource we need to run the terraform plan and terraform apply commands and check in the aws vpc service console.

7. Step7:- For create a  security group we need to define terraform aws secuirity group resource.
<img width="819" alt="SG" src="https://user-images.githubusercontent.com/115148205/195013557-86a930c3-8d0c-45bb-8f9a-e649f0d46f85.PNG">

<img width="807" alt="SG1" src="https://user-images.githubusercontent.com/115148205/195013899-2a46a4f3-1f70-4994-9cf5-d794a1afe6aa.PNG">

After defining secuirity group resource we need to run the terraform plan and terraform apply commands and check in the aws vpc service console.

8. Step8:- For create network interface with an IP that was created on step 5 we need to define terraform aws network interface resource.
<img width="812" alt="NI" src="https://user-images.githubusercontent.com/115148205/195014264-417de1c6-eb59-4716-bbcf-1e9c4bb82d1e.PNG">

After defining network interface resource we need to run the terraform plan and terraform apply commands and check in the aws vpc service console.

9. Step9:- For Assign an elastic IP to network interface created in step 8 we need to define terraform aws Assign an elastic IP resource.
<img width="819" alt="EP" src="https://user-images.githubusercontent.com/115148205/195014798-b2a4d472-018b-42de-88e1-c54c74e5bbe5.PNG">

After defining Assign an elastic IP resource we need to run the terraform plan and terraform apply commands and check in the aws vpc service console.

10. Step10:- For create a EC2 instance ubuntu server and install/enable apache2 we need to define terraform aws EC2 instanc resource.
<img width="822" alt="ec2" src="https://user-images.githubusercontent.com/115148205/195015334-567bc83c-254d-4ccb-8e29-35fdae1b5803.PNG">

After defining EC2 instance resource we need to run the terraform plan and terraform apply commands and check in the aws EC2 service console.
# These are the some terraform commands give below:-
# Format and validate the configuration
We recommend using consistent formatting in all of your configuration files. The terraform fmt command automatically updates configurations in the current directory for readability and consistency.

Format your configuration. Terraform will print out the names of the files it modified, if any. In this case, your configuration file was already formatted correctly, so Terraform won't return any file names.

<img width="833" alt="fmt" src="https://user-images.githubusercontent.com/115148205/195016372-2fa25cc3-5f72-42b5-9e76-e7f918715cc2.PNG">

# Terraform validate
Validate your configuration. The example configuration provided above is valid, so Terraform will return a success message.
<img width="829" alt="validate" src="https://user-images.githubusercontent.com/115148205/195016721-d287528d-5119-4542-87af-ee12b0080bf4.PNG">

# Create infrastructure
Apply the configuration now with the terraform apply command. Terraform will print output similar to what is shown below. We have truncated some of the output to save space.
<img width="825" alt="create" src="https://user-images.githubusercontent.com/115148205/195017397-c3a190d1-3f75-44bb-bfce-9a1b56940ba1.PNG">

Before it applies any changes, Terraform prints out the execution plan which describes the actions Terraform will take in order to change your infrastructure to match the configuration.

The output format is similar to the diff format generated by tools such as Git. The output has a + next to aws_instance.app_server, meaning that Terraform will create this resource. Beneath that, it shows the attributes that will be set. When the value displayed is (known after apply), it means that the value will not be known until the resource is created. For example, AWS assigns Amazon Resource Names (ARNs) to instances upon creation, so Terraform cannot know the value of the arn attribute until you apply the change and the AWS provider returns that value from the AWS API.

Terraform will now pause and wait for your approval before proceeding. If anything in the plan seems incorrect or dangerous, it is safe to abort here before Terraform modifies your infrastructure.

In this case the plan is acceptable, so type yes at the confirmation prompt to proceed. Executing the plan will take a few minutes since Terraform waits for the EC2 instance to become available.
<img width="825" alt="approve" src="https://user-images.githubusercontent.com/115148205/195017709-49a24629-9c60-40bc-bbd2-569ec48bb0d4.PNG">

# Inspect state
When you applied your configuration, Terraform wrote data into a file called terraform.tfstate. Terraform stores the IDs and properties of the resources it manages in this file, so that it can update or destroy those resources going forward.

The Terraform state file is the only way Terraform can track which resources it manages, and often contains sensitive information, so you must store your state file securely and restrict access to only trusted team members who need to manage your infrastructure. In production, we recommend storing your state remotely with Terraform Cloud or Terraform Enterprise. Terraform also supports several other remote backends you can use to store and manage your state.

Inspect the current state using terraform show.

<img width="827" alt="inspect" src="https://user-images.githubusercontent.com/115148205/195018000-dcab0e71-5101-4c0a-bbf2-446938545ca9.PNG">

When Terraform created this EC2 instance, it also gathered the resource's metadata from the AWS provider and wrote the metadata to the state file. Later in this collection, you will modify your configuration to reference these values to configure other resources and output values.

# Manually Managing State
Terraform has a built-in command called terraform state for advanced state management. Use the list subcommand to list of the resources in your project's state.

<img width="821" alt="state" src="https://user-images.githubusercontent.com/115148205/195018260-68188a2b-5d43-4089-ab33-9c4be328a392.PNG">

# Delete all Resource
Terraform has  a built-in command called terraform destroy .Use the terraform destroy comand we can delete all resouces in main.tf file.
<img width="822" alt="destroy" src="https://user-images.githubusercontent.com/115148205/195019398-328293bb-bd92-4a39-8c30-78fcbf5c26e9.PNG">

Here --auto-apporve use for appove automatically .

# Troubleshooting
If terraform validate was successful and your apply still failed, you may be encountering one of these common errors.

If you use a region other than us-west-2, you will also need to change your ami, since AMI IDs are region-specific. Choose an AMI ID specific to your region by following these instructions, and modify main.tf with this ID. Then re-run terraform apply.

If you do not have a default VPC in your AWS account in the correct region, navigate to the AWS VPC Dashboard in the web UI, create a new VPC in your region, and associate a subnet and security group to that VPC. Then add the security group ID (vpc_security_group_ids) and subnet ID (subnet_id) arguments to your aws_instance resource, and replace the values with the ones from your new security group and subnet.

<img width="601" alt="trubleshoot" src="https://user-images.githubusercontent.com/115148205/195019908-d992b759-1cb9-4fd8-8abf-fc8c161e1b72.PNG">

Save the changes to main.tf, and re-run terraform apply.









