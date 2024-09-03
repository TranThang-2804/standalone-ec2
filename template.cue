#provider_aws: string

#parameter: {
    // (Required) The Account you are deploying to
    provider: #provider_aws
    // (Required) Name of the EC2 instance
    name: string
    // (Required) The environment you are deploying to
    environment: string | *"sit"| "uat" | "prod"
    // (Required) Instance type of the EC2 instance
    instance_type: string | *"t2.micro" | "t2.nano" | "t2.small" | "t2.medium" | "t2.large" | "t2.xlarge" | "t2.2xlarge"

    // (Required) The AMI ID to use for
    ami_id: string | *"ami-0c55b159cbfafe1f0"
    // (Required) The subnet ID to launch the instance into
    subnet_id: string
    // (Optional) The key name to use for the instance. Default true
    create_new_key: bool | *true
    // Your public SSH key. You can use the `ssh-keygen` command to generate from your local machine
    public_key: string
    // (Optional) Associate a public IP address with the instance. Default true
    public_ip: bool | *true
    // (Optional) Enable detailed monitoring (1 minute interval). Default false
    detailed_monitoring: bool | *false
    // (Optional) The user data to provide when launching the instance
    user_data: string | *null
    // (Optional) A mapping of tags to assign to the resource
    tags: [string]: string | *{}
}

template: {
    components: [
      {
        name: "aws-standalone-ec2"
        type: "aws-standalone-ec2"
        providerRef: {
          name: parameter.provider
        }
        properties: {
            name: parameter.name
            environment: parameter.environment
            instance_type: parameter.instance_type
            ami_id: parameter.ami_id
            subnet_id: parameter.subnet_id
            create_new_key: parameter.create_new_key
            key_pair_name: parameter.name
            pubkey: parameter.public_key
            associate_public_ip: parameter.public_ip
            detailed_monitoring: parameter.detailed_monitoring
            user_data: parameter.user_data

            tags: parameter.tags
        }
      }
    ]
}
