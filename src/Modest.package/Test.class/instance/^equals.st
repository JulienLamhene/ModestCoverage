comparing
= aTest
	"Check if our test is equal to another by the methods and lines covereds"
	^ (self coveredMethods = aTest coveredMethods) 
		& (self coveredLines = aTest coveredLines)