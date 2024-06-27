initialization
loadLinesfor: aMethod
	| sline idx idxEnd |
	sline :=  coveredLines detect: [ :line | line number = aMethod startLine ].
	idx := coveredLines indexOf: sline.
	idxEnd := (idx + aMethod numberLines) - 1.
	idx to: idxEnd do: [ :i | 
		aMethod lines add: (coveredLines at: i).
	].