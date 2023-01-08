Class {
	#name : #SIModelPrestamosBiblioteca,
	#superclass : #SIModelPrestamos,
	#instVars : [
		'biblioteca'
	],
	#category : #'SI-Models'
}

{ #category : #'instance creation' }
SIModelPrestamosBiblioteca class >> biblioteca: unaBiblioteca [
	^super new initializeBiblioteca: unaBiblioteca.
]

{ #category : #'instance creation' }
SIModelPrestamosBiblioteca class >> sistema: unSistema usuario: unUsuario [
	^super new initializeSistema: unSistema usuario: unUsuario.
]

{ #category : #initialization }
SIModelPrestamosBiblioteca >> initializeBiblioteca: unaBiblioteca [
	self initialize.
	biblioteca := unaBiblioteca.
	self refresh.
	^self.
]

{ #category : #accessing }
SIModelPrestamosBiblioteca >> refresh [ 
	elements := biblioteca prestamosActivos.
	self changed: #refresh.
]
