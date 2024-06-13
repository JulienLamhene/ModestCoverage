initialization
loadFrom: path on: nameT
	"This method allow to load the xmlReport of a test"
	^	self new path: path; name: nameT; loadReport.