Class {
	#name : #SIBiblioteca,
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
	#category : #'SI-Domain'
}

{ #category : #'instance creation' }
SIBiblioteca class >> id: unID nombre: unNombre telefono: unTelefono direccion: unaDireccion representante: unRepresent [
	^super new
		initializeID: unID nombre: unNombre telefono: unTelefono direccion: unaDireccion representante: unRepresent;
		yourself.
]

{ #category : #'instance creation' }
SIBiblioteca class >> new [ 
	self error: 'No usar new'
]

{ #category : #adding }
SIBiblioteca >> agregarLibro: aLibro [
	"Deberia solo poder ser llamado por la clase Sistema. (private, friend class Sistema)
	Los autores del libro tienen que ser registrados en el sistema.
	 < Sistema agregarLibro:enLaBiblioteca:  >"
	colLibros add: aLibro.
]

{ #category : #accessing }
SIBiblioteca >> devolverPrestamo: unUsuario [
	"Solo devuelve prestamos de libros normales. Para devolver audiolibros usar devolverPrestamoAudioLibros:"
	(self prestamosActivosDe: unUsuario) detect: [ :prestamo | prestamo libros first esAudioLibro not] 
		ifFound: [ :prestamo |
			prestamo terminar. 
			prestamo 	libros do: [ :libro | libro devolver ]
		] 	ifNone: [ ^false ] .
	^true.

]

{ #category : #accessing }
SIBiblioteca >> devolverPrestamoAudioLibros: unUsuario [
	(self prestamosActivosDe: unUsuario) detect: [ :prestamo | prestamo libros first esAudioLibro] 
		ifFound: [ :prestamo |
			prestamo terminar. 
			prestamo 	libros do: [ :libro | libro devolver ]
		] 	ifNone: [ ^false ] .
	^true.
]

{ #category : #accessing }
SIBiblioteca >> direccion [
	^direccion.
]

{ #category : #accessing }
SIBiblioteca >> direccion: aDireccion [
	direccion := aDireccion
]

{ #category : #accessing }
SIBiblioteca >> hasID: unID [ 
	^ identificador = unID.
]

{ #category : #accessing }
SIBiblioteca >> id [ 
	^identificador.
]

{ #category : #initialization }
SIBiblioteca >> initializeID: unID nombre: unNombre telefono: unTelefono direccion: unaDireccion representante: unRepresentante [
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
SIBiblioteca >> libros [
	^colLibros asArray.
]

{ #category : #accessing }
SIBiblioteca >> librosDisponibles [
	^(colLibros reject: [ :libro | libro esPrestado]) asArray.
]

{ #category : #accessing }
SIBiblioteca >> nombre [ 	
	^nombre.
]

{ #category : #accessing }
SIBiblioteca >> nombre: aNombre [
	nombre := aNombre.
]

{ #category : #accessing }
SIBiblioteca >> prestamos [
	^colPrestamos asArray.
]

{ #category : #accessing }
SIBiblioteca >> prestamosActivos [
	^colPrestamos select: [ :prestamo | prestamo estaActivo ].
]

{ #category : #accessing }
SIBiblioteca >> prestamosActivosDe: unUsuario [ 
	^colPrestamos select: [ :prestamo | (prestamo esDeUsuario: unUsuario) and: prestamo estaActivo ].
]

{ #category : #accessing }
SIBiblioteca >> registrarPrestamoUsuario: unUsuario libros: losLibros [
	| audioLibros librosNormales |
	
	(unUsuario estaSuspendido or: (
		(self tienePrestamoActivo: unUsuario) or: (
			losLibros size > 5 or: (
				losLibros anySatisfy: [:libro | libro esPrestado])))) ifTrue: [^false].
	
	audioLibros 	:= losLibros select: [ :libro | libro esAudioLibro]. 
	audioLibros ifEmpty: [ 
							colPrestamos add: (SIPrestamo usuario: unUsuario libros: losLibros dias: diasPrestamo). 
							losLibros do: [ :libro | libro prestar ]]
			ifNotEmpty: [
					unUsuario puedePedirAudioLibros ifFalse: [^false]. 
					librosNormales := losLibros reject: [ :libro | libro esAudioLibro ].
					librosNormales ifNotEmpty: [ colPrestamos add: (SIPrestamo usuario: unUsuario libros: librosNormales dias: diasPrestamo) ].
				 	colPrestamos add: (SIPrestamo usuario: unUsuario libros: audioLibros dias: diasPrestamo/2).
				].
	losLibros do: [ :libro | libro prestar ].
	^true.
	
			

]

{ #category : #removing }
SIBiblioteca >> removerLibro: unLibro [ 
	colLibros remove: unLibro ifAbsent: [ nil ].  
]

{ #category : #accessing }
SIBiblioteca >> representante [
	^representante 
]

{ #category : #accessing }
SIBiblioteca >> representante: aRepresentante [
	representante := aRepresentante .
]

{ #category : #accessing }
SIBiblioteca >> telefono [
	^telefono .
]

{ #category : #accessing }
SIBiblioteca >> telefono: aTelefono [
	telefono := aTelefono.
]

{ #category : #accessing }
SIBiblioteca >> tienePrestamoActivo: unUsuario [ 
	^colPrestamos detect: [ :prestamo | (prestamo esDeUsuario: unUsuario) and: (prestamo estaActivo ) ]
					ifFound: [ true ]
					ifNone:  [ false ].
]
