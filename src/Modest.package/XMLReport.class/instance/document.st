accessing
document
	"This method load our document XML"
	| xmlString |
	xmlString := self report readStream upToEnd.
	^ XMLDOMParser parse: xmlString