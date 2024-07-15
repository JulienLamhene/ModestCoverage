accessing
getARandomMethodFrom: aFile
	|methods|
	methods := self allMethodsFrom: aFile.
	^ methods atRandom.