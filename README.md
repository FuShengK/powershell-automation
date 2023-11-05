# PowerShell Automation Scripts Collection

Welcome to the PowerShell Automation Scripts Collection - a repository of PowerShell scripts designed to automate a variety of tasks for system administrators, developers, and IT professionals. Will add more scripts to the collection in the future.

## Table of Contents
- [About the Repository](#about-the-repository)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [Available Scripts](#available-scripts)
- [Acknowledgments](#acknowledgments)

## About the Repository

This repository is a comprehensive collection of scripts that aim to simplify and automate daily tasks, improve productivity, and enhance the overall system management experience. Each script is thoroughly tested and documented to ensure reliability and ease of use.

## Getting Started

Before you dive into the repository and start using the scripts, please ensure that you have the latest version of PowerShell installed on your system. You can download it from the [official PowerShell GitHub repository](https://github.com/PowerShell/PowerShell).

### Prerequisites

- PowerShell (For main execution)               - The main power to execute the script
- Git (For git commands usages)                 - Used to interact with remote repositories
- Firebase CLI (For Firebase commands usages)   - Used to configure firebase settings and deploy application
- Terraform (For Terraform commands usages)     - Used to automating deploy process, will work with cloud platforms (AWS, Azure, GCP)
- Heroku CLI (For heroku commands usages)       - Used to interact with remote Heroku repositories and deploy local applicatian

### Installation

To use the scripts, copy the script if you need:

Now, you can run a script directly or import it as a module, depending on the script's design.

## Usage

Each script in the repository has its own detailed usage instructions. Generally, you can execute a PowerShell script using the following command:

```powershell
.\script-name.ps1
```

Replace `script-name.ps1` with the actual script file you wish to run.

## Available Scripts

Here's a list of the available scripts and a brief description for each:

- `combination.ps1` - An interesting script will mock some command menu UI, users will be provided local scripts (currently only ps1 files) to pick and execute them in order.

- `deploy_gcp_tf.ps1` - Automates the deployment of GCP infrastructure using Terraform, streamlining the creation and management of cloud resources with infrastructure as code.

- `deploy_heroku.ps1` - Handles the deployment process to Heroku, managing code pushes, builds, and releases for quick and reliable application updates.

- `deploy_firebase.ps1` - Simplifies the deployment workflow for Firebase projects (static website).

- `deploy_docker_run.ps1` - Manages the deployment of Docker containers, taking care of image building, environment configuration, and container running.

- `git_push_workflow.ps1` - Streamlines the Git push process, automating staging, committing, and pushing changes to remote repositories efficiently.

- To Be Continued...

## Acknowledgments

This project stands on the shoulders of giants. I would like to extend my sincere thanks to all those who have contributed to the PowerShell community, sharing their insights and code, which have been invaluable to both this repository and the wider community.

- **Microsoft and the PowerShell Team** - For creating, maintaining, and continuously improving PowerShell, which has been an indispensable tool for system administrators and developers.
- **Contributors of Open Source Projects** - For their contributions that demonstrate the power of collaborative innovation and for providing the building blocks upon which this repository has been built.
- **[PowerShell Gallery](https://www.powershellgallery.com/)** - For hosting a wealth of useful modules and scripts that have inspired many of the automation scripts in this repository.
- **Community Bloggers and Educators** - For the wealth of knowledge shared through blog posts, forums, and educational resources that have been instrumental in learning advanced PowerShell techniques and best practices.
- **[GitHub](https://github.com/)** - For providing the platform that makes the sharing and collaboration of code possible and for nurturing the open-source community.

A special note of thanks to all the individual contributors of code and documentation who have spent their time to help make these scripts more robust and user-friendly. Your efforts are greatly appreciated and have not gone unnoticed.

Lastly, I would like to thank you, the user, for your interest in this project and for your feedback and contributions that help improve it. Together, we are stronger.

*If I have omitted any names or entities, it was unintentional and I am grateful for their contributions to the community as a whole.*
