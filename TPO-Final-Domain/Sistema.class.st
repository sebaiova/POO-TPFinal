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

{ #category : #adding }
Sistema >> agregarBiblioteca: aBiblioteca [
	(self existeIDBiblioteca: aBiblioteca id) ifTrue: [^nil]
														 ifFalse: [ colBibliotecas add: aBiblioteca. ^aBiblioteca].
]

{ #category : #accessing }
Sistema >> agregarLibro: unLibro enLaBiblioteca: unaBiblioteca [
	self registrarAutoresDelLibro: unLibro.
	unaBiblioteca agregarLibro: unLibro.
	^nil
]

{ #category : #adding }
Sistema >> agregarUsuario: unUsuario [
	colUsuarios add: unUsuario.
]

{ #category : #adding }
Sistema >> agregarUsuario: unDNI nombre: unNombre apellido: unApellido password: unPassword [ 
	colUsuarios add: (Usuario dni: unDNI nombre: unNombre apellido: unApellido password: unPassword).
]

{ #category : #accessing }
Sistema >> bibliotecas [ 
	^colBibliotecas asArray. 
]

{ #category : #accessing }
Sistema >> existeDNIUsuario: unDNI [
	^colUsuarios detect: [ :user | user hasDNI: unDNI ] ifFound: [true] ifNone: [false]. 
	
]

{ #category : #accessing }
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

{ #category : #accessing }
Sistema >> prestamosDeUsuario: unUsuario [
	^colBibliotecas inject: OrderedCollection new into: [ :col :biblioteca | col addAll: (biblioteca prestamos select: [ :prestamo| prestamo esDeUsuario: unUsuario ]). col].
		
]

{ #category : #adding }
Sistema >> registrarAutoresDelLibro: unLibro [ 
	colAutores addAll: unLibro autores.
]

{ #category : #accessing }
Sistema >> usuarios [ 
	^colUsuarios asArray. 
]
