accessing
findTestByClass: aClass andMethod: aMethod
	
	^ (tests at: aClass) select: [ :t | 
		(t coveredMethods) anySatisfy: [ :method | 
			method anySatisfy: [ :m | 
				((m name = aMethod name) & (m desc = aMethod desc ))
			]
		]		
	].