Class {
	#name : #ViewAdminBibliotecas,
	#superclass : #ViewAdminTable,
	#category : #'TPO-Final-Views'
}

{ #category : #'instance creation' }
ViewAdminBibliotecas class >> new: aSeqCol [
	^self new initialize: aSeqCol; yourself.
]

{ #category : #accessing }
ViewAdminBibliotecas >> editor [ 
	^ViewEditBiblioteca .
]

{ #category : #initialization }
ViewAdminBibliotecas >> initialize: aModel [
	self initialize.
	table addColumn: 'Nombre'.
	table addColumn: 'Dirección'.
	table	addColumn: 'Teléfono'.
	table	addColumn: 'Representante'.
	table model: aModel.
	^self.
]
