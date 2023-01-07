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
ModelDragAndDrop >> dropCondition: aBlock [
	dropCondition := aBlock.
]

{ #category : #'drag and drop' }
ModelDragAndDrop >> dropElements: aCollection index: rowIndex [
	array := (rowIndex = 0
		ifTrue: [ array, aCollection ]
		ifFalse: [ (self elements first: rowIndex), array, (self elements allButFirst: rowIndex) ]).	
			
	self refresh.
]

{ #category : #initialization }
ModelDragAndDrop >> initializeArray: unArray [
	self initialize.
	array := unArray.
	dropCondition := [ :element | false ].
	^self refresh;
		yourself.
]

{ #category : #accessing }
ModelDragAndDrop >> refresh [ 
	self changed.
]

{ #category : #'drag and drop' }
ModelDragAndDrop >> wantsDropElements: aCollection type: type index: rowIndex [
	^ (aCollection allSatisfy: dropCondition) and: (aCollection allSatisfy: [ :element | (array includes:element) not ]).
]
