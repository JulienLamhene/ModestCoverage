initialization
loadReport
	"By loading our report entity and file are fille with the corresponding values"
	| xPathEntity xPathFile |
	xPathEntity := '//class[@name="coverage/',self fileName,'"]/method'.
	xPathFile := '//sourcefile[@name="',self fileName,'.java"]'.
	
	entity := self document xpath: xPathEntity.
	file := self document xpath: xPathFile.