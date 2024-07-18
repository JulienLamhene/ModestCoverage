accessing
unionOnMethod
	| test other line line2 united uni |
	test := self at: 2 at: 1 at: 1.
	other := self at: 2 at: 1 at: 2.

	line := (test accessMethod: method atClass: file) lines.
	line2 := (other accessMethod: method atClass: file) lines.
	united := OrderedCollection new.

	uni := ((line union: line2) collect: [:l | l number asInteger]) asSet asOrderedCollection sort.
	1 to: (uni size) do: [ :i |
		united add: ((line union: line2) detect: [ :l |
			(l number asInteger = (uni at: i)).
		])
	].
	^ united.