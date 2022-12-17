Class {
	#name : #Table,
	#superclass : #Pane,
	#instVars : [
		'table',
		'model'
	],
	#category : #'TPO-Final-UIComponents'
}

{ #category : #'instance creation' }
Table class >> new: aModel [
	^self new initialize: aModel.
]

{ #category : #adding }
Table >> addColumn: headerName [
	^table addColumn: (FTColumn id: headerName).
]

{ #category : #removing }
Table >> eliminar [
	table hasSelection ifFalse: [ ^ self ].
	model removeAt: table selectedIndex.
	table deselectAll
]

{ #category : #initialization }
Table >> initialize [
	super initialize.
	table := FTTableMorph new vResizing: #spaceFill; hResizing: #spaceFill.
	^self vResizing: #spaceFill; hResizing: #spaceFill; addMorph: table. 

]

{ #category : #initialization }
Table >> model: aModel [
	model := aModel.
	table dataSource: model.
	model addDependent: table.
]
