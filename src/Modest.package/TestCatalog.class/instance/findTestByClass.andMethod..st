accessing
findTestByClass: aClass andMethod: aMethod
	"Will return the tests using such method from such class"
	^ ((tests at: aClass) select: [ :t | 
		(t coveredMethods) anySatisfy: [ :method | 
			method anySatisfy: [ :m | 
				((m name = aMethod name) & (m desc = aMethod desc ))
			]
		]		
	]).