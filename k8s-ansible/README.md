# Kubernetes Cluster with Ansible

This project sets up a single-master and two-worker Kubernetes cluster on Ubuntu 24 EC2 instances using Ansible.

## Usage

```bash
ansible-playbook playbooks/init.yaml
ansible-playbook playbooks/k8s-master.yaml
ansible-playbook playbooks/k8s-worker.yaml
