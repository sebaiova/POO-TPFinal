Class {
	#name : #ViewEditBiblioteca,
	#superclass : #ViewEdit,
	#instVars : [
		'tfNombre',
		'tagError'
	],
	#category : #'TPO-Final-Views'
}

{ #category : #button }
ViewEditBiblioteca >> confirmar [
	model nombre: tfNombre text.
]

{ #category : #initialization }
ViewEditBiblioteca >> initialize [
	super initialize.
	^self	
			addMorph: Spacer new;
			addMorph: (tfNombre := (TextField new: 'Nombre:'));
			addMorph: (tagError := TagError new);	
			addMorph: Spacer new;
			yourself.
]

{ #category : #initialization }
ViewEditBiblioteca >> initialize: biblioteca [
	super initialize: biblioteca.
	tfNombre text: model nombre.
	^self.
]
