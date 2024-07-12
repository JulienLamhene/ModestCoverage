accessing
allMethodsFrom: aFile
	"Return a collection of Methods which is all the methods from the file put in parameter"
	| array methods meths|
	array := self collectMethodsFrom: aFile.
	meths := (array collect: [ :m | { m name. m desc } ]) asSet asOrderedCollection sorted: [ :a :b | (a at:1) < (b at:1) ].
	"Transcript show: meths;cr."
	methods := OrderedCollection new.
	1 to: (meths size) do: [ :i | 
		methods add: (array detect: [ :m | 
			(m name = ((meths at: i) at: 1)) &
			(m desc = ((meths at: i) at: 2))
		]).
	].
	^ methods.