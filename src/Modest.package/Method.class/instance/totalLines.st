accessing
totalLines
	"Return the original total number of lines of the original method"
	|counterLine|
	counterLine := counters detect: [ :counter | counter type = 'LINE' ].
	^ counterLine missed asInteger + counterLine covered asInteger.