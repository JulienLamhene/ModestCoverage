accessing
allLinesOfMethod: aMethod atClass: aClass
	"For a method provening from a File, this method will return all lines of this method, without duplicates like oposed to collectLinesOfMethod:atClass:"
	| array collection lines |
	array := self collectLinesOfMethod: aMethod atClass: aClass.
	collection := (array collect: [ :l | l number asInteger ]) asSet asOrderedCollection sort.
	lines := OrderedCollection new.
	1 to: (aMethod totalLines) do: [ :i | 
	lines add: (array detect: [:l | 
		(l number asInteger = (collection at: i))
	]).
].
	^ lines.