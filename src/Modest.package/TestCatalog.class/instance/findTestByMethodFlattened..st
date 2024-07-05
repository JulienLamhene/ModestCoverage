accessing
findTestByMethodFlattened: aMethod
	
	^ (self findTestByMethod: aMethod) flattened select: [ :elt | 
		elt coveredMethods anySatisfy: [ :methods | 
			methods anySatisfy: [ :m | 
				(m name = aMethod name) & 
				(m desc = aMethod desc) ]
		]
	].