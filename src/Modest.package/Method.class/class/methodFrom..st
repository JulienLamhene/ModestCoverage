instance creation
methodFrom: aXMLElement
	"Create a Method from a XMLElement"
	^ self new
		  name: (aXMLElement attributeAt: 'name');
		  desc: (aXMLElement attributeAt: 'desc');
		  startLine: (aXMLElement attributeAt: 'line');
		  loadCounters: aXMLElement.