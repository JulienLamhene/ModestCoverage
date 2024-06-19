instance creation
methodFrom: aXPathNodeSet at: idx
	^ self new
			name: ((aXPathNodeSet at: idx) attributeAt: 'name');
			desc: ((aXPathNodeSet at: idx) attributeAt: 'desc');
			startLine: ((aXPathNodeSet at: idx)attributeAt: 'line');
			loadCounters: aXPathNodeSet.
	