Class {
	#name : #ModelPrestamosUsuario,
	#superclass : #ModelPrestamosBiblioteca,
	#instVars : [
		'sistema',
		'usuario'
	],
	#category : #'TPO-Final-Models'
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
	array := sistema prestamosDeUsuario: usuario.
	self changed: #refresh.
]