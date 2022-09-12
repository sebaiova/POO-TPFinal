Class {
	#name : #ViewAdminUsers,
	#superclass : #ViewTable,
	#category : #'TPO-Final-Views'
}

{ #category : #'instance creation' }
ViewAdminUsers class >> new: aSeqCol [
	^self new initialize: aSeqCol; yourself.
]

{ #category : #initialization }
ViewAdminUsers >> initialize: aColSeq [
	self initialize.
	^self	addTitle: 'Usuarios'; 
			addColumn: 'DNI'; 
			addColumn: 'Apellido'; 
			addColumn: 'Nombre';
			model: (ModelUsuarios new: aColSeq);
			yourself.
]
