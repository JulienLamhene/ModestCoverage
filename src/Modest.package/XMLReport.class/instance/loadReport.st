initialization
loadReport
	"This method allow to load the xmlReport of a test"
	| xPathEntity xPathFile |
	xPathEntity := '//class[@name="coverage/',self className,'"]/method'.
	xPathFile := '//sourcefile[@name="',self className,'.java"]'.
	
	entity := self document xpath: xPathEntity.
	file := self document xpath: xPathFile.