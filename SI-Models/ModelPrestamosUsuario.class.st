Class {
	#name : #ModelPrestamosUsuario,
	#superclass : #ModelPrestamos,
	#instVars : [
		'sistema',
		'usuario'
	],
	#category : #'SI-Models'
}

{ #category : #'instance creation' }
ModelPrestamosUsuario class >> new [
	self error: 'Usar sistema:usuario en lugar de new.'
]

{ #category : #'instance creation' }
ModelPrestamosUsuario class >> sistema: unSistema usuario: unUsuario [
	^super new initializeSistema: unSistema usuario: unUsuario.
]

{ #category : #initialization }
ModelPrestamosUsuario >> initializeSistema: unSistema usuario: unUsuario [
	self initialize.
	sistema := unSistema.
	usuario := unUsuario.
	self refresh.
	^self.
]

{ #category : #accessing }
ModelPrestamosUsuario >> refresh [ 
	elements := sistema prestamosActivosDeUsuario: usuario.
	self changed: #refresh.
]
