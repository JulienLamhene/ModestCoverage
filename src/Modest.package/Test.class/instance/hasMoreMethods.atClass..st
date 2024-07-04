testing
hasMoreMethods: aTest atClass: aClass
	^ (self methodsOf: aClass) size > (aTest methodsOf: aClass) size.