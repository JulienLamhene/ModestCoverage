accessing
findTestByMethod: aMethod
	
	^ (tests select: [ :test |
		test anySatisfy: [ :t | 
			(t coveredMethods) anySatisfy: [ :method | 
				method anySatisfy: [ :m | 
					m name = aMethod ]
				]
			]
		]).