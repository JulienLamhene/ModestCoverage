The representation of a method of a class, a functionnality of the class

A file may have several methods however a test only some of them, so this method here conceive to indicate wich method are used by a test. 
The informations it carry concern, to what line it start, and what lines are used
We identifie a Method by his name and description.

Public API and Key Messages

- 

Internal Representation and Key Implementation Points.

    Instance Variables
	counters:		OrderedCollection of Counter -> A counter are metric data carrying info about precise coverage of a method (like line, instruction, etc.)
	desc:		ByteString -> The description, signature of the method
	lines:		OrderedCollection of Lines -> The lines used by the method
	name:		ByteString -> Its name
	startLine:	ByteString -> The number of line where the method start
