Class {
	#name : #ViewAdminTable,
	#superclass : #View,
	#instVars : [
		'table',
		'parent'
	],
	#category : #'TPO-Final-Views'
}

{ #category : #'instance creation' }
ViewAdminTable class >> new: aModel [
	^self new initialize: aModel.
]

{ #category : #button }
ViewAdminTable >> agregar [
	^nil.
]

{ #category : #'initialize-release' }
ViewAdminTable >> close [ 
	parent delete.
]

{ #category : #button }
ViewAdminTable >> editar [
	^nil.
]

{ #category : #initialization }
ViewAdminTable >> initialize [
	 super initialize.
	 table := Table new.	
	 ^self addMorph: (Row new addMorph: (Button new: 'Agregar' target: self message: #agregar);
									addMorph: (Button new: 'Eliminar' target: table message: #eliminar);
									addMorph: (Button new: 'Editar' target: self message: #editar);
									addMorph: Spacer new;
									addMorph: (Button new: 'Atras' target: self message: #close);
									yourself);
			addMorph: (Spacer new addMorph: table);
			yourself.
]

{ #category : #accessing }
ViewAdminTable >> parent: aParent [
	parent := aParent.
]
