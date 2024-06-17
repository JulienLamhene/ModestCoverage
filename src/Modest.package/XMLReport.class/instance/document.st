accessing
document
	| xmlString |
	xmlString := self report readStream upToEnd.
	^ XMLDOMParser parse: xmlString