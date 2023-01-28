Class {
	#name : #SIModelAbstractTable,
	#superclass : #FTSimpleDataSource,
	#instVars : [
		'iface'
	],
	#category : #'SI-Models'
}

{ #category : #'instance creation' }
SIModelAbstractTable class >> interface: anSIInterface [ 
	^self new initializeInterface: anSIInterface .
]

{ #category : #accessing }
SIModelAbstractTable >> cellColumn: column row: rowIndex [
	| element icon string cell |
	element := self elementAt: rowIndex.

"	(column id = 'Nombre') 			ifTrue: [ text := element nombre ].
	(column id = 'Representante')	ifTrue: [ text := element representante ].
	(column id = 'Teléfono')			ifTrue: [ text := element telefono ].
	(column id = 'Dirección')		ifTrue: [ text := element direccion ].
	(column id = 'ID')					ifTrue: [ text := element id ].
	(column id = 'Editorial')		ifTrue: [ text := element editorial ].
	(column id = 'Año')				ifTrue: [ text := element año ].
	(column id = 'Estado')			ifTrue: [ text := element prestado ].
	(column id = 'Autores')			ifTrue: [ text := element autores inject: '- ' into: [ :a :each | a, each nombre , ' - ' ]].
	(column id = 'Apellido')			ifTrue: [ text := element apellido ].
	(column id = 'DNI')				ifTrue: [ text := element dni ].
			"
	icon   := self iconFor: element at: column id.
	string := self stringFor: element at: column id.
	
	cell := FTCellMorph new addMorph: string asMorph; yourself.
	icon ifNotNil: [ cell addMorph: icon asMorph ].
	^cell.
]

{ #category : #accessing }
SIModelAbstractTable >> elementAt: anIndex [
	^elements at: anIndex.
]

{ #category : #accessing }
SIModelAbstractTable >> iconFor: anElement at: idColumn [
	^nil.
]

{ #category : #initialization }
SIModelAbstractTable >> initializeInterface: anSIInterface [
	self initialize.
	iface := anSIInterface.
	self refresh.
	^self.
]

{ #category : #accessing }
SIModelAbstractTable >> numberOfRows [ 
	^elements size.
]

{ #category : #refresh }
SIModelAbstractTable >> refresh [ 
	self subclassResponsibility .
]

{ #category : #accessing }
SIModelAbstractTable >> stringFor: anElement at: idColumn [ 
	^anElement asString.
]
