Class {
	#name : #SIModelPrestamosUsuario,
	#superclass : #SIModelPrestamos,
	#instVars : [
		'sistema',
		'usuario'
	],
	#category : #'SI-Models'
}

{ #category : #'instance creation' }
SIModelPrestamosUsuario class >> new [
	self error: 'Usar sistema:usuario en lugar de new.'
]

{ #category : #'instance creation' }
SIModelPrestamosUsuario class >> sistema: unSistema usuario: unUsuario [
	^super new initializeSistema: unSistema usuario: unUsuario.
]

{ #category : #initialization }
SIModelPrestamosUsuario >> initializeSistema: unSistema usuario: unUsuario [
	self initialize.
	sistema := unSistema.
	usuario := unUsuario.
	self refresh.
	^self.
]

{ #category : #accessing }
SIModelPrestamosUsuario >> refresh [ 
	elements := sistema prestamosActivosDeUsuario: usuario.
	self changed: #refresh.
]
