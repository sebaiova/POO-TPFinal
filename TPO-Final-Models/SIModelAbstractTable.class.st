Class {
	#name : #SIModelAbstractTable,
	#superclass : #FTSimpleDataSource,
	#category : #'TPO-Final-Models'
}

{ #category : #accessing }
SIModelAbstractTable >> cellColumn: column row: rowIndex [
	| element text |
	element := self elementAt: rowIndex.
	text := element asString.
	
	(column id = 'Nombre') 			ifTrue: [ text := element nombre ].
	(column id = 'Representante')	ifTrue: [ text := element representante ].
	(column id = 'Teléfono')			ifTrue: [ text := element telefono ].
	(column id = 'Dirección')		ifTrue: [ text := element direccion ].
	(column id = 'ID')					ifTrue: [ text := element id ].
	(column id = 'Editorial')		ifTrue: [ text := element editorial ].
	(column id = 'Año')				ifTrue: [ text := element año ].
	(column id = 'Estado')			ifTrue: [ text := element prestado ].
	(column id = 'Autores')			ifTrue: [ text := element autores inject: '- ' into: [ :a :each | a, each nombre , ' - ' ]].
	(column id = 'Fecha') 			ifTrue: [ text := element fecha ].
	(column id = 'Usuario')			ifTrue: [ text := element usuario dni].
	(column id = 'Dias Prestado')	ifTrue: [ text := element plazoDias ].
	(column id = 'Cantidad de Libros')		ifTrue: [ text := element cantidadLibros ].
	(column id = 'Apellido')			ifTrue: [ text := element apellido ].
	(column id = 'DNI')				ifTrue: [ text := element dni ].
			
	^ FTCellMorph new
		  addMorphBack: text asMorph;
		  yourself
]

{ #category : #accessing }
SIModelAbstractTable >> elementAt: anIndex [
	^elements at: anIndex.
]

{ #category : #accessing }
SIModelAbstractTable >> numberOfRows [ 
	^elements size.
]

{ #category : #accessing }
SIModelAbstractTable >> refresh [ 
	self subclassResponsibility .
]
