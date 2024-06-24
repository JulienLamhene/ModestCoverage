instance creation
methodFrom: aXPathNodeSet at: idx
	"Idea for later -> methodFrom: aXMLElement"
	Transcript show: 'aXPathNodeSet : '; show: aXPathNodeSet size;cr.
	^ self new
			name: ((aXPathNodeSet at: idx) attributeAt: 'name');
			desc: ((aXPathNodeSet at: idx) attributeAt: 'desc');
			startLine: ((aXPathNodeSet at: idx) attributeAt: 'line')";
			loadCounters: aXPathNodeSet".