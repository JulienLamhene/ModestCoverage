accessing
combiOf: size
	^ combinations select: [ :c | c combi size = size ].