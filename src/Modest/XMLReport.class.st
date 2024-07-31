"
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

"
Class {
	#name : #XMLReport,
	#superclass : #Object,
	#instVars : [
		'name',
		'path',
		'entity',
		'file'
	],
	#category : 'Modest-Base'
}

{ #category : #initialization }
XMLReport class >> loadFrom: path on: nameT [
	"This method allow to create a XMLReport and load his report"
	^	self new path: path; name: nameT; loadReport.
]

{ #category : #initialization }
XMLReport >> coveredClasses [
	"This method will filter our entity in so that we only have in our XPathNodeSet the data of class who have minimum of coverage for this report"

	entity := (entity select: [ :node | node nodes isNotEmpty ]) 
		select: [ :node |
			((node elementAt: 'counter') attributeAt: 'covered') asInteger > 0 	].
	file := (file select: [ :node | node nodes isNotEmpty ]) 
		select: [ :node |
			((node elementAt: 'counter') attributeAt: 'covered') asInteger > 0 	].
]

{ #category : #accessing }
XMLReport >> document [
	"This method load our document XML"
	| xmlString |
	xmlString := self report readStream upToEnd.
	^ XMLDOMParser parse: xmlString
]

{ #category : #accessing }
XMLReport >> entity [
	"A simple getter for our entity"
	^ entity.
]

{ #category : #accessing }
XMLReport >> file [
	"A simple getter for our file"
	^ file.
]

{ #category : #accessing }
XMLReport >> fileName [
	| idx |
	idx := name asText findString: '.' startingAt: 1.
	^ name copyFrom: 1 to: (idx - 5).
]

{ #category : #initialization }
XMLReport >> initialize [
	super initialize.
	name := ''.
	path := ''.
]

{ #category : #initialization }
XMLReport >> loadReport [
	"The previous loadReport was adapted to only load info from the source file, this one is to also take into account that other file is used for a method"
	| xPathEntity xPathFile |
	xPathEntity := '//class'.
	xPathFile := '//sourcefile'.
	
	entity := self document xpath: xPathEntity.
	file := self document xpath: xPathFile.
	self coveredClasses.
]

{ #category : #accessing }
XMLReport >> methodAt: aIndex [
	^ (self entity at: aIndex).
]

{ #category : #accessing }
XMLReport >> name [
	"A simple getter for our name"
	^ name.
]

{ #category : #accessing }
XMLReport >> name: xmlName [
	"A simple setter for our name"
	name := xmlName.
]

{ #category : #accessing }
XMLReport >> path [
	"A simple getter for our path"
	^ path.
]

{ #category : #accessing }
XMLReport >> path: xmlPath [
	"A simple setter for our path"
	path := xmlPath.
]

{ #category : #accessing }
XMLReport >> report [
	"This method allow to have full name in the purpose to have the xml report"
	"We precise 'asFileReference' so that Pharo understand we wish to work with files
	either way it will still consider it as a string"
	^ (path, name) asFileReference.
]
