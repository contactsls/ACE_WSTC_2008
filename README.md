# ACE_WSTC_2008
IBM Message Broker reusable framework
LMR - POC
 (Process Services)
Message Broker Build and Deploy Reusable Framework

Version 2.0


 

 
Revision History
Date	Version	Description	Author
09/10/2007	1.0	Initial version.	Parker Behseta
09/12/2007	1.0	Added sections 3, 4, 5, and 6. Modified section 2 (added another use case).	Parker Behseta
09/13/2007	1.0	Completed sections 6, 9, and References	Parker Behseta
09/14/2007	1.0	Added Overview to Section 5 	Parker Behseta

 
Table of Contents
1.	Introduction	4
1.1	Purpose	4
1.2	Scope	4
1.3	Definitions, Acronyms, and Abbreviations	4
1.4	Overview	4
2.	Overview of Functional Requirements (Use Cases)	5
2.1	Use Case 1 – Create Standardized Projects:	5
2.2	Use Case 2 – Headless Build and Deploy of BAR files	5
2.3	Use Case 3 – Environment Based Configuration	6
2.4	Use Case 4 – Extend the framework	6
3.	Framework Goals and Capabilities	7
3.1	Headless Builds:	7
3.2	Reusability:	7
3.3	Repeatability:	7
3.4	Extendibility:	7
3.5	Version Control:	7
4.	Assumptions, Risks and Constraints	7
5.	Logical Architecture of Framework	8
5.1	Overview	8
5.2	Use case 1 – Create Standardized Projects	8
5.3	Use Case 2 – Headless Build and Deploy of BAR files	9
5.4	Use Case 3 – Environment Based Configuration	12
5.5	Use Case 4 – Extend Framework	13
6.	Deployment Model	15
7.	References	15
 
Message Broker Build and Deploy Reusable Framework 
1.	Introduction
IBM’s Message Broker is a member of WebSphere Business Integration (WBI) family of products designed to facilitate communication among disparate systems. Message Broker performs several key functions including data transformation and augmentation, content and policy based routing, and Public/Subscribe. Message Broker, along with IBM WebSphere MQ, is a fundamental element in an Enterprise Service Bus (ESB) model within a Service Oriented Architecture (SOA). 
1.1	Purpose
The purpose of this document is to describe the functions and capabilities of the “Message Broker Build and Deploy Reusable Framework” (called Framework). The Framework is designed to automate the process of building and deploying Message Broker Archive (BAR) files. The focus of Framework currently is on providing headless Build and Deploy process (without using the Message Broker Toolkit) facilities. However, it can be extended to include other administrative functions as well (including creating and managing brokers, configuration managers …).

The present Framework document is intended for the following audiences.
Audience	Usage
Developers	To develop the message broker application and use the guidelines for nomenclature.
To extend the framework for additional functionality
Deploy Master	To facilitate build and deploy process by using a repeatable process with a reusable framework.
Infrastructure Architect	To design the environment to support the process and deployment models of the framework.


1.2	Scope
The scope of the framework is mainly in automating and providing a repeatable process to build and deploy BAR files. The framework provides facilities to include various Message Broker projects and artifacts within projects (message flows, dictionaries, maps…) in the BAR files at deploy time (based on configuration files). In addition, the Framework allows for building and deploying several BAR files to various brokers and execution groups at deploy time.

The framework does not provide the facilities to select multiple brokers and execution groups for each BAR file.

However, the techniques introduced in this framework and detailed documentation provided here, allow for relatively easy extension of the framework for additional capabilities in the future.
1.3	Definitions, Acronyms, and Abbreviations
EIS – Enterprise Integration Services
BAR – Message Broker Archive files
ESB – Enterprise Service Bus
1.4	Overview
In section 2, the functional requirements of framework are described. These are the capabilities (or use cases).  In sections 3, 4, and 5 the goals, capabilities, assumptions, risks and constraints for the framework is discussed. In sections 6, 7, 8, and 9 in various models or views – logical, physical, use-case, process and deployment.
 
2.	Overview of Functional Requirements (Use Cases)

The use cases described below are high level and specify functional requirements that are significant for the framework. The more detail specifications can be found in Section 6 – Logical Requirements

2.1	Use Case 1 – Create Standardized Projects:


 
Figure 1: Create Standardized Projects

This use case describes the nomenclature requirements for message broker projects and artifacts. The framework is designed based on a standardized approach for naming the artifacts. This approach requires developers to follow this naming standards, otherwise they can’t use framework. Once artifacts are created, they are checked into Clearcase. The tool developer use to create the artifacts is Message Broker Toolkit. The details are discussed in section 6.

