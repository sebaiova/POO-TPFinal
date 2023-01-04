Class {
	#name : #ViewEditBiblioteca,
	#superclass : #ViewEdit,
	#instVars : [
		'tfNombre',
		'ftDireccion',
		'ftTelefono',
		'ftRepresentante'
	],
	#category : #'TPO-Final-Views'
}

{ #category : #button }
ViewEditBiblioteca >> confirmar [
	model nombre: tfNombre text.
	model telefono: ftTelefono text.
	model representante: ftRepresentante text.
	model direccion: ftDireccion text.
	super confirmar.
]

{ #category : #initialization }
ViewEditBiblioteca >> initialize: biblioteca [
	super initialize: biblioteca.
	^self	
			addMorph: Spacer new;
			addMorph: (ftRepresentante := (TextField new: 'Representante') text: model representante);
			addMorph: (ftDireccion := (TextField new: 'Dirección') text: model direccion);
			addMorph: (ftTelefono := (TextField new: 'Teléfono') text: model telefono asString);
			addMorph: (tfNombre := (TextField new: 'Nombre:') text: model nombre);
			 
			addMorph: Spacer new;
			yourself.
]
