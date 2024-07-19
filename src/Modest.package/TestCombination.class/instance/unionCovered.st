accessing
unionCovered
	| union lines uni |
	uni := OrderedCollection new.
	lines := OrderedCollection new.
	1 to: (self size) do: [ :i | 
		| tmpLines |
		tmpLines := ((self combi at: i) accessMethod: method atClass: file) lines.
		lines := (tmpLines union: lines) reject: [:elt | elt isNil].
	].
	union := (lines collect: [ :l | l number asInteger ]) asSet asOrderedCollection sort.
	1 to: (union size) do: [ :i | 
		uni add: (lines detect: [ :l | (l number asInteger = (union at: i))])
	].
	coverage := uni sum: [ :l | l coveredInstruction asInteger ].
	^ uni.