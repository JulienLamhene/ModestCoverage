tests
testFiles
	| xmlCatalog path testCatalog |
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	xmlCatalog := XMLCatalog loadAllFrom: path.
	testCatalog := TestCatalog fromXMLCatalog: xmlCatalog.
	self assert: testCatalog files equals: #('Duck.java' 'Coffee.java' 'Hen.java' 'BidirectionalPhoneBook.java' 'BreedingFarm.java' 'ProPhoneNumber.java' 'Goose.java').