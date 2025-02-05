# Infra as Code (IAC)

- Different Cloud providers have different method to achieve IaC, AWS has it's own kit Cloud Development Kit (CDK), 
For OCI & GCP we will use terraform.  

## Installation
- `brew install terraform`
- To verify, check version `terraform --version`

NOTE: Oracle Cloud Infrastructure API uses camelCase extensively, Terraform doesn't support camelCase in configuration files.
For this reason, in the configurations you see underscores rather than capitalization as separators.
For example, where the API uses availabilityDomain, the Terraform configuration uses availability_domain.

## [Configuration Docs](https://docs.oracle.com/en-us/iaas/Content/ResourceManager/Concepts/samplecomputeinstance.htm)
### [Pre req. API keys](https://docs.oracle.com/en-us/iaas/Content/API/Concepts/apisigningkey.htm)
1. [Configure IAM](https://docs.oracle.com/en-us/iaas/Content/GSG/Tasks/addingusers.htm) 
   1. Create a compartment 
      1. Everything will be performed in following compartment for eg, `OrderBox > testing > workshop > smeet.kothari`
   2. Create a free group/domain in given compartment (upto 2000 users) for eg. `terraform-api-keys`
      1. Create a group under given domain for eg. `terraform-api-keys-grp` and select your user while creating grp
   3. Create a policy in given compartment for eg. `terraform-api-keys-policy`
      1. Custom policy statement to be vierified `Allow group 'terraform-api-keys'/'terraform-api-keys-grp' to manage all-resources in compartment smeet.kothari`
2. (Optional)[SSH](https://mylearn.oracle.com/ou/course/oracle-cloud-infrastructure-foundations/139383/189880) for chosing public key option
   1. `ssh-keygen -b 2048 -t rsa -f smeeetskey`
3. [Genrating it from console](https://docs.oracle.com/en-us/iaas/Content/API/Concepts/apisigningkey.htm#two)
   1. ```
      user=
      fingerprint=
      tenancy=
      region=
      key_file=
      ```

## Fundamentals

### Folder structure
```
iac/
├── networking/
│   └── vcn.tf
├── oci/
│   └── provider.tf
└── gcp/
    └── provider.tf
```

### [Create a VCN using own terraform config](https://github.com/oracle-terraform-modules/terraform-oci-vcn?tab=readme-ov-file)
#### The resources are organized into stacks, which you create and provision using jobs.

[//]: # ([Config Video]&#40;https://www.youtube.com/watch?v=MjmikFgvKvI&#41;)