Class {
	#name : #SISelectionTable,
	#superclass : #SIPane,
	#instVars : [
		'inTable',
		'outTable',
		'inModel',
		'outModel'
	],
	#category : #'TPO-Final-UIComponents'
}

{ #category : #'instance creation' }
SISelectionTable class >> array: anArray headers: colHeaders [
	^super new initializeArray: anArray headers: colHeaders.
]

{ #category : #'instance creation' }
SISelectionTable class >> new [ 
	self error: 'Usar array:headers: en lugar de new.'
]

{ #category : #initialization }
SISelectionTable >> initializeArray: aModelDragAndDrop headers: colHeaders [
	self initialize.
	
	inTable := FTTableMorph new.
	outTable := FTTableMorph new.
	inModel := aModelDragAndDrop.
						
	outModel := ModelDragAndDrop array: #().
	
	colHeaders do: [ :header | inTable addColumn: (FTColumn id: header). outTable addColumn: (FTColumn id: header) ].

	inTable intercellSpacing: 1;
			beResizable;
			vResizing: #spaceFill; hResizing: #spaceFill;
			dataSource: inModel;
			dragEnabled: true;
			dropEnabled: true.

	outTable intercellSpacing: 1;
			beResizable;
			vResizing: #spaceFill; hResizing: #spaceFill;
			dataSource: outModel;
			dragEnabled: true;
			dropEnabled: true.
			
	inModel addDependent: inTable.
	outModel addDependent: outTable.
	
	^self  addMorph: (SIColumn new 
					addMorph: inTable; 
					addMorph: outTable). 

]
