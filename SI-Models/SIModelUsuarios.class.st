Class {
	#name : #SIModelUsuarios,
	#superclass : #SIModelAbstractTable,
	#category : #'SI-Models'
}

{ #category : #defaults }
SIModelUsuarios >> iconFor: anElement at: idColumn [ 
	(idColumn = 'Nombre') ifTrue: [
				 anElement esPlus ifTrue: [ ^ (self iconNamed: #smallNew ) asMorph. ]
										ifFalse: [ ^ (self iconNamed: #user) asMorph.  ]
		 ].
	^nil.
]

{ #category : #accessing }
SIModelUsuarios >> refresh [ 
	elements := iface sys usuarios.
	self changed: #refresh.
]

{ #category : #'as yet unclassified' }
SIModelUsuarios >> stringFor: anElement at: idColumn [
	idColumn = 'Nombre'	ifTrue: [ ^anElement nombre ].
	idColumn = 'Apellido'	ifTrue: [ ^anElement apellido ].
	idColumn = 'DNI'		ifTrue: [ ^anElement dni ].
	^super stringFor: anElement at: idColumn.
]
