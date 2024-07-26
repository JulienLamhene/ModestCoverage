accessing
numberLines
	"Return the number of lines used by the method"
	|counterLine|
	counterLine := counters detect: [ :counter | counter type = 'LINE' ].
	^ "counterLine missed asInteger +" counterLine covered asInteger.