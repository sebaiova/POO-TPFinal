Class {
	#name : #Sistema,
	#superclass : #Object,
	#instVars : [
		'colBibliotecas',
		'colUsuarios',
		'colAutores'
	],
	#category : #'TPO-Final-Domain'
}

{ #category : #'as yet unclassified' }
Sistema >> agregarBiblioteca: aBiblioteca [
	colBibliotecas add: aBiblioteca .
	^aBiblioteca .
]

{ #category : #adding }
Sistema >> agregarBiblioteca: id nombre: aNombre direccion: aDireccion telefono: aTelefono representante: aRepresentante [
	|biblioteca|
	biblioteca := (Biblioteca newID: id nombre: aNombre telefono: aTelefono direccion: aDireccion representante: aRepresentante).
	colBibliotecas add: biblioteca.
	^biblioteca.
	
]

{ #category : #adding }
Sistema >> agregarUsuario: unDNI nombre: unNombre apellido: unApellido password: unPassword [ 
	colUsuarios add: (Usuario newDNI: unDNI nombre: unNombre apellido: unApellido password: unPassword).
]

{ #category : #'as yet unclassified' }
Sistema >> cargarAutores: anArrayNombres [
	|autores autor|
	autores := OrderedCollection new.
	anArrayNombres do: [ :aNombre | autor := (Autor new: aNombre). colAutores add: autor. autores add: autor].
	^autores.
]

{ #category : #accessing }
Sistema >> existeUsuario: unDNI [
	^colUsuarios detect: [ :user | user hasDNI: unDNI ] ifFound: [true] ifNone: [false]. 
	
]

{ #category : #initialization }
Sistema >> initialize [
	super initialize.
	colUsuarios := OrderedCollection new.
	colBibliotecas := OrderedCollection new.
	colAutores := Set new.
	^self.
]

{ #category : #accessing }
Sistema >> logging: aUserName password: aPassword [
	|user|
	user := self obtenerUsuario: aUserName.
	user ifNotNil: [(user hasPassword: aPassword) ifFalse: [ user := nil ]].
	^user.
]

{ #category : #accessing }
Sistema >> obtenerUsuario: aDNI [
	^colUsuarios detect: [ :user | user hasDNI: aDNI ] ifNone: nil.
]
