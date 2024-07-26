accessing
accessMethod: aMethod atClass: aFileName
	"Return the info of the method used by the test"
	^ (self methodsOf: aFileName) detect: [ :method | 
		(method name = aMethod name) & (method desc = aMethod desc)].