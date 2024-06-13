accessing
allMethods: xPathNodeSet
	| methods coveredMeths|
	coveredMeths := xPathNodeSet select: [
	:coveredMeth |	
		(((coveredMeth nodeAt: 1) attributeAt: 'covered') asXMLString asString asInteger > 0)
	].
	methods := Array new: (coveredMeths size).
	1 to: (coveredMeths size) do: [ :i | 
		methods at: i put: ((coveredMeths at: i) attributeAt: 'name')
	].
	coveredMethods at: 'methods' put: methods.