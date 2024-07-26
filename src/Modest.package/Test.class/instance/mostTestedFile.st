accessing
mostTestedFile
	"Among the file used by our test, will return the one most used by the size of number of methods used"
	|fileTested currentSize largestSize|
	largestSize := 0.
	(self coveredMethods) keysDo: [:key | 
		currentSize := ((self coveredMethods) at: key) size.
		(currentSize > largestSize) ifTrue: [
			fileTested := key.
			largestSize := currentSize.
		]].
	^ fileTested.