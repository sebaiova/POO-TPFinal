Class {
	#name : #SIModelPrestamosUsuario,
	#superclass : #SIModelPrestamos,
	#category : #'SI-Models'
}

{ #category : #accessing }
SIModelPrestamosUsuario >> refresh [ 
	elements := iface sys prestamosActivosDeUsuario: iface user.
	self changed: #refresh.
]
