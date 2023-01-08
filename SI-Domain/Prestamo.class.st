Class {
	#name : #Prestamo,
	#superclass : #Object,
	#instVars : [
		'fechaCreacion',
		'fechaEntrega',
		'usuario',
		'colLibros',
		'fechaMaxima'
	],
	#category : #'SI-Domain'
}

{ #category : #'instance creation' }
Prestamo class >> new [ 
	self error: 'Usar usuario:libros:dias en lugar de new'.
]

{ #category : #'as yet unclassified' }
Prestamo class >> usuario: unUsuario libros: losLibros dias: losDias [	
	^super new initializeUsuario: unUsuario libros: losLibros dias: losDias.
]

{ #category : #accessing }
Prestamo >> cantidadLibros [ 
	^colLibros size.
]

{ #category : #accessing }
Prestamo >> esDeUsuario: unUsuario [
	^usuario = unUsuario.
]

{ #category : #accessing }
Prestamo >> estaActivo [ 
	^ fechaEntrega isNil.
]

{ #category : #'as yet unclassified' }
Prestamo >> estaRetrasado [
	^ self estaActivo and: (fechaMaxima isBefore: Date today). 
]

{ #category : #accessing }
Prestamo >> fecha [
	^fechaCreacion
]

{ #category : #accessing }
Prestamo >> fechaMaxima [ 
	^fechaMaxima 
]

{ #category : #initialization }
Prestamo >> initializeUsuario: unUsuario libros: losLibros dias: losDias [
	self initialize.
	usuario := unUsuario .
	colLibros := losLibros.
	fechaMaxima := Date today addDays: losDias.
	fechaCreacion := Date today.
	colLibros do: [ :libro | libro prestar ].
]

{ #category : #accessing }
Prestamo >> libros [ 
	^colLibros asArray.
]

{ #category : #registration }
Prestamo >> terminar [ 
	fechaEntrega := Date today.
	colLibros do: [ :libro | libro devolver ].
]

{ #category : #accessing }
Prestamo >> usuario [ 
	^usuario.
]
