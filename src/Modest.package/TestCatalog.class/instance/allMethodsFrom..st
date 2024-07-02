accessing
allMethodsFrom: aFile
	| array methods names |
	array := self collectMethodsFrom: aFile.
	names := self collectOnlyNames: array.
	methods := OrderedCollection new.
	1 to: (names size) do: [ :i | 
	methods add: (array detect: [ :m | 
		m name = (names at:i) 
		]).
	].
	^ methods.