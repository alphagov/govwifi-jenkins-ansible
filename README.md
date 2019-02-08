# Infrastructure

To build the AWS infrastructure for Jenkins, ensure you have AWS credentials stored inside `~/.aws/credentials`

Ensure you have the profile set up that is mentioned in the Makefile

In this case it will be `[govwifi]`

You will also need the `govwifi-jenkins` SSH key from govwifi build repository saved into the `private/keys` directory in this project.

Allow access to Jenkins via your VPN IPs.

The current list for GovWifi can be found in the govwifi build repository.

It can be found by searching for the variable called `administrator-IPs`

Add these IPs to a file called `private/admin_ips.yml`.  It should be a yaml array as follows:

```yaml
- 0.0.0.0/32
- 1.1.1.1/32
```

Once this is done, run:

```
make build-infra
```

This will create the Jenkins infrastructure.

Copy the public DNS values from the newly created master EC2 instance and update the `inventory` file

Now run:

```
make configure-infra
```

## Licence

This codebase is released under [the MIT License][mit].

[mit]: LICENSE
