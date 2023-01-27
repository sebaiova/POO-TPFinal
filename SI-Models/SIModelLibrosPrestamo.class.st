Class {
	#name : #SIModelLibrosPrestamo,
	#superclass : #SIModelLibrosBiblioteca,
	#category : #'SI-Models'
}

{ #category : #accessing }
SIModelLibrosPrestamo >> refresh [ 
	elements := iface loan libros.
	self changed: #refresh.
]
