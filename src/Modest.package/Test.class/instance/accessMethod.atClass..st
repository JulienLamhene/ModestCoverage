accessing
accessMethod: aMethod atClass: aFileName

	^ (self methodsOf: aFileName) detect: [ :method | 
		(method name = aMethod name) & (method desc = aMethod desc)].