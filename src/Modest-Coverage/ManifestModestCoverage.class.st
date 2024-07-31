"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestModestCoverage,
	#superclass : #PackageManifest,
	#category : #'Modest-Coverage-Manifest'
}

{ #category : #'code-critics' }
ManifestModestCoverage class >> ruleCollectionMessagesToExternalObjectRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#Test #loadLinesOf:for: #false)) #'2024-06-27T12:04:40.770453+02:00') )
]

{ #category : #'code-critics' }
ManifestModestCoverage class >> ruleCollectionProtocolRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#'XMLReport class' #loadAllFrom: #true)) #'2024-06-25T15:07:42.22704+02:00') #(#(#RGMethodDefinition #(#'TestCatalog class' #removeDuplicates: #true)) #'2024-07-16T16:36:47.369125+02:00') #(#(#RGMethodDefinition #(#TestCombinationCatalog #combinationsWellReparted #false)) #'2024-07-24T16:31:55.341688+02:00') #(#(#RGMethodDefinition #(#'TestCatalog class' #fromXMLCatalog: #true)) #'2024-07-26T11:14:57.343368+02:00') #(#(#RGMethodDefinition #(#'XMLCatalog class' #loadAllFrom: #true)) #'2024-07-26T11:15:49.585754+02:00') )
]

{ #category : #'code-critics' }
ManifestModestCoverage class >> ruleReNoPrintStringInPrintOnRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#Test #printOn: #false)) #'2024-06-25T10:37:00.504745+02:00') )
]

{ #category : #'code-critics' }
ManifestModestCoverage class >> ruleStringConcatenationRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#'XMLReport class' #loadAllFrom: #true)) #'2024-06-25T15:07:20.385293+02:00') )
]

{ #category : #'code-critics' }
ManifestModestCoverage class >> ruleTempsReadBeforeWrittenRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#Test #mostTestedFile #false)) #'2024-07-25T15:20:35.204616+02:00') )
]

{ #category : #'code-critics' }
ManifestModestCoverage class >> ruleToDoCollectRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#Test #allMethods: #false)) #'2024-06-19T16:04:49.700687+02:00') )
]

{ #category : #'code-critics' }
ManifestModestCoverage class >> ruleUnclassifiedMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#TestCombinationCatalog #combinationsWellReparted #false)) #'2024-07-24T16:31:58.535998+02:00') )
]
