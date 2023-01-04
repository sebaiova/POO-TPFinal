Class {
	#name : #ViewAdminLibros,
	#superclass : #ViewTable,
	#category : #'TPO-Final-Views'
}

{ #category : #'instance creation' }
ViewAdminLibros class >> new: aSeqCol [
	^self new initialize: aSeqCol; yourself.
]

{ #category : #accessing }
ViewAdminLibros >> editor [ 
	^ViewBiblioteca .
]

{ #category : #initialization }
ViewAdminLibros >> initialize: aModel [
	self initialize.
	table addColumn: 'Nombre'.
	table	addColumn: 'Estado' width: 100.
	table addColumn: 'Año' width: 100.
	table addColumn: 'Editorial'.
	table addColumn: 'Autores'.
	table model: aModel.
	^self.
]
