Class {
	#name : #ViewAdminUsers,
	#superclass : #ViewAdminTable,
	#category : #'TPO-Final-Views'
}

{ #category : #'instance creation' }
ViewAdminUsers class >> new: aSeqCol [
	^self new initialize: aSeqCol; yourself.
]

{ #category : #initialization }
ViewAdminUsers >> initialize: aColSeq [
	self initialize.
	^self	addColumn: 'DNI'; 
			addColumn: 'Apellido'; 
			addColumn: 'Nombre';
			model: (ModelUsuarios new: aColSeq);
			yourself.
]
