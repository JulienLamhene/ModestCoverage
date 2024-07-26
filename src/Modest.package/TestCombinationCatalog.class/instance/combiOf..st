accessing
combiOf: size
	"Return the combination of the size wanted"
	^ combinations select: [ :c | c combi size = size ].