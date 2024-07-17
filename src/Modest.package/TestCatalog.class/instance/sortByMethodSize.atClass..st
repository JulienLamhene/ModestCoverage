sorting
sortByMethodSize: method atClass: file
	"collection := collection sorted: [:a :b| (a accessMethod: method atClass: file) lines size > (b accessMethod: method atClass: file) lines size ]."
	| col |
	col := self findTestByClass: file andMethod: method.
	^ col sorted: [ :a :b | (a accessMethod: method atClass: file) >= (b accessMethod: method atClass: file)].