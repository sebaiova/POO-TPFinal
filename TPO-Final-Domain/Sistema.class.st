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

{ #category : #'as yet unclassified' }
Sistema >> agregarLibro: unLibro enLaBiblioteca: unaBiblioteca [
	self registrarAutoresDelLibro: unLibro.
	unaBiblioteca agregarLibro: unLibro.
	^nil
]

{ #category : #adding }
Sistema >> agregarUsuario: unDNI nombre: unNombre apellido: unApellido password: unPassword [ 
	colUsuarios add: (Usuario newDNI: unDNI nombre: unNombre apellido: unApellido password: unPassword).
]

{ #category : #accessing }
Sistema >> bibliotecas [ 
	^colBibliotecas asArray. 
]

{ #category : #'as yet unclassified' }
Sistema >> cargarAutores: unArrayNombres [
	|autores autor|
	autores := OrderedCollection new.
	unArrayNombres do: [ :aNombre | autor := (Autor nombre: aNombre). colAutores add: autor. autores add: autor].
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

{ #category : #'as yet unclassified' }
Sistema >> registrarAutoresDelLibro: unLibro [ 
	colAutores addAll: unLibro autores.
]

{ #category : #accessing }
Sistema >> usuarios [ 
	^colUsuarios asArray. 
]
