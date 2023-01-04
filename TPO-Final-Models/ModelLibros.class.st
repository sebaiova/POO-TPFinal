Class {
	#name : #ModelLibros,
	#superclass : #ModelAbstractList,
	#category : #'TPO-Final-Models'
}

{ #category : #'instance creation' }
ModelLibros class >> new: aSeqCol [
	^self new elements: aSeqCol; yourself.
]

{ #category : #accessing }
ModelLibros >> cellColumn: column row: rowIndex [
	| element text |
	element := self elementAt: rowIndex.
	text := element asString.
	(column id = 'Nombre') 		ifTrue: [ text := element nombre ].
	(column id = 'Editorial')	ifTrue: [ text := element editorial ].
	(column id = 'Año')			ifTrue: [ text := element año ].
	(column id = 'Estado')		ifTrue: [ text := element prestado ].
	(column id = 'Autores')		ifTrue: [ text := element autores inject: '- ' into: [ :a :each | a, each nombre , ' - ' ]].
	^ FTCellMorph new
		  addMorphBack: text asMorph;
		  yourself
]
