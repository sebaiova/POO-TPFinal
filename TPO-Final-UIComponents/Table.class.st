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

{ #category : #adding }
Table >> addColumn: headerName width: aWidth [
	^table addColumn: ((FTColumn id: headerName) width: aWidth; yourself).
	
]

{ #category : #adding }
Table >> addDependency: element [
	element addDependent: table.
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
	table := FTTableMorph new 
		intercellSpacing: 1;
		beResizable;
		vResizing: #spaceFill; hResizing: #spaceFill.
		
	^self vResizing: #spaceFill; hResizing: #spaceFill; addMorph: table. 

]

{ #category : #initialization }
Table >> model: aModel [
	model := aModel.
	table dataSource: model.
	model addDependent: table.
]

{ #category : #accessing }
Table >> selected [ 
	table hasSelection ifFalse: [ ^ nil ].
	^model at: (table selectedIndex).
]
