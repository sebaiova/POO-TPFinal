Class {
	#name : #SIListInput,
	#superclass : #SIPane,
	#instVars : [
		'list',
		'model',
		'textField'
	],
	#category : #'TPO-Final-UIComponents'
}

{ #category : #button }
SIListInput >> agregar [
	textField text ifEmpty: [ ^nil ].
	model add: textField text.
	textField text: ''.
	model changed: #refresh.
]

{ #category : #accessing }
SIListInput >> elements [ 
	^model.
]

{ #category : #accessing }
SIListInput >> elements: aCollection [
	model := aCollection.
	list elements: model.
	model addDependent: list.
]

{ #category : #removing }
SIListInput >> eliminar [
	list hasSelection ifFalse: [ ^ self ].
	model removeAt: list selectedIndex.
	list deselectAll
]

{ #category : #initialization }
SIListInput >> initialize [
	super initialize.
	list := FTEasyListMorph new 
		vResizing: #spaceFill; hResizing: #spaceFill.
		
	^self 
	elements: (OrderedCollection new);
	vResizing: #spaceFill; hResizing: #spaceFill; 
	addMorph: (SIRow new 
		addMorph: (textField := SITextField new);
		addMorph: (SIButton label: 'Agregar' target: self message: #agregar);
		addMorph: (SIButton label: 'Remover' target: self message: #eliminar);
		yourself);
		
	addMorph: list.

]
