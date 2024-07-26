private
filterUnion: uniLines
	"Used in union covered, get rid of duplicated Lines"
	| linesMeth uniCombi |
	uniCombi := OrderedCollection new.
	linesMeth := (uniLines collect: [ :l | l number asInteger ]) asSet asOrderedCollection sort.
	
	1 to: (linesMeth size) do: [ :i | 
		uniCombi add: (uniLines detect: [ :l | 
			(l number asInteger = (linesMeth at: i))])
	].

	^ uniCombi.