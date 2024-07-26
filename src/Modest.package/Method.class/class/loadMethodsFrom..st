instance creation
loadMethodsFrom: aXMLNodeList
	"Return a collection of method from the xml list"
	| methods |.
	methods := OrderedCollection new.
	1 to: aXMLNodeList size do: [ :i | 
		methods add: (self methodFrom: (aXMLNodeList at: i))
	].
	^ methods