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

{ #category : #defaults }
ModelUsuarios >> iconFor: anElement at: idColumn [ 
	(idColumn = 'Nombre') ifTrue: [
				 anElement esPlus ifTrue: [ ^ (self iconNamed: #smallNew ) asMorph. ]
										ifFalse: [ ^ (self iconNamed: #user) asMorph.  ]
		 ].
	^nil.
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

{ #category : #'as yet unclassified' }
ModelUsuarios >> stringFor: anElement at: idColumn [
	idColumn = 'Nombre'	ifTrue: [ ^anElement nombre ].
	idColumn = 'Apellido'	ifTrue: [ ^anElement apellido ].
	idColumn = 'DNI'		ifTrue: [ ^anElement dni ].
	^super stringFor: anElement at: idColumn.
]
