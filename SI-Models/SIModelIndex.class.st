Class {
	#name : #SIModelIndex,
	#superclass : #Object,
	#instVars : [
		'model',
		'index',
		'element'
	],
	#category : #'SI-Models'
}

{ #category : #'as yet unclassified' }
SIModelIndex class >> model: aModel index: aIndex [ 
	^super new initializeModel: aModel index: aIndex.
]

{ #category : #'instance creation' }
SIModelIndex class >> new [ 
	self error: 'Usar model:index: en lugar de new'
]

{ #category : #accessing }
SIModelIndex >> element [ 
	^element.
]

{ #category : #accessing }
SIModelIndex >> elementChanged [ 
	model changed: #refresh.
]

{ #category : #accessing }
SIModelIndex >> index [ 
	^index.
]

{ #category : #initialization }
SIModelIndex >> initializeModel: aModel index: aIndex [
	self initialize.
	model := aModel.
	index := aIndex.
	element := model elementAt: index.
	^self .
]

{ #category : #accessing }
SIModelIndex >> model [
 ^model
]
