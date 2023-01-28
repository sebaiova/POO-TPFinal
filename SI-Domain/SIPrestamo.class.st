Class {
	#name : #SIPrestamo,
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
SIPrestamo class >> atrasado: unUsuario libros: losLibros dias: losDias [
	"Para testear"
	^super new initializeAtrasado: unUsuario libros: losLibros dias: losDias.
]

{ #category : #'instance creation' }
SIPrestamo class >> new [ 
	self error: 'Usar usuario:libros:dias en lugar de new'.
]

{ #category : #'instance creation' }
SIPrestamo class >> usuario: unUsuario libros: losLibros dias: losDias [	
	^super new initializeUsuario: unUsuario libros: losLibros dias: losDias.
]

{ #category : #accessing }
SIPrestamo >> cantidadLibros [ 
	^colLibros size.
]

{ #category : #accessing }
SIPrestamo >> diasHastaVencimiento [ 	
	^(fechaMaxima - Date today) asDays. 
]

{ #category : #accessing }
SIPrestamo >> esDeUsuario: unUsuario [
	^usuario = unUsuario.
]

{ #category : #accessing }
SIPrestamo >> estaActivo [ 
	^ fechaEntrega isNil.
]

{ #category : #accessing }
SIPrestamo >> estaRetrasado [
	^ self estaActivo and: (fechaMaxima isBefore: Date today). 
]

{ #category : #accessing }
SIPrestamo >> fecha [
	^fechaCreacion
]

{ #category : #accessing }
SIPrestamo >> fechaMaxima [ 
	^fechaMaxima 
]

{ #category : #initialization }
SIPrestamo >> initializeAtrasado: unUsuario libros: losLibros dias: losDias [
	"testing"
	self initialize.
	usuario := unUsuario .
	colLibros := losLibros.
	colLibros do: [ :libro | libro prestar].
	fechaCreacion := Date today subtractDays: losDias + 2.
	fechaMaxima := fechaCreacion addDays: losDias.

]

{ #category : #initialization }
SIPrestamo >> initializeUsuario: unUsuario libros: losLibros dias: losDias [
	self initialize.
	usuario := unUsuario .
	colLibros := losLibros.
	colLibros do: [ :libro | libro prestar].
	fechaMaxima := Date today addDays: losDias.
	fechaCreacion := Date today.
]

{ #category : #accessing }
SIPrestamo >> libros [ 
	^colLibros asArray.
]

{ #category : #registration }
SIPrestamo >> terminar [ 
	fechaEntrega := Date today.
	colLibros do: [ :libro | libro devolver ].
]

{ #category : #accessing }
SIPrestamo >> tieneAudioLibros [ 
	^colLibros first esAudioLibro .
]

{ #category : #accessing }
SIPrestamo >> usuario [ 
	^usuario.
]
