instance creation
lineFrom: aXPathNodeSet at: idx
	"Will create a Line coming from the idx of the XPathNode"
	"XPathNodeSet is of the schema : <line nr='X' mi='X' ci='X' mb='X' cb='X'/>"
	^ self new
			number: ((aXPathNodeSet at: idx) attributeAt: 'nr');
			coveredInstruction: ((aXPathNodeSet at: idx) attributeAt: 'ci');
			missedInstruction: ((aXPathNodeSet at: idx) attributeAt: 'mi').