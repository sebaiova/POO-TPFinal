Class {
	#name : #ViewAdminBibliotecas,
	#superclass : #ViewAdminTable,
	#category : #'TPO-Final-Views'
}

{ #category : #'instance creation' }
ViewAdminBibliotecas class >> new: aSeqCol [
	^self new initialize: aSeqCol; yourself.
]

{ #category : #initialization }
ViewAdminBibliotecas >> initialize: aModel [
	self initialize.
	^self	addColumn: 'Nombre'; 
			addColumn: 'Dirección'; 
			addColumn: 'Teléfono';
			addColumn: 'Representante';
			model: aModel;
			yourself.
]
