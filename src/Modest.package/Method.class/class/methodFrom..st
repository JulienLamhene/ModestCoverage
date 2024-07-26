instance creation
methodFrom: aXMLElement
	"Create a Method from a XMLElement"
	"aXMLElement :
	<method name=""setIdentity"" desc=""(I)V"" line=""25"">
		<counter type=""INSTRUCTION"" missed=""4"" covered=""0""/>
		...
	</method>"
	^ self new
		  name: (aXMLElement attributeAt: 'name');
		  desc: (aXMLElement attributeAt: 'desc');
		  startLine: (aXMLElement attributeAt: 'line');
		  loadCounters: aXMLElement.