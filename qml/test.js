.pragma library

var testData = " \
Work Item: Approved Software	More Info...\
Transitions: Close Work Item | Set Development Complete Date\
Where am I?\
\
CR ID: 	LF#1402949	Status: 	wi_approved_sw\
Submitter: 	Dallmen, Lloyd (dallmenl)	Submitter Department:\
Create Time: 	05/17/2022 10:17:21\
Team Assignment:\
Any\
Customer: 	AIR CANADA\
* Assignee:\
Glover, Mark (abi_mark.glover)\
Click to define a custom user list.	Assignee Department: 	abi\
Work Item Type: 	Third Party	Blank Estimate: 	Risk\
Work Item Status:\
In Progress\
Program ID: 	GAC77305\
System Type:\
X Series\
Development Complete Date:\
System Subtype:\
None\
Third Party Company: 	abi\
Software Build Fixed: 		Local To Issue: 	true\
Software Version Fixed: 		Master Shared: 	false\
CR Reference: 		Original Dev Complete Date:\
Development Complete Update Source: 		Past Due:\
Subscribe: 	false Edit	Schedule:\
Title: 	ACA B777 eX3 - Meal2 working for j-cabin but does not link to correct BOB (goes to default service)\
Description:\
ACA B777 eX3 - Meal2 working for j-cabin but does not link to correct BOB (goes to default service)\
Reproduce the Problem:\
Expand the textbox.	Shrink the textbox.\
SCRB Minutes:\
Change Summary:\
[HD 5/9]: After a call with with AirBone we have added the selection of J and PY into NA services only so the Y services so the interactive can link J and PY seat to Bistro menus. This has been tested and is working fine on v129. Note that there is no link to A la carte one international flights so the link will fall back to the default service of meal1                                                                                                                           [MG 5/2]: Non Anuvu Issue, this is Airborne (Interactive). @Lloyd dAllmen shared with Interactive team investigate\
Expand the textbox.	Shrink the textbox.\
Parent Issue: 	Expand | Collapse\
CR ID	Status	Assignee	Issue Priority	Development Complete Date	Schedule	Master Issue Schedule\
LF#1402947	i_working	Dallmen, Lloyd (dallmenl)	High\
Peer Work Items: 	Expand | Collapse\
Click on Expand link to display the objects\
Associated SCR(s): 	Expand | Collapse\
Click on Expand link to display related objects\
Associated ESRR: 	Add | Expand | Collapse\
No Associated Objects\
Associated ECSRR(S): 	Add | Expand | Collapse\
Click on Expand link to display the CRS\
Work Item Notes Entry:\
Expand the textbox.	Shrink the textbox.\
Work Item Notes:\
\
05/17/2022 10:17:26 N/A, N/A (_change_admin)\
_change_admin has Approved SPR Analysis for Issue 1402947\
Attachments	Down\
Log	Down\
\
Transitions: Close Work Item | Set Development Complete Date\
\
"

function getTestData() {
	return testData
}
