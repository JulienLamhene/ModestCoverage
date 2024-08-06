"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them.

Public API and Key Messages

- message one
- message two
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.

Internal Representation and Key Implementation Points.

    Instance Variables
	coveredLines:		Dictionnary
	coveredMethods:		Dictionnary
	name:		<ByteString>

"
Class {
	#name : #'Modest_CoverageBridge',
	#superclass : #GitBridge,
	#instVars : [
		'name',
		'coveredLines',
		'coveredMethods'
	],
	#category : #'Modest-Coverage-Base'
}

{ #category : #'class initialization' }
Modest_CoverageBridge class >> initialize [
	SessionManager default registerSystemClassNamed: self name
]

{ #category : #'class initialization' }
Modest_CoverageBridge class >> xmlDirectory [
	^ self root / 'xmlReport2'.
]

{ #category : #'class initialization' }
Modest_CoverageBridge class >> xmlDirectoryChildren [
	^ self xmlDirectory children sort.
]
