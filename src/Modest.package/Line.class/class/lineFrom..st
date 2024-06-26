instance creation
lineFrom: aXMLNodeList
	| lines |
	lines := OrderedCollection new.
	1 to: aXMLNodeList size do: [ :i | 
		lines add: (self lineFrom: aXMLNodeList at: i)
	].
	^ lines.