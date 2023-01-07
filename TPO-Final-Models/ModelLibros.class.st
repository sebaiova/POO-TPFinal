Class {
	#name : #ModelLibros,
	#superclass : #SIModelAbstractTable,
	#instVars : [
		'biblioteca',
		'sistema'
	],
	#category : #'TPO-Final-Models'
}

{ #category : #'instance creation' }
ModelLibros class >> biblioteca: unaBiblioteca [
	^super new initializeBiblioteca: unaBiblioteca sistema: nil.
]

{ #category : #'instance creation' }
ModelLibros class >> biblioteca: unaBiblioteca sistema: elSistema [
	^super new initializeBiblioteca: unaBiblioteca sistema: elSistema.
]

{ #category : #'instance creation' }
ModelLibros class >> new [ 
	self error: 'Usar biblioteca:sistema: en lugar de new'
]

{ #category : #accessing }
ModelLibros class >> prestamo: unPrestamo [ 
	^ self biblioteca: unPrestamo.
]

{ #category : #adding }
ModelLibros >> add: unLibro [
	sistema agregarLibro: unLibro enLaBiblioteca:  biblioteca.
	self refresh.
]

{ #category : #initialization }
ModelLibros >> initializeBiblioteca: unaBiblioteca sistema: elSistema [
	self initialize.
	biblioteca := unaBiblioteca.
	sistema := elSistema.
	self refresh.
	^self.
]

{ #category : #accessing }
ModelLibros >> refresh [ 
	elements := biblioteca libros.
	self changed: #refresh.
]

{ #category : #removing }
ModelLibros >> remove: unLibro [ 
	biblioteca removerLibro: unLibro.
	self refresh.
]
