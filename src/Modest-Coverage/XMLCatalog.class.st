"
We do not wish to only working with just one XMLReport, but several of them, so the creation of this class who loading by looking into a path, all the XMLReports we need

Public API and Key Messages

- message one
- message two
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.

Internal Representation and Key Implementation Points.

    Instance Variables
	xmlReports:		<OrderedCollection> -> The instance who store all of our XMLReport
"
Class {
	#name : #XMLCatalog,
	#superclass : #Object,
	#instVars : [
		'xmlReports'
	],
	#category : #'Modest-Coverage-Base'
}

{ #category : #initialization }
XMLCatalog class >> loadAllFrom: aPath [
	"Is what create our instance of XMLCatalog, based on a path given by the user"
	| home aXMLCollection path|	
	home := ((FileLocator root) / (aPath withoutPrefix: '/')).
	path := home pathString , '/'.
	(home pathString endsWith: '/') ifFalse: [ 
		path := path , '/'.
	].

	home := (home allChildren reject: [ :child | 
		child extension ~= 'xml' 
	]) sort.
	
	aXMLCollection := OrderedCollection new.
	home do: [ :file |
		aXMLCollection add:
			(XMLReport loadFrom: path on: file basename) ].
	^ self new xmlReports: aXMLCollection.
]

{ #category : #initialization }
XMLCatalog class >> loadAllFromBridge [
	"Create our instance of XMLCatalog, based our GitBridge, if user have no XML reports on its own, or just want to uses simple example"
	| bridge aXMLCollection |	
	bridge := Modest_CoverageBridge xmlDirectory.

	bridge := (bridge allChildren reject: [ :child | 
		child extension ~= 'xml' 
	]) sort.
	
	aXMLCollection := OrderedCollection new.
	bridge do: [ :file |
		aXMLCollection add:
			(XMLReport loadFile: file basename) ].
	^ self new xmlReports: aXMLCollection.
]

{ #category : #initialization }
XMLCatalog >> initialize [
	super initialize.
	xmlReports := Dictionary new.
]

{ #category : #accessing }
XMLCatalog >> xmlReports [
	^ xmlReports.
]

{ #category : #accessing }
XMLCatalog >> xmlReports: reports [
	xmlReports := reports.
]
