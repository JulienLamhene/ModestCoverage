initialization
loadReport
	"The previous loadReport was adapted to only load info from the source file, this one is to also take into account that other file is used for a method"
	| xPathEntity xPathFile |
	xPathEntity := '//class'.
	xPathFile := '//sourcefile'.
	
	entity := self document xpath: xPathEntity.
	file := self document xpath: xPathFile.
	self coveredClasses.