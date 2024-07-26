accessing
getARandomMethodFrom: aFile
	"Return a random method from the one from the file in parameter"
	|methods|
	methods := self allMethodsFrom: aFile.
	^ methods atRandom.