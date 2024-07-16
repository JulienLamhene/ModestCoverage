removing
removeDuplicates: collections
	| uniques |
	uniques := OrderedCollection new.
	collections do:  [ :aTest |
		(uniques includes: aTest) ifFalse: [uniques add: aTest]
	].
	^ uniques.