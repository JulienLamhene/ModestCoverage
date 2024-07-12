accessing
collectLinesOfMethod: aMethod atClass: aClass
	"For a method provening from a File, this method will return all lines of this method"
	| collection lines |
	collection := self findTestByClass: aClass andMethod: aMethod.
	lines := ((collection collect: [ :t | (t accessMethod: aMethod atClass: aClass) lines]) flattened).
	^ lines.