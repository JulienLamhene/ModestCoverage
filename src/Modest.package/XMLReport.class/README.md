For this project of tests selection, the date we use are provided by XML report, so this class exist to incarnate a xml report, to load this data, and then use them, to create the fellow objects (Test, Method, etc...)

So this class is used to access the wanted data, and then create the corresponding objects, it distinguish between what are used for aTest, a Method or a Line, by storing the corresponding data in its variables instances entity (Method) and file (Line), and use them both to create a Test

Public API and Key Messages

- message one
- message two
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.

Internal Representation and Key Implementation Points.

    Instance Variables
	entity:		<XPathNodeSet> -> Store the date about the Method
	file:		<XPathNodeSet> -> Store everything concerning the Line
	name:		<ByteString> -> The name of the report
	path:		<ByteString> -> Its source, where can it be found
