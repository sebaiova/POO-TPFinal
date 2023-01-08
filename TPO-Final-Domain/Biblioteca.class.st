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
		'colPrestamos',
		'diasPrestamo'
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
Biblioteca >> devolverPrestamo: unUsuario [ 
	(self prestamosActivosDe: unUsuario) do: [ :prestamo | prestamo libros first esAudioLibro ifFalse: [prestamo terminar. ^true]].
	^false.
]

{ #category : #accessing }
Biblioteca >> devolverPrestamoAudioLibros: unUsuario [
	"Solo devuelve prestamos de libros normales. Para devolver audiolibros usar devolverPrestamoAudioLibros:"
	(self prestamosActivosDe: unUsuario) do: [ :prestamo | prestamo libros first esAudioLibro ifTrue: [prestamo terminar. ^true]].
	^false.
]

{ #category : #accessing }
Biblioteca >> direccion [
	^direccion.
]

{ #category : #accessing }
Biblioteca >> direccion: aDireccion [
	direccion := aDireccion
]

{ #category : #accessing }
Biblioteca >> hasID: unID [ 
	^ identificador = unID.
]

{ #category : #accessing }
Biblioteca >> id [ 
	^identificador.
]

{ #category : #initialization }
Biblioteca >> initializeID: unID nombre: unNombre telefono: unTelefono direccion: unaDireccion representante: unRepresentante [
	self initialize.
	identificador := unID.
	nombre := unNombre.
	telefono := unTelefono.
	direccion := unaDireccion.
	representante := unRepresentante.
	diasPrestamo := 10.
	colLibros := OrderedCollection new.
	colPrestamos := OrderedCollection new.
	^self.
]

{ #category : #accessing }
Biblioteca >> libros [
	^colLibros asArray.
]

{ #category : #accessing }
Biblioteca >> librosDisponibles [
	^(colLibros reject: [ :libro | libro esPrestado]) asArray.
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

{ #category : #accessing }
Biblioteca >> prestamosActivos [
	^colPrestamos select: [ :prestamo | prestamo estaActivo ].
]

{ #category : #accessing }
Biblioteca >> prestamosActivosDe: unUsuario [ 
	^colPrestamos select: [ :prestamo | (prestamo esDeUsuario: unUsuario) and: prestamo estaActivo ].
]

{ #category : #accessing }
Biblioteca >> registrarPrestamoUsuario: unUsuario libros: losLibros [
	| audioLibros librosNormales |
	
	(unUsuario estaSuspendido or: (
		(self tienePrestamoActivo: unUsuario) or: (
			losLibros size > 5 or: (
				losLibros anySatisfy: [:libro | libro esPrestado])))) ifTrue: [^false].
	
	audioLibros 	:= losLibros select: [ :libro | libro esAudioLibro]. 
	audioLibros ifEmpty: [ 
							colPrestamos add: (Prestamo usuario: unUsuario libros: losLibros dias: diasPrestamo). ^true].
	
	unUsuario puedePedirAudioLibros ifFalse: [^false]. 
	librosNormales := losLibros reject: [ :libro | libro esAudioLibro  ].
	
	librosNormales ifNotEmpty: [ colPrestamos add: (Prestamo usuario: unUsuario libros: librosNormales dias: diasPrestamo) ].
	colPrestamos add: (Prestamo usuario: unUsuario libros: audioLibros dias: diasPrestamo/2).
	^true.
	
			

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

{ #category : #accessing }
Biblioteca >> tienePrestamoActivo: unUsuario [ 
	^colPrestamos detect: [ :prestamo | (prestamo esDeUsuario: unUsuario) and: (prestamo estaActivo ) ]
					ifFound: [ true ]
					ifNone:  [ false ].
]
