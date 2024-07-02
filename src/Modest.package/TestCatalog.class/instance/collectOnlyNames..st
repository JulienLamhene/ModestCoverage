accessing
collectOnlyNames: aCollection
	| names |
	names := (aCollection collect: [:m | m name]).
	names := (names asSet) asOrderedCollection.
	^ names.