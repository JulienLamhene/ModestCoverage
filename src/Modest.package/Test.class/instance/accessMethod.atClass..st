accessing
accessMethod: aMethod atClass: aFileName
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	^ (self methodsOf: aFileName) detect: [ :method | method name = aMethod ].