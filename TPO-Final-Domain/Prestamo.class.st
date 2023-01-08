Class {
	#name : #Prestamo,
	#superclass : #Object,
	#instVars : [
		'fechaCreacion',
		'fechaEntrega',
		'usuario',
		'colLibros',
		'plazoDias'
	],
	#category : #'TPO-Final-Domain'
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

{ #category : #accessing }
Prestamo >> fecha [
	^fechaCreacion
]

{ #category : #initialization }
Prestamo >> initializeUsuario: unUsuario libros: losLibros dias: losDias [
	self initialize.
	usuario := unUsuario .
	colLibros := losLibros.
	plazoDias := losDias.
	fechaCreacion := Date today.
	colLibros do: [ :libro | libro prestar ].
]

{ #category : #accessing }
Prestamo >> libros [ 
	^colLibros asArray.
]

{ #category : #accessing }
Prestamo >> plazoDias [ 
	^plazoDias
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
