A TestCatalog is kind of a library for our tests, where for a category (a file), we find all the tests concerning this one file
To put in a clear exemple, looking into the key 'FileA.java', will return all the tests using methods coming from this file

Internal Representation and Key Implementation Points.

Instance Variables
tests:		<Dictionnary> -> A Dictionnary with the relation file -> OrderedCollection of Test
