initialization
initialize
	super initialize.
	coveredLines := Dictionary new.
	coveredMethods := OrderedCollection new.
	name := ''.