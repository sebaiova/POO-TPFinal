Class {
	#name : #SITable,
	#superclass : #SIPane,
	#instVars : [
		'table',
		'model',
		'doubleClickBlock',
		'clickBlock'
	],
	#category : #'TPO-Final-UIComponents'
}

{ #category : #'instance creation' }
SITable class >> model: aModel headers: colHeaders [
	^super new initializeModel: aModel headers: colHeaders.
]

{ #category : #'instance creation' }
SITable class >> new [ 
	self error: 'Usar array:headers: en lugar de new.'
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
			onAnnouncement: FTSelectionChanged do: [ :ann | clickBlock value: self selectedIndex ];
			dataSource: model.

	model addDependent: table.
	doubleClickBlock 	:= [ :element | nil ]. "default no hace nada"
	clickBlock 			:= [ :element | nil ].
	
	^self  addMorph: (SIColumn new addMorph: table; yourself). 

]

{ #category : #menus }
SITable >> model [ 
	^model.
]

{ #category : #accessing }
SITable >> model: aModel [ 
	model := aModel.
	table dataSource: model.
	table refresh.
]

{ #category : #'event handling' }
SITable >> onClick: aBlock [ 
	clickBlock := aBlock.
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
