Class {
	#name : #SITable,
	#superclass : #SIPane,
	#instVars : [
		'table',
		'model',
		'doubleClickBlock'
	],
	#category : #'TPO-Final-UIComponents'
}

{ #category : #'instance creation' }
SITable class >> model: aModel headers: colHeaders [
	^super new initializeModel: aModel headers: colHeaders.
]

{ #category : #'instance creation' }
SITable class >> new [ 
	self error: 'Usar model:headers: en lugar de new.'
]

{ #category : #removing }
SITable >> eliminar [
	table hasSelection ifFalse: [ ^ self ].
	model removeAt: table selectedIndex.
	table deselectAll
]

{ #category : #initialization }
SITable >> initializeModel: aModel headers: colHeaders [
	self initialize.
	table := FTTableMorph new.
	model := aModel.
	colHeaders do: [ :header | table addColumn: (FTColumn id: header) ].

	table intercellSpacing: 1;
			beResizable;
			vResizing: #spaceFill; hResizing: #spaceFill;
			onAnnouncement: FTStrongSelectionChanged do: [ :ann | doubleClickBlock value: self selectedIndex ];
			dataSource: model.

	model addDependent: table.
	doubleClickBlock := [ :element | nil ]. "default no hace nada"
	
	^self  addMorph: (SIColumn new addMorph: table; yourself). 

]

{ #category : #'event handling' }
SITable >> onDoubleClick: block [
	doubleClickBlock := block.
]

{ #category : #accessing }
SITable >> selected [ 
	table hasSelection ifFalse: [ ^ nil ].
	^model elementAt: (table selectedIndex).
]

{ #category : #accessing }
SITable >> selectedIndex [
	table hasSelection ifFalse: [ ^ nil ].
	^SIModelIndex model: model index: (table selectedIndex).
]
