initialization
loadCounters: aXPathNodeSet

	1 to: (aXPathNodeSet size) do: [ :i |
		"Transcript show: i; show: ' : ' ; show: ((aXPathNodeSet at: i) attributeAt: 'name'); show: ' nodes : '; show: ((aXPathNodeSet at: i) nodes size); cr."
		1 to: ((aXPathNodeSet at: i) nodes size) do: [ :j |
			| counterMet |
			Transcript show: 'i : '; show: i; tab; show: 'j : '; show: j; cr.
			counterMet := CounterMetric new.
			counters at: j put: (counterMet
				type: (((aXPathNodeSet at: i) nodeAt: j) attributeAt: 'type');
				covered: (((aXPathNodeSet at: i) nodeAt: j)attributeAt: 'covered');
				missed: (((aXPathNodeSet at: i) nodeAt: j) attributeAt: 'missed')).
			"counters at: j put: counterMet."
		].
	].