sorting
sortByClass: aTestCollection
	| aTestDictionnary classNames |
	aTestDictionnary := Dictionary new.
	classNames := (aTestCollection collect: [ :report | report fileName]) asSet.
	classNames do: [ :className | 
		aTestDictionnary
			at: className put: (aTestCollection select: [:test | 
				test fileName = className 
			]).
	].
	^ self new tests: aTestDictionnary.