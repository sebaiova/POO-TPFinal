Class {
	#name : #ModelPrestamosBiblioteca,
	#superclass : #ModelPrestamos,
	#instVars : [
		'biblioteca'
	],
	#category : #'SI-Models'
}

{ #category : #'instance creation' }
ModelPrestamosBiblioteca class >> biblioteca: unaBiblioteca [
	^super new initializeBiblioteca: unaBiblioteca.
]

{ #category : #'instance creation' }
ModelPrestamosBiblioteca class >> sistema: unSistema usuario: unUsuario [
	^super new initializeSistema: unSistema usuario: unUsuario.
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
	elements := biblioteca prestamosActivos.
	self changed: #refresh.
]
