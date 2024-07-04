accessing
mostTestedFile
	|fileTested currentSize largestSize|
	largestSize := 0.
	(self coveredMethods) keysDo: [:key | 
		currentSize := ((self coveredMethods) at: key) size.
		(currentSize > largestSize) ifTrue: [
			fileTested := key.
			largestSize := currentSize.
		]].
	^ fileTested.