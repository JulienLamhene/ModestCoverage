as yet unclassified
combinationsWellReparted
	"In progess"
	|maxComb col coffeeTest method file|
	file := (self at: 1) file. 
	method := (self at: 1) method.
	col := ''.
	maxComb := ''.
	coffeeTest := ''.
	combinations indexOf: col.
	(maxComb detect: [ :c | c combi includesAll: ((col at: 1) combi) ]).

	col := OrderedCollection new.
	coffeeTest do: [ :t | 
		| l combiT |
		l := (t accessMethod: method atClass: file) lines.
		combiT := ((combinations reject: [ :c | 
			c combi includes: t]) select: [ :c | 
			((c unionCovered = l) ifNil: [ ])]).
		col add: combiT ].
	col := col flattened.