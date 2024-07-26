coverage
coverageByLine
	"Calculate the coverage based on number of line used on total number of lines"
	^ (((self numberLines / self totalLines) * 100) asFloat) roundUpTo: 0.1.