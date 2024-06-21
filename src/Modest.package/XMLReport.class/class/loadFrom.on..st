initialization
loadFrom: path on: nameT
	"This method allow to create a XMLReport and load his report"
	^	self new path: path; name: nameT; loadReport.