sorting
class: aClass testMethods: aMethod
	| testDictionnary |
	testDictionnary := Dictionary new.
	((testDictionnary at: aClass) collect: [ :t | 
		(t coveredMethods collect: [ :meths | 
			meths select: [ :m | m name = aMethod ] ]) 
		reject: [ :test | test isEmpty ]
	]) reject: [ :x | x isEmpty]. 
