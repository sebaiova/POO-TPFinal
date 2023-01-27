Class {
	#name : #SIModelDragAndDrop,
	#superclass : #SIModelLibrosBiblioteca,
	#category : #'SI-Models'
}

{ #category : #'instance creation' }
SIModelDragAndDrop class >> array: unArrayBibliotecas [ 
	^super new initializeArray: unArrayBibliotecas.
]

{ #category : #'instance creation' }
SIModelDragAndDrop class >> new [ 
	self error: 'Usar array: en lugar de new'
]

{ #category : #adding }
SIModelDragAndDrop >> addAll: anArray [
	elements addAll: anArray.
	self refresh.
]

{ #category : #'instance creation' }
SIModelDragAndDrop >> array: anArray [
	elements := OrderedCollection newFrom: anArray.
	self refresh.
]

{ #category : #'drag and drop' }
SIModelDragAndDrop >> dropElements: aCollection index: rowIndex [
	elements addAll: (aCollection collect: [ :modelIndex | modelIndex element ]).
	aCollection do: [ :modelIndex | modelIndex model removeAt: modelIndex index  ].
	self refresh.
]

{ #category : #initialization }
SIModelDragAndDrop >> initializeArray: unArray [
	self initialize.
	elements := OrderedCollection newFrom: unArray.
	^self refresh;
		yourself.
]

{ #category : #accessing }
SIModelDragAndDrop >> passengerAt: rowIndex [
	^ SIModelIndex model: self index: rowIndex.
]

{ #category : #accessing }
SIModelDragAndDrop >> refresh [ 
	self changed: #refresh.
]

{ #category : #accessing }
SIModelDragAndDrop >> removeAt: index [ 
	elements removeAt: index.
	self refresh.
]

{ #category : #'drag and drop' }
SIModelDragAndDrop >> wantsDropElements: aCollection type: type index: rowIndex [
	^ (aCollection allSatisfy: [ :element | element isMemberOf: SIModelIndex ]) 
			ifTrue: [(aCollection allSatisfy: [ :modelIndex | (elements includes: modelIndex element) not ])]
			ifFalse: [ false ].
]
