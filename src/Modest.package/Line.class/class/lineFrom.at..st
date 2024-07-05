instance creation
lineFrom: aXPathNodeSet at: idx
	^ self new
			number: ((aXPathNodeSet at: idx) attributeAt: 'nr') asInteger;
			coveredInstruction: ((aXPathNodeSet at: idx) attributeAt: 'ci');
			missedInstruction: ((aXPathNodeSet at: idx) attributeAt: 'mi').