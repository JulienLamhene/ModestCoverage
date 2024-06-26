initialization
loadLinesfor: aMethod
	| lines sline idx idxEnd |
	"Transcript show: aMethod name; show: ' number lines is : '; show: aMethod numberLines; cr."
	lines := aMethod.
	sline :=  coveredLines detect: [ :line | line number = aMethod startLine ].
	idx := coveredLines indexOf: sline.
	idxEnd := (idx + aMethod numberLines) - 1.
	idx to: idxEnd do: [ :i | 
		aMethod lines add: (coveredLines at: i).
	].