aws_profile = govwifi
aws_region = eu-west-2

build-infra:
	AWS_PROFILE=$(aws_profile) \
	AWS_REGION=$(aws_region) \
	ansible-playbook \
		infra/jenkins-build.yml

configure-infra:
	AWS_PROFILE=$(aws_profile) \
	AWS_REGION=$(aws_region) \
	ANSIBLE_HOST_KEY_CHECKING=false \
	ANSIBLE_PRIVATE_KEY_FILE=private/keys/govwifi-jenkins \
	ansible-playbook -i inventory \
		playbooks/jenkins.yml \
		--limit jenkins_master
