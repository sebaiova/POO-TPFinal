Class {
	#name : #ModelUsuarios,
	#superclass : #ModelAbstractTable,
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

{ #category : #accessing }
ModelUsuarios >> cellColumn: column row: rowIndex [
	| element text |
	element := self elementAt: rowIndex.
	text := element asString.
	(column id = 'Nombre') 	ifTrue: [ text := element nombre ].
	(column id = 'Apellido')	ifTrue: [ text := element apellido ].
	(column id = 'DNI')		ifTrue: [ text := element dni ].
	^ FTCellMorph new
		  addMorphBack: text asMorph;
		  yourself
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
	array := sistema usuarios.
	self changed: #refresh.
]
