Class {
	#name : #ViewUsers,
	#superclass : #ViewTable,
	#category : #'TPO-Final-Views'
}

{ #category : #initialization }
ViewUsers >> initialize [ 
	super initialize.
	^self addColumn: 'DNI'; 
			addColumn: 'Apellido'; 
			addColumn: 'Nombre';
			model: 4;
			yourself.
]
