A Test here, is a test method of a test class

A test at least use one method, so it can access informations about the methods and lines it uses, learn about their coverage, compare itself with other test

Public API and Key Messages

- message one
- message two
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.

Internal Representation and Key Implementation Points.

    Instance Variables
	coveredLines:		<Dictionnary> -> A Dictionnary with a file - list of Line relation, for a file given, such lines are used
	coveredMethods:		<Dictionnary> -> A Dictionnary with a file - list of Method relation, for a file given, such methods are used
	name:		<ByteString> -> The name of the test, how it called


    Implementation Points