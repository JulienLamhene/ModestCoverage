as yet unclassified
loadCounters: aXPathNodeSet
	1 to: 4 do: [ :i |
		| counterMet |
		counterMet := CounterMetric new.
		counterMet type: (((aXPathNodeSet at: 1) nodeAt: i) attributeAt: 'type').
		counterMet covered: (((aXPathNodeSet at: 1) nodeAt: i)attributeAt: 'covered').
		counterMet missed: (((aXPathNodeSet at: 1) nodeAt: i) attributeAt: 'missed').
		counters at: i put: counterMet.
	].