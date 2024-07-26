initialization
loadLinesOf: aClass for: aMethod
	"For a certain method and file, will fill the test with the correct lines"
	| lines start idx end|
	
	lines := coveredLines at: aClass.
	start := lines detect: [ :line | line number = aMethod startLine ].
	
	idx := lines indexOf: start.
	end := (idx + aMethod numberLines) - 1.
	
	idx to: end do: [ :i | aMethod lines add: (lines at: i). ].