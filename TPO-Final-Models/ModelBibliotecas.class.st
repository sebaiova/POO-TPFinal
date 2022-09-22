Class {
	#name : #ModelBibliotecas,
	#superclass : #ModelAbstract,
	#category : #'TPO-Final-Models'
}

{ #category : #'instance creation' }
ModelBibliotecas class >> new: aSeqCol [
	^self new elements: aSeqCol; yourself.
]

{ #category : #accessing }
ModelBibliotecas >> cellColumn: column row: rowIndex [
	| element text |
	element := self elementAt: rowIndex.
	text := element asString.
	(column id = 'Nombre') 			ifTrue: [ text := element nombre ].
	(column id = 'Representante')	ifTrue: [ text := element representante ].
	(column id = 'Teléfono')			ifTrue: [ text := element telefono ].
	(column id = 'Dirección')		ifTrue: [ text := element direccion ].
	^ FTCellMorph new
		  addMorphBack: text asMorph;
		  yourself
]
