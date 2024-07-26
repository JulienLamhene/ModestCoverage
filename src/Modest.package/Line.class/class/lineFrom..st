instance creation
lineFrom: aXMLNodeList
	"Create a collection of lines"
	| lines |
	lines := OrderedCollection new.
	1 to: aXMLNodeList size do: [ :i | 
		lines add: (self lineFrom: aXMLNodeList at: i)
	].
	^ lines.