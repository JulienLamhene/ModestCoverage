Line is the class who represent a line in file, a line in a Java class

Responsibility : what I do, what I know.
It exists to precise what line in a class and in a method is used or not, precisely by his number of line and the number of instructions it cover

Public API and Key Messages

- class methods :
	- lineFrom:at: -> Create a instance of a Line
	- lineFrom: -> Create an OrderedCollection of Line
Those methods are only called at the same time we create an object Test or Method by the way of XML objects, this way we have the corresponding lines of each instances.

Internal Representation and Key Implementation Points.

    Instance Variables
	coveredInstruction:		<ByteString> -> Represents the quantity of covered instruction in the line
	missedInstruction:		<ByteSring> -> Represents the quantity of missed instruction in the line
	number:		<ByteSring> -> The number of the Line where it appear in the source file