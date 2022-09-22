Class {
	#name : #ModelUsuarios,
	#superclass : #ModelAbstract,
	#category : #'TPO-Final-Models'
}

{ #category : #'instance creation' }
ModelUsuarios class >> new: aSeqCol [
	^self new elements: aSeqCol; yourself.
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
