Class {
	#name : #ModelUsuarios,
	#superclass : #SIModelAbstractTable,
	#instVars : [
		'sistema'
	],
	#category : #'TPO-Final-Models'
}

{ #category : #'instance creation' }
ModelUsuarios class >> new [
	self error: 'Usar sistema: en lugar de new.'
]

{ #category : #'instance creation' }
ModelUsuarios class >> sistema: unSistema [ 
	^super new initializeSistema: unSistema.
]

{ #category : #initialization }
ModelUsuarios >> initializeSistema: unSistema [
	self initialize.
	sistema := unSistema.
	self refresh.
	^self.
]

{ #category : #accessing }
ModelUsuarios >> refresh [ 
	elements := sistema usuarios.
	self changed: #refresh.
]
