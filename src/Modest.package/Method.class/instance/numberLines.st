accessing
numberLines
	^ (counters at: 2) missed asInteger + (counters at: 2) covered asInteger.