2.2	Use Case 2 – Headless Build and Deploy of BAR files
 
Figure 2: Headless Build and Deploy

This use case describes the process of invoking and using the framework to create headless builds and deploy them by the developers. The emphasis on this use case is on installing, configuration, and invoking the framework. The inner working logic of the framework is discussed in Use Case 3. In this use case, the developer installs and configures the framework. Subsequently, the developer invokes the frame work to build and deploy BAR files.

2.3	Use Case 3 – Environment Based Configuration
 
Figure 3: Environment Based Configuration

This use case describes the capabilities of the Framework to dynamically configure the “Configured Properties” of project artifacts to match various environments. This capability allows dynamic configuration of project artifacts at deploy time using a property file. 

2.4	Use Case 4 – Extend the framework

 
Figure 4: Extending Framework

This use case describes the details inner working and design of the framework. The emphasis is on describing the techniques and design features of the framework and the relationship among various pieces of it. The developers can model these techniques and extend the framework.

 
3.	Framework Goals and Capabilities
3.1	Headless Builds: 
The framework allows build and deploy of BAR files without user intervention or using the Message Broker Toolkit. 

3.2	Reusability: 
The framework is highly configurable and can be used for various Message Broker projects in many environments.

3.3	Repeatability: 
The framework provides a repeatable process with consistent results. This capability facilitates the process of developing and managing BAR files considerably.

3.4	Extendibility: 
The framework is designed to allow for extending of its capabilities. Developers can model the design features of the broker and add more functionality.

3.5	Version Control: 
Framework uses version control facilities of broker to manage the projects and projects artifacts versions. 

4.	Assumptions, Risks and Constraints
Assumption(s):
1.	Both developers and Build Masters use Windows XP for running framework.
2.	The four environments including: DEV, SIT, UAT, and PROD are setup separately and run on their own without any interactions.
Risk(s):
1.	Compatibility issues with between the developers environment (where the project artifacts are created) and Build Master environment (where the framework runs). It is recommended to use the same version and fix packs for broker and toolkit to alleviate this risk 

Constraint(s):
 
5.	Logical Architecture of Framework 
5.1	Overview
This section provides detail discussion on various use cases and their implementation. Here is an overview of the process:
 
Figure 5 – Overview of Framework Build and Deploy Process

5.2	Use case 1 – Create Standardized Projects
The framework uses the project name and messageset names as the basis for other project’s artifacts name (i.e. BAR file name, Execution Group name). 

These are the configurable parameters needed to build the other artifacts: 

•	Project Name “project.name” in Projects.list file
•	Project Root “project.root” in Barfile.properties
•	Project Workspace “project.workspace” in Barfile.properties
•	Messageset name.

This is the convention used for artifacts:
•	Project name:
This artifact is named based on LMR standards for naming Message Broker projects as:
<project.name> (e.g. ESQL_Bookstore)

•	Messageflow project:
This artifact is named based on LMR standards for naming message flow projects as:
<project.name>_MFP (e.g. ESQL_Bookstore_MFP)

•	Messageflow:
This artifact is named based on LMR standards for naming messageflows  as:
<project.name>_<messageflow name>_MF (e.g. ESQL_Bookstore_Order_Books_MF

•	Messageset project:
This artifact is named based on LMR standards for naming messageset projects as:
<project.name>_MSP (e.g., Mapping_Bookstore_MSP)

•	Messageset:
This artifact is named based on LMR standards for naming message sets as:
<project.name>_<messageset name>_MS (e.g., Mapping_Bookstore_Order_Books.MS

•	Barfiles
This artifact is named based on LMR standards for naming bar files as:
<project.name>.<environment name>.<version>.bar (e.g. ESQL_Bookstore_Dev_1.0.bar

•	Execution Groups
This artifact is named based on LMR standards for naming execution groups as:
<project.name>_EG
5.3	Use Case 2 – Headless Build and Deploy of BAR files
This use case describes the details related to Installation and invoking the Framework. 

•	Framework Hierarchy:
The Framework is imported as a zip file and should be extracted in the root directory (i.e. C:\)

 
Figure 6 – Framework Hierarchy
The Framework includes four folders:
•	Build: 
Contains configuration files and a batch file to invoke the Framework (DeployAll.bat)

•	Deploy:
Contains bar files.

•	Projects
Contains Message Broker Toolkit projects

•	Scripts
Contains Ant (and other scripts)

•	Build directory:
This directory has two important files:
o	DeployAll.bat file:
This file is a windows batch file and has the logic to invoke multiple projects. The name of the projects in kept is a separate file (Projects.list) 

o	Projects.list
This file has the list of projects that are invoked. DeployAll.bat used this list to invoke selected projects. This is the file’s content:

ESQL_Bookstore
Java_Bookstore

This directory has several folders each named after a <project.name>. Each <project.name> folder in Deploy directory has several configuration files:
o	BarFileOverride.properties:
This file is used to setup the environment specific properties in the BAR files (e.g., input queue names, data source names, …). This is the file’s content:


WBRK6_DEFAULT_QUEUE_MANAGER = WBRK6_DEFAULT_QUEUE_MANAGER_PROD
ESQL_SIMPLE_OUT = ESQL_SIMPLE_OUT_PROD
ESQL_SIMPLE_IN = EQSL_SIMPLE_IN_PROD

o	Broker.list:
This file contains the list of Brokers to be used for deploying BAR files. This version of Framework supports only one broker in this list. This is the file’s content:

 WBRK6_DEFAULT_BROKER

o	ExecGrp.list:
This file contains the list of Execution Groups to be used for deploying BAR files. This version of Framework supports only one Execution Group in this list. This is the file’s content:

ESQL_Bookstore_EG

o	MBP.list:
This file contains a list of Message Broker projects. The Framework supports multiple Message Broker projects. This is the file’s content:

ESQL_Bookstore_MFP ESQL_Simple_MFP

o	MBP.artifacts.list:
This file contains a list of Message Broker projects artifacts. The Framework supports multiple artifacts. This is the file’s content:

ESQL_Bookstore_MFP\ESQL_Bookstore_Book_Order_MF.msgflow ESQL_Bookstore_MFP\ESQL_Bookstore_Create_Customer_Account_MF.msgflow ESQL_Simple_MFP\ESQL_Simple_MF.msgflow

o	SG24713700.configmgr:
This file contains parameters to connect to configuration manager. This version of Framework supports one configuration managers only. This is the file’s content:

<?xml version="1.0" encoding="UTF-8"?>
<configmgr crlNameList="" domainName="WBRK6_DEFAULT_CONFIGURATION_MANAGER" host="localhost" listenerPort="2414" queueManager="WBRK6_DEFAULT_QUEUE_MANAGER" securityExit="" securityExitJar="" sslCipherSuite="NONE" sslDistinguishedNames="" sslKeyStore="" sslTrustStore="" svrconn="SYSTEM.BKR.CONFIG"/>

•	Deploy:
This directory contains the BAR files that are ready for deployment. Each BAR file corresponds to one <project.name> folder in Deploy directory. Therefore, if three <project.name> are selected (in Projects.list file), there will be three BAR files in this directory. (how BAR File

•	Projects:
This folder contains the project workspace (and all included files and directories). The project workspace must be copied into this directory. This workspace is referenced in <project.workspace> property in Barfile.properties file.

•	Scripts:
This folder contains scripts including Ant scripts to build and deploy bar files.

These are the steps to invoke the Framework by Build Masters
•	Install Message Broker Toolkit and Message Broker runtime environments.
•	Install Ant.
•	Install the framework (unzip MessageBrokerFiles.zip to “C” directory).
•	Setup configuration files and properties (as explained above) of the Framework.
•	Open a command prompt.
•	Run “mqsiprofile”
•	Run DeployAll.bat. There will be comprehensive diagnostic messages printed in the command window.
•	Check the Deploy folder for BAR files. The number of BAR files should be the same as the number of entries in Projects.list file (e.g., if Projects.list contains three projects, there must be three BAR files in this directory).
•	Check the Broker for proper deployed artifacts.

5.4	Use Case 3 – Environment Based Configuration

This use case describes the facilities and technique used in the framework to set environment specific parameters at deploy time. This capability allows the Build Master to reuse the same scripts in various environments. 

The project artifacts can have configurable properties that can be set at deploy time by Build Master. These properties are shown in META_INF/broker.xml file (broker.xml is in the BAR file). Here is an example of two configurable properties in message flows: queue manager name and queue name:

<ConfigurableProperty override="WBRK6_DEFAULT_QUEUE_MANAGER" uri="ESQL_Bookstore_Book_Order_MF#ESQL_BOOKSTORE_BO_OUT.queueManagerName" /> 

<ConfigurableProperty override="ESQL_BOOKSTORE_BO_IN" uri="ESQL_Bookstore_Book_Order_MF#ESQL_BOOKSTORE_BO_IN.queueName" /> 

These properties are dynamically set at deploy time by modifying BarFileOverride.properties file. This is a sample of property file and how they are modified:

WBRK6_DEFAULT_QUEUE_MANAGER = WBRK6_DEFAULT_QUEUE_MANAGER_PROD
ESQL_BOOKSTORE_BO_IN = ESQL_BOOKSTORE_BO_IN_PROD

Once the BarFileOverride.properties file is set it is accessed from the Ant script using “mqsiapplybaroverride” command. This is a sample of script:

<target name="mqsiapplybaroverride.overridebarfile" depends="mqsicreatebar.buildbarfile">
	<echo message="Executing mqsiapplyoverride.exe with args ${overrideBar.arg.line}"/>
	<exec executable="${mqsiapplybaroverride.exe}" >
		<arg line="${overrideBar.arg.line}"/>
	</exec>
</target>

5.5	Use Case 4 – Extend Framework

This use case describes the details of scripts. This information can be used for both troubleshooting and also extending the Framework.

The scripts are setup as a hierarch of folders corresponding to various objects including Broker Domain, Configuration Manager, Broker, Execution Groups …).  Most of these folders are currently empty. However, they are all connected to “BarFile” folder where Ant’s “Build.xml” file is located.  

 
Figure 7 – Framework’s Ant script Hierarchy

•	AntScriptsRoot2 folder:
This is the parent folder for all other scripts.

•	BrokerDomain folder:
This folder contains information related to Broker Domain. This folder is not used in this version of Framework. However, as the Framework is extended, Broker Domain specific information will be here. the folder contains two files:
o	BrokerDomain.properties:
No information here.

o	BrokerDomain.xml
generic Echo message only.

•	ConfigMgr folder:
This folder contains information related to the configuration file that holds parameters for connecting to Configuration Manager. the folder contains two files:
o	ConfigMgr.properties:
This file contains configuration file information. 

o	BrokerDomain.xml
No information here.

•	Broker folder:
This folder contains information related to Broker run time. The folder contains two files:
o	BrokerDomain.properties:
This file contains information related to Broker run time API (location on the system), “mqsideploy.bat” command, and parameters needed for the command.

o	BrokerDomain.xml
This file contains Ant’s target: <target name="mqsideploybar.deploybarfile"> that deploys the bar files.

•	ExecutionGroup folder:
This folder contains information related to the Broker’s Execution Groups where BAR files are deployed. The folder is the parent folder for the remaining four folders. It also contains two files:
o	ExecutionGroup.properties:
This file contains information related to the list of execution groups. This version of Framewrok supports only one execution group for each BAR file deployment.

o	ExecutionGroup.xml
This file contains the information related to the location of the list for execution groups.

•	BarFile folder:
This folder is the main folder of the script where Ant’s build.xml target resides. There are three files in this folder:
o	Build.xml:
This is the main file and is starting point to build and deploy BAR files. This is the order of events:
	<target name="run"> is called by the invoking batch file (DeployAll.bat).
	<target name="mqsicreatebar.buildbarfile"> is called. This Ant target reads the parameters and creates the BAR file.
	<target name="mqsiapplybaroverride.overridebarfile> is called. This Ant target reads the parameters and overrides the required ones.
	<antcall target="mqsideploybar.deploybarfile"/> is called. This Ant target read the parameters and deploys the bar file.

o	Barfile.properties:
This is the main property file. This file uses the <project.name> parameter that is passed to it from commend line and builds other properties that are used by other Targets. This logic requires standardized naming (as described in Use Case 1).

o	BarFile.xml
This file mainly echoes operating system environment variables.
6.	Deployment Model 
Broker Toolkit is deployed to developers workstations. The framework is deployed to the Build Master’s workstation. The connection between these two is usually through IBM Rational Clear case. However, there are other means of transferring files.
7.	References
Install Message Broker:
http://publib.boulder.ibm.com/infocenter/wmbhelp/v6r0m0/index.jsp?topic=/co

Install Ant:
http://ant.apache.org/manual/index.html

BAR file configurable properties:
 
Diagnostic Messages:
 

Configurable Property:
http://publib.boulder.ibm.com/infocenter/wmbhelp/v6r0m0/index.jsp?topic=/co

mqsiapplybaroverride
http://publib.boulder.ibm.com/infocenter/wmbhelp/v6r0m0/index.jsp?topic=/co

mqsideploy
http://publib.boulder.ibm.com/infocenter/wmbhelp/v6r0m0/index.jsp?topic=/co

