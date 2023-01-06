Class {
	#name : #ModelPrestamosBiblioteca,
	#superclass : #ModelAbstractTable,
	#instVars : [
		'biblioteca'
	],
	#category : #'TPO-Final-Models'
}

{ #category : #'instance creation' }
ModelPrestamosBiblioteca class >> biblioteca: unaBiblioteca [
	^super new initializeBiblioteca: unaBiblioteca.
]

{ #category : #'instance creation' }
ModelPrestamosBiblioteca class >> sistema: unSistema usuario: unUsuario [
	^super new initializeSistema: unSistema usuario: unUsuario.
]

{ #category : #accessing }
ModelPrestamosBiblioteca >> cellColumn: column row: rowIndex [
	| element text |
	element := self elementAt: rowIndex.
	text := element asString.
	(column id = 'Fecha') 	ifTrue: [ text := element fecha ].
	(column id = 'Usuario')		ifTrue: [ text := element usuario dni].
	(column id = 'Dias Prestado')	ifTrue: [ text := element plazoDias ].
	(column id = 'Cantidad de Libros')		ifTrue: [ text := element cantidadLibros ].
	^ FTCellMorph new
		  addMorphBack: text asMorph;
		  yourself
]

{ #category : #initialization }
ModelPrestamosBiblioteca >> initializeBiblioteca: unaBiblioteca [
	self initialize.
	biblioteca := unaBiblioteca.
	self refresh.
	^self.
]

{ #category : #accessing }
ModelPrestamosBiblioteca >> refresh [ 
	array := biblioteca prestamos.
	self changed: #refresh.
]
