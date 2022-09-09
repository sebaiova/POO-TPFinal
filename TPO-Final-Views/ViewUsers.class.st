Class {
	#name : #ViewUsers,
	#superclass : #ViewTable,
	#category : #'TPO-Final-Views'
}

{ #category : #'instance creation' }
ViewUsers class >> new: aSeqCol [
	^self new initialize: aSeqCol; yourself.
]

{ #category : #initialization }
ViewUsers >> initialize: aColSeq [
	self initialize.
	^self addColumn: 'DNI'; 
			addColumn: 'Apellido'; 
			addColumn: 'Nombre';
			model: (ModelUsuarios new: aColSeq);
			yourself.
]
