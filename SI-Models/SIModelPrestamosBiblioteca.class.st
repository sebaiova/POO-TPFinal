Class {
	#name : #SIModelPrestamosBiblioteca,
	#superclass : #SIModelPrestamos,
	#category : #'SI-Models'
}

{ #category : #accessing }
SIModelPrestamosBiblioteca >> refresh [ 
	elements := iface lib prestamosActivos.
	self changed: #refresh.
]
