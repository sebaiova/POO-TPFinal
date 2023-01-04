Class {
	#name : #ViewTable,
	#superclass : #TabPage,
	#instVars : [
		'table'
	],
	#category : #'TPO-Final-Views'
}

{ #category : #'instance creation' }
ViewTable class >> new: aModel [
	^self new initialize: aModel.
]

{ #category : #button }
ViewTable >> agregar [
	^nil.
]

{ #category : #button }
ViewTable >> editar [
	| selected | 
	selected := table selected.
	selected ifNotNil: [
		table addDependency: selected. 
		parent stack: (self editor new: selected).
		 ]
]

{ #category : #accessing }
ViewTable >> editor [
	^self subclassResponsibility.
]

{ #category : #initialization }
ViewTable >> initialize [
	 super initialize.
	 table := Table new.	
	 ^self addMorph: (Row new addMorph: (Button new: 'Agregar' target: self message: #agregar);
									addMorph: (Button new: 'Eliminar' target: table message: #eliminar);
									addMorph: (Button new: 'Editar' target: self message: #editar);
									addMorph: Spacer new;
									yourself);
			addMorph: (Spacer new addMorph: table);
			yourself.
]
