instance creation
methodFrom: aXMLElement
	"Idea for later -> methodFrom: aXMLElement"
	Transcript show: aXMLElement nodes size;cr.
	^ self new
			name: (aXMLElement attributeAt: 'name');
			desc: (aXMLElement attributeAt: 'desc');
			startLine: (aXMLElement attributeAt: 'line');
			loadCounters: aXMLElement.