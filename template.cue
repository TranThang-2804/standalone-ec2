#provider_aws: string

#parameter: {
    name: string
    envronment: string | *"sit"| "uat" | "prod"
    instance_type: string | *"t2.micro" | "t2.nano" | "t2.small" | "t2.medium" | "t2.large" | "t2.xlarge" | "t2.2xlarge"

    ami_id: string | *"ami-0c55b159cbfafe1f0" | "ami-0c55b159cbfafe1f0" | "ami-0c55b159cbfafe1f0" | "ami-0c55b159cbfafe1f0"

    subnet_id: string
    create_new_key: bool | *true
    public_key: string
    public_ip: bool | *true
    detailed_monitoring: bool | *false
    user_data: string | *null
    tags: [string]: string | *{}
}

template: {
    providerRef: {
      name: #provider_aws
    }

    components: [
      {
        name: "aws-standalone-ec2"
        type: "aws-standalone-ec2"
        properties: {
            name: #parameter.name
            envronment: #parameter.envronment
            instance_type: #parameter.instance_type
            ami_id: #parameter.ami_id
            subnet_id: #parameter.subnet_id
            create_new_key: #parameter.create_new_key
            key_pair_name: #parameter.name
            pubkey: #parameter.public_key
            associate_public_ip: #parameter.public_ip
            detailed_monitoring: #parameter.detailed_monitoring
            user_data: #parameter.user_data

            tags: #parameter.tags
        }
      }
    ]
}
