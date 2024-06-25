accessing
numberLines
	|counterLine|
	counterLine := counters detect: [ :counter | counter type = 'LINE' ].
	^ "counterLine missed asInteger +" counterLine covered asInteger.