instance creation
loadMethodsFrom: aXMLNodeList
	| methods |.
	methods := OrderedCollection new.
	1 to: aXMLNodeList size do: [ :i | 
		methods add: (self methodFrom: (aXMLNodeList at: i))
	].
	^ methods