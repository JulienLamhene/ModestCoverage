# Modest-Coverage

Modest-Coverage is a Pharo project, designed to analyze your XML test coverage reports to help you select the tests that best suit your needs.

## Installation

To install Modest-Coverage in your Pharo image :

```smalltalk
Metacello new
  baseline: 'ModestCoverage';
  repository: 'github.com://JulienLamhene/ModestCoverage/src';
  load.
```

## Principle

We submit to this a project a path towards where are stored XML Report of coverage, after that we submit a file and a method to specifically analyse.
Then with all the possibles tests exists using this method coming from this file, combinations from those tests will be generated.
Finally with these combinations, we could send message which will filter the combinations and keep the most pertinent ones.

## How To Use

To you have i first hand with this project, i recommend to try it with the integrated [GitBridge](https://github.com/jecisc/GitBridge), with this example, before using for yourself.

```smalltalk
| xmlCatalog testCatalog file method comb|

xmlCatalog := XMLCatalog loadAllFromBridge. "Generate a instance of XMLCatalog, which modelize all the data from our reports"
testCatalog := TestCatalog fromXMLCatalog: xmlCatalog.

file := 'Coffee.java'. "The source file studied"
method := method := testCatalog getARandomMethodFrom: file. "The method studied for our analyze"

comb := TestCombinationCatalog createCombiOfMethod: method fromFile: file withTests: testCatalog.
comb smallestBestCombination.
comb evenlySpreadCombination combi.
comb evenlySpreadCombiOptimized.
```

There also the possibility to load a single report and then the test corresponding, if you want to explore more possibilities :

```smalltalk
| xmlReport name test |

name := 'CoffeeTest.testCalcCoffeeIngredient.xml'. "I exemple of file name"
xmlReport := XMLReport loadFile: name. "Load the data of the file of the same name, since no path is referred, the GitBridge is used"
test := Test fromXMLReport: xmlReport.
```

Now that for using it with the integrated ressource provided byt the GitBridge, for using to your own profit, here the small differences :

```smalltalk
path := '<the-path-toward-your-xml-directory>/<directory-of-xml-files>'.
xmlCatalog := XMLCatalog loadAllFrom: path.
... "The rest is unchanged"
```

Same thing if you just you a single report :

```smalltalk
| xmlReport aTest path methods covMeths keys vals|
path := '<the-path-toward-your-xml-directory>/<directory-of-xml-files>'.
xmlReport := XMLReport loadFrom: path on: '<name-of-the-file>.xml'.

aTest := Test fromXMLReport: xmlReport.
```
