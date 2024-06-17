as yet unclassified
counterFor: aMethod
	| xPathEntity method |
	xPathEntity := '//class[@name="coverage/',self className,'"]/method[@name="',(aMethod name),'"][@desc="',(aMethod desc),'"]'.
	method := (self document xpath: xPathEntity) at: 1.
	1 to: 4 do: [ :i |
		| counterMet |
		counterMet := CounterMetric new.
		counterMet type: ((method nodeAt: i) attributeAt: 'type').
		counterMet covered: ((method nodeAt: i)attributeAt: 'covered').
		counterMet missed: ((method nodeAt: i) attributeAt: 'missed').
		aMethod counters at: i put: counterMet.
	].