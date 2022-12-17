Class {
	#name : #Biblioteca,
	#superclass : #Object,
	#instVars : [
		'identificador',
		'direccion',
		'nombre',
		'telefono',
		'representante',
		'colLibros',
		'colPrestamos'
	],
	#category : #'TPO-Final-Domain'
}

{ #category : #'instance creation' }
Biblioteca class >> newID: unID nombre: unNombre telefono: unTelefono direccion: unaDireccion representante: unRepresent [
	^self new
		initializeID: unID nombre: unNombre telefono: unTelefono direccion: unaDireccion representante: unRepresent;
		yourself.
]

{ #category : #accessing }
Biblioteca >> direccion [
	^direccion.
]

{ #category : #initialization }
Biblioteca >> initializeID: unID nombre: unNombre telefono: unTelefono direccion: unaDireccion representante: unRepresentante [
	self initialize.
	identificador := unID.
	nombre := unNombre.
	telefono := unTelefono.
	direccion := unaDireccion.
	representante := unRepresentante.
	colLibros := OrderedCollection new.
	colPrestamos := OrderedCollection new.
	^self.
]

{ #category : #accessing }
Biblioteca >> nombre [ 	
	^nombre.
]

{ #category : #accessing }
Biblioteca >> nombre: aNombre [
	nombre := aNombre.
]

{ #category : #accessing }
Biblioteca >> representante [
	^representante 
]

{ #category : #accessing }
Biblioteca >> telefono [
	^telefono .
]
