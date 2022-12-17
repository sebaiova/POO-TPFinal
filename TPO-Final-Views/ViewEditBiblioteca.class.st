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
	^nil.
]

{ #category : #initialization }
ViewEditBiblioteca >> initialize [
	super initialize.
	^self	
			addMorph: Spacer new;
			addMorph: (tfNombre := TextField new: (Tag contents: 'Nombre:'));
			addMorph: (tagError := TagError new);	
			addMorph: Spacer new;
			yourself.
]
