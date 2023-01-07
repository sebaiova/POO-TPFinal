Class {
	#name : #ModelBibliotecas,
	#superclass : #SIModelAbstractTable,
	#instVars : [
		'sistema'
	],
	#category : #'TPO-Final-Models'
}

{ #category : #'instance creation' }
ModelBibliotecas class >> sistema: unSistema [ 
	^super new initializeSistema: unSistema.
]

{ #category : #adding }
ModelBibliotecas >> agregar: unaBiblioteca [
	| a |
	a := sistema agregarBiblioteca: unaBiblioteca.
	self refresh.
	^a.
]

{ #category : #accessing }
ModelBibliotecas >> getModelLibros: ofIndex [ 
	^ModelLibros biblioteca: (self elementAt: ofIndex) sistema: sistema.
	
]

{ #category : #initialization }
ModelBibliotecas >> initializeSistema: unSistema [
	self initialize.
	sistema := unSistema.
	self refresh.
	^self.
]

{ #category : #refresh }
ModelBibliotecas >> refresh [ 
	array := sistema bibliotecas.
	self changed: #refresh.
]
