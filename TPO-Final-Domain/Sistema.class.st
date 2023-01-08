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

{ #category : #bibliotecas }
Sistema >> agregarBiblioteca: aBiblioteca [
	(self existeIDBiblioteca: aBiblioteca id) ifTrue: [^nil]
														 ifFalse: [ colBibliotecas add: aBiblioteca. ^aBiblioteca].
]

{ #category : #libros }
Sistema >> agregarLibro: unLibro enLaBiblioteca: unaBiblioteca [
	self registrarAutoresDelLibro: unLibro.
	unaBiblioteca agregarLibro: unLibro.
	^nil
]

{ #category : #usuarios }
Sistema >> agregarUsuario: unUsuario [
	colUsuarios add: unUsuario.
]

{ #category : #usuarios }
Sistema >> agregarUsuario: unDNI nombre: unNombre apellido: unApellido password: unPassword [ 
	colUsuarios add: (Usuario dni: unDNI nombre: unNombre apellido: unApellido password: unPassword).
]

{ #category : #bibliotecas }
Sistema >> bibliotecas [ 
	^colBibliotecas asArray. 
]

{ #category : #usuarios }
Sistema >> convertirANormal: unUsuario [ 
	colUsuarios remove: unUsuario ifAbsent: [ ^false ].
	colUsuarios add: (Usuario from: unUsuario).
	^true.
]

{ #category : #usuarios }
Sistema >> convertirAPlus: unUsuario [ 
	colUsuarios remove: unUsuario ifAbsent: [ ^false ].
	colUsuarios add: (UsuarioPlus from: unUsuario).
	^true.
]

{ #category : #usuarios }
Sistema >> existeDNIUsuario: unDNI [
	^colUsuarios detect: [ :user | user hasDNI: unDNI ] ifFound: [true] ifNone: [false]. 
	
]

{ #category : #bibliotecas }
Sistema >> existeIDBiblioteca: unID [	
	^colBibliotecas detect: [ :biblioteca | biblioteca hasID: unID ] ifFound: [true] ifNone: [false]. 
]

{ #category : #initialization }
Sistema >> initialize [
	super initialize.
	colUsuarios := OrderedCollection new.
	colBibliotecas := OrderedCollection new.
	colAutores := Set new.
	^self.
]

{ #category : #usuarios }
Sistema >> logging: aUserName password: aPassword [
	|user|
	user := self obtenerUsuario: aUserName.
	user ifNotNil: [(user hasPassword: aPassword) ifFalse: [ user := nil ]].
	^user.
]

{ #category : #usuarios }
Sistema >> obtenerUsuario: aDNI [
	^colUsuarios detect: [ :user | user hasDNI: aDNI ] ifNone: nil.
]

{ #category : #usuarios }
Sistema >> prestamosActivosDeUsuario: unUsuario [
	^colBibliotecas inject: OrderedCollection new into: [ :col :biblioteca | col addAll: (biblioteca prestamos select: [ :prestamo| (prestamo esDeUsuario: unUsuario) and: prestamo estaActivo ]). col].
		
]

{ #category : #usuarios }
Sistema >> prestamosDeUsuario: unUsuario [
	^colBibliotecas inject: OrderedCollection new into: [ :col :biblioteca | col addAll: (biblioteca prestamos select: [ :prestamo| prestamo esDeUsuario: unUsuario ]). col].
		
]

{ #category : #libros }
Sistema >> registrarAutoresDelLibro: unLibro [ 
	colAutores addAll: unLibro autores.
]

{ #category : #usuarios }
Sistema >> usuarios [ 
	^colUsuarios asArray. 
]
