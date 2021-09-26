# **Vanilla Forums (Open Source) Docker** <a name="overview"></a>
Vanilla Forum is a open source community forum software. This repository contains the contents which allows you to deploy the containers required to run the Vanilla Forum's frontend web application which is recommended for **PROD**.This repo also has the content to deploy the backend which is a MySQL database container which is recommended for localhost setup, which is best suited for **DEV and TESTING**.

To learn more about Vanilla Forum please goto: https://vanillaforums.com/en/software/


<br> </br>


# Table of contents
1. [Overview](#overview)
2. [Deployment with Local MySQL Container](#DeploymentwithLocalMySQLContainer)
    * [Start Services](#StartServicesLocal)
    * [Stop Services](#StopServicesLocal)
    * [Check Logs](#CheckLogsLocal)
    * [Check Container State](#CheckContainerStateLocal)
3. [Deployment with Local MySQL Container](#DeploymentwithExternalMySQLContainer)
    * [Start Services](#StartServices)
    * [Stop Services](#StopServices)
    * [Check Logs](#CheckLogs)
    * [Check Container State](#CheckContainerState)


<br> </br>


# Deploy Vanilla Forum with Local MySQL Container <a name="DeploymentwithLocalMySQLContainer"></a>
RECOMMEDED FOR LOCALHOST SETUP. BEST SUITED FOR DEVELOPMENT & TESTING.


These sets of instructions are used for running **TWO** containers.

* 1st Container - Vanilla Forum (Frontend) 
* 2nd Container - MySQL container (Backend).

To change the default MySQL credentials, modify the `.env` file. You will need these credentials at installation time. 
### **Start Services** <a name="StartServicesLocal"></a>
`docker-compose up -d --build` <br>
(Note: `-d` flag will run the services in background)
### **Stop Services** <a name="StopServicesLocal"></a>
`docker-compose down` <br>
### **Check logs** <a name="CheckLogsLocal"></a>
`docker-compose logs -f vanilla-forums` <br>

### **Check container state** <a name="CheckContainerStateLocal"></a>
`docker-compose ps` <br>


<br> </br>

# Deployment with External MySQL Services <a name="DeploymentwithExternalMySQLContainer"></a>
RECOMMENDED FOR PRODUCTION SETUP IN A CLOUD ENVIRONMENT.

If you have MySQL deployed in cloud or on some remote instance, use this option. The below instructions only spins up a single container. 

* Single Container - Vanilla Forum (Frontend) only

*NOTE: Vanilla Forum setup requires a MySQL or similar database for complete installation/setup.*
### **Start Services** <a name="StartServices"></a>
`docker-compose -f docker-compose.prod.yml up -d --build` <br>
`-d` flag will run the services in background
### **Stop Services** <a name="StopServices"></a>
`docker-compose -f docker-compose.prod.yml down` <br>
### **Check logs** <a name="CheckLogs"></a>
`docker-compose -f docker-compose.prod.yml logs -f vanilla-forums` <br>

### **Check container state** <a name="CheckContainerState"></a>
`docker-compose -f docker-compose.prod.yml ps` <br>