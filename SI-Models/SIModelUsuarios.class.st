Class {
	#name : #SIModelUsuarios,
	#superclass : #SIModelAbstractTable,
	#instVars : [
		'sistema'
	],
	#category : #'SI-Models'
}

{ #category : #'instance creation' }
SIModelUsuarios class >> new [
	self error: 'Usar sistema: en lugar de new.'
]

{ #category : #'instance creation' }
SIModelUsuarios class >> sistema: unSistema [ 
	^super new initializeSistema: unSistema.
]

{ #category : #defaults }
SIModelUsuarios >> iconFor: anElement at: idColumn [ 
	(idColumn = 'Nombre') ifTrue: [
				 anElement esPlus ifTrue: [ ^ (self iconNamed: #smallNew ) asMorph. ]
										ifFalse: [ ^ (self iconNamed: #user) asMorph.  ]
		 ].
	^nil.
]

{ #category : #initialization }
SIModelUsuarios >> initializeSistema: unSistema [
	self initialize.
	sistema := unSistema.
	self refresh.
	^self.
]

{ #category : #accessing }
SIModelUsuarios >> refresh [ 
	elements := sistema usuarios.
	self changed: #refresh.
]

{ #category : #'as yet unclassified' }
SIModelUsuarios >> stringFor: anElement at: idColumn [
	idColumn = 'Nombre'	ifTrue: [ ^anElement nombre ].
	idColumn = 'Apellido'	ifTrue: [ ^anElement apellido ].
	idColumn = 'DNI'		ifTrue: [ ^anElement dni ].
	^super stringFor: anElement at: idColumn.
]
