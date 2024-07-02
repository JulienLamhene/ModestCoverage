comparing
= aMethod
	^ (self name = aMethod name) 
		& (self desc = aMethod desc) 
		& (self lines = aMethod lines).