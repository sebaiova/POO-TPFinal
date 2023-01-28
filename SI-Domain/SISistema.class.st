Class {
	#name : #SISistema,
	#superclass : #Object,
	#instVars : [
		'colBibliotecas',
		'colUsuarios',
		'colAutores'
	],
	#category : #'SI-Domain'
}

{ #category : #bibliotecas }
SISistema >> agregarBiblioteca: aBiblioteca [
	(self existeIDBiblioteca: aBiblioteca id) ifTrue: [^nil]
														 ifFalse: [ colBibliotecas add: aBiblioteca. ^aBiblioteca].
]

{ #category : #libros }
SISistema >> agregarLibro: unLibro enLaBiblioteca: unaBiblioteca [
	self registrarAutoresDelLibro: unLibro.
	unaBiblioteca agregarLibro: unLibro.
	^nil
]

{ #category : #usuarios }
SISistema >> agregarUsuario: unUsuario [
	colUsuarios add: unUsuario.
]

{ #category : #bibliotecas }
SISistema >> bibliotecas [ 
	^colBibliotecas asArray. 
]

{ #category : #usuarios }
SISistema >> convertirANormal: unUsuario [ 
	colUsuarios remove: unUsuario ifAbsent: [ ^false ].
	colUsuarios add: (SIUsuario from: unUsuario).
	^true.
]

{ #category : #usuarios }
SISistema >> convertirAPlus: unUsuario [ 
	colUsuarios remove: unUsuario ifAbsent: [ ^false ].
	colUsuarios add: (SIUsuarioPlus from: unUsuario).
	^true.
]

{ #category : #usuarios }
SISistema >> existeDNI: unDNI [
	^colUsuarios detect: [ :user | user hasDNI: unDNI ] ifFound: [true] ifNone: [false]. 
	
]

{ #category : #bibliotecas }
SISistema >> existeIDBiblioteca: unID [	
	^colBibliotecas detect: [ :biblioteca | biblioteca hasID: unID ] ifFound: [true] ifNone: [false]. 
]

{ #category : #usuarios }
SISistema >> generarListadoUsuariosRestrasados [ 
	|colRetrasos|
	colRetrasos := OrderedCollection new.
	colBibliotecas do: [ :biblioteca | biblioteca usuariosAtrasados 
								collect: [ :usuario | {usuario. biblioteca}] into: colRetrasos
						].
	^colRetrasos
	
]

{ #category : #initialization }
SISistema >> initialize [
	super initialize.
	colUsuarios := OrderedCollection new.
	colBibliotecas := OrderedCollection new.
	colAutores := Set new.
	^self.
]

{ #category : #usuarios }
SISistema >> logging: aUserName password: aPassword [
	|user|
	user := self obtenerUsuario: aUserName.
	user ifNotNil: [(user hasPassword: aPassword) ifFalse: [ user := nil ]].
	^user.
]

{ #category : #usuarios }
SISistema >> obtenerUsuario: aDNI [
	^colUsuarios detect: [ :user | user hasDNI: aDNI ] ifNone: nil.
]

{ #category : #usuarios }
SISistema >> prestamosActivosDeUsuario: unUsuario [
	^colBibliotecas inject: OrderedCollection new into: [ :col :biblioteca | col addAll: (biblioteca prestamos select: [ :prestamo| (prestamo esDeUsuario: unUsuario) and: prestamo estaActivo ]). col].
		
]

{ #category : #libros }
SISistema >> registrarAutoresDelLibro: unLibro [ 
	colAutores addAll: unLibro autores.
]

{ #category : #usuarios }
SISistema >> usuarios [ 
	^colUsuarios asArray. 
]
