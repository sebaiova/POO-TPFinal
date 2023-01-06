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
Biblioteca class >> id: unID nombre: unNombre telefono: unTelefono direccion: unaDireccion representante: unRepresent [
	^super new
		initializeID: unID nombre: unNombre telefono: unTelefono direccion: unaDireccion representante: unRepresent;
		yourself.
]

{ #category : #'instance creation' }
Biblioteca class >> new [ 
	self error: 'No usar new'
]

{ #category : #adding }
Biblioteca >> agregarLibro: aLibro [
	"Deberia solo poder ser llamado por la clase Sistema. (private, friend class Sistema)
	Los autores del libro tienen que ser registrados en el sistema.
	 < Sistema agregarLibro:enLaBiblioteca:  >"
	colLibros add: aLibro.
]

{ #category : #accessing }
Biblioteca >> direccion [
	^direccion.
]

{ #category : #accessing }
Biblioteca >> direccion: aDireccion [
	direccion := aDireccion
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
Biblioteca >> libros [
	^colLibros asArray.
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
Biblioteca >> prestamos [
	^colPrestamos asArray.
]

{ #category : #'as yet unclassified' }
Biblioteca >> registrarPrestamoUsuario: unUsuario libros: losLibros [ 
	colPrestamos detect: [ :prestamo | prestamo esDeUsuario: unUsuario] 
		ifNone: [ colPrestamos add: (Prestamo usuario: unUsuario libros: losLibros dias: 10) ].

]

{ #category : #removing }
Biblioteca >> removerLibro: unLibro [ 
	colLibros remove: unLibro ifAbsent: [ nil ].  
]

{ #category : #accessing }
Biblioteca >> representante [
	^representante 
]

{ #category : #accessing }
Biblioteca >> representante: aRepresentante [
	representante := aRepresentante .
]

{ #category : #accessing }
Biblioteca >> telefono [
	^telefono .
]

{ #category : #accessing }
Biblioteca >> telefono: aTelefono [
	telefono := aTelefono.
]
