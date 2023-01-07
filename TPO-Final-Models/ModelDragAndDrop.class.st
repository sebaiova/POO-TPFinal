Class {
	#name : #ModelDragAndDrop,
	#superclass : #SIModelAbstractTable,
	#instVars : [
		'tmp',
		'dropCondition'
	],
	#category : #'TPO-Final-Models'
}

{ #category : #'instance creation' }
ModelDragAndDrop class >> array: unArrayBibliotecas [ 
	^super new initializeArray: unArrayBibliotecas.
]

{ #category : #'instance creation' }
ModelDragAndDrop class >> new [ 
	self error: 'Usar array: en lugar de new'
]

{ #category : #'drag and drop' }
ModelDragAndDrop >> dropElements: aCollection index: rowIndex [
	elements addAll: (aCollection collect: [ :modelIndex | modelIndex element ]).
	aCollection do: [ :modelIndex | modelIndex model removeAt: modelIndex index  ].
	self refresh.
]

{ #category : #initialization }
ModelDragAndDrop >> initializeArray: unArray [
	self initialize.
	elements := OrderedCollection newFrom: unArray.
	dropCondition := [ :element | false ].
	^self refresh;
		yourself.
]

{ #category : #accessing }
ModelDragAndDrop >> passengerAt: rowIndex [
	^ SIModelIndex model: self index: rowIndex.
]

{ #category : #accessing }
ModelDragAndDrop >> refresh [ 
	self changed: #refresh.
]

{ #category : #accessing }
ModelDragAndDrop >> removeAt: index [ 
	elements removeAt: index.
	self refresh.
]

{ #category : #'drag and drop' }
ModelDragAndDrop >> wantsDropElements: aCollection type: type index: rowIndex [
	^ (aCollection allSatisfy: [ :element | element isMemberOf: SIModelIndex ]) 
			ifTrue: [(aCollection allSatisfy: [ :modelIndex | (elements includes: modelIndex element) not ])]
			ifFalse: [ false ].
]
