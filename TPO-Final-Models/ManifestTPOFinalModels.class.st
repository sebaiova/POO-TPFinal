"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestTPOFinalModels,
	#superclass : #PackageManifest,
	#category : #'TPO-Final-Models-Manifest'
}

{ #category : #'code-critics' }
ManifestTPOFinalModels class >> ruleStringConcatenationRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#ModelLibros #cellColumn:row: #false)) #'2023-01-04T02:18:41.802-03:00') )
]
