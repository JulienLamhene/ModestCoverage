accessing
report
	"This method allow to have full name in the purpose to have the xml report"
	"We precise 'asFileReference' so that Pharo understand we wish to work with files
	either way it will still consider it as a string"
	^ (path, name) asFileReference.