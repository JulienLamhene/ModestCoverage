initialization
loadCounters: aXMLElement
	1 to: (aXMLElement nodes size) do: [ :j |
		| counterMet |
		counterMet := CounterMetric new.
		counterMet
			type: ((aXMLElement nodeAt: j) attributeAt: 'type');
			covered: ((aXMLElement nodeAt: j)attributeAt: 'covered');
			missed: ((aXMLElement nodeAt: j) attributeAt: 'missed').
		counters add: counterMet.
	].