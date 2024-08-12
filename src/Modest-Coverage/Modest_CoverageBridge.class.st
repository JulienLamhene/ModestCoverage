"
The bridge toward our xml resources from our github, to put it simply this class is what allow exterior users to uses our xml report for this project.

For more information on GitBridge, users are invited to inquire information on the README of the project, or directly on the github of GitBridge (link in our README).
"
Class {
	#name : #'Modest_CoverageBridge',
	#superclass : #GitBridge,
	#category : #'Modest-Coverage-Base'
}

{ #category : #'class initialization' }
Modest_CoverageBridge class >> initialize [
	"The initialization of our class"
	SessionManager default registerSystemClassNamed: self name
]

{ #category : #'class initialization' }
Modest_CoverageBridge class >> xmlDirectory [
	"Access the directory of the XLM reports"
	^ self root / 'xmlReport2'.
]

{ #category : #'class initialization' }
Modest_CoverageBridge class >> xmlDirectoryChildren [
	"Allow to directly access the content of our xml directory, which result in a array of File"
	^ self xmlDirectory children sort.
]
