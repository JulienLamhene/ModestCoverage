sorting
sortByClass: aTestCollection
	| aTestDictionnary classNames |
	aTestDictionnary := Dictionary new.
	classNames := (aTestCollection collect: [ :report | report className]) asSet.
	classNames do: [ :className | 
		aTestDictionnary
			at: className put: (aTestCollection select: [:test | 
				test className = className 
			]).
	].
	^ self new tests: aTestDictionnary.