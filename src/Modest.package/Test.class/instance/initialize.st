initialization
initialize
	super initialize.
	coveredLines := OrderedCollection new.
	coveredMethods := OrderedCollection new.
	name := ''.