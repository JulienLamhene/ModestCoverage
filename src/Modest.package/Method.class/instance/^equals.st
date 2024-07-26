comparing
= aMethod
	"Check if a method is equal to another by his coverageByLine"
	^ (self name = aMethod name) 
		& (self desc = aMethod desc) 
		& (self lines = aMethod lines).