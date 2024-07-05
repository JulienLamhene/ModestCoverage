accessing
allLinesOfMethod: aMethod atClass: aClass
	| collection lines |
	collection := self findTestByClass: aClass andMethod: aMethod.
	lines := ((collection collect: [ :t | (t accessMethod: aMethod atClass: aClass) lines]) flattened).
	^ (lines collect: [ :line | line number asInteger ]) asSet asOrderedCollection sort.