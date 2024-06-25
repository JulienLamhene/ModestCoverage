initialization
loadAllFrom: aPath
	| home aXMLCollection path|	
	home := ((FileLocator root) / (aPath withoutPrefix: '/')).
	path := home pathString , '/'.
	
	(home pathString endsWith: '/') ifFalse: [ 
		path := path , '/'.
		Transcript show: path; cr.
	].

	home := (home allChildren reject: [ :child | 
		child extension ~= 'xml' 
	]) sort.
	
	aXMLCollection := OrderedCollection new.
	home do: [ :file |
		aXMLCollection add:
			(self loadFrom: path on: file basename) ].
	^ aXMLCollection