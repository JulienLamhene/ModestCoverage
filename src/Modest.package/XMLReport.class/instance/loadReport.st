initialization
loadReport
	"This method allow to load the xmlReport of a test"
	| xmlString document xPathEntity xPathFile idx className|
	xmlString := (self report) readStream upToEnd.
	document := (XMLDOMParser parse: xmlString) document.

	idx := name asText findString: '.' startingAt: 1.
	className := name copyFrom: 1 to: (idx - 5).
	
	xPathEntity := '//class[@name="coverage/',className,'"]/method'.
	xPathFile := '//sourcefile[@name="',className,'.java"]'.
	
	entity := document xpath: xPathEntity.
	file := document xpath: xPathFile.