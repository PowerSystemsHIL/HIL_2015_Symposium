# HIL_2015_Symposium
Hardware-in-the-Loop Massachusetts CEC 2015 Code

Folder
No.	Name	Description
01	Documents	Contains the presentation, technical report, user’s guide and pointers to Woodward related documentation

Review these files first:
•	01 Technical Report (1203)
•	02 Microgrid Controller HIL Demonstration Platform Presentation
•	03 User's Guide - HIL Platform
02	Generator System	Contains documentation and test for the modeling of the Woodward and genset controllers
03	Interface Box Design	This folder contains all drawings and documentation (or pointer to external sources) required to replicate the interface box between the Woodward controllers and the Opal-RT simulator
04	Top Level Model	Folder containing the simulated case during the symposium
•	Model libraries
•	System connectivity and parameters
•	Modbus configuration files
•	Test stimuli (load profiles, irradiance profiles, etc)


This package was tested using the following tools:
•	Matlab/Simulink 2011b (32bit)
•	Simulink 2011b - SimPowerSystems
•	Simulink 2011b – Simscape
•	RT-LAB (Opal-RT)
o	ARTEMIS solver
•	Simulink 2011b – Coder
•	Woodward toolkit
o	EasyGen 3500 

The two genetator models were tested using the following tools (path: HIL2015_Symposium_Package\02 Generator System):
•	Matlab/Simulink 2011b (32bit)
•	Simulink 2011b - SimPowerSystems
•	Simulink 2011b – Simscape

2015 MITLL Technical Report: 
https://www.ll.mit.edu/mission/engineering/Publications/TR-1203.pdf


