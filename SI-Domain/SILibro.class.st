Class {
	#name : #SILibro,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'editorial',
		'año',
		'prestado',
		'colAutores'
	],
	#category : #'SI-Domain'
}

{ #category : #'instance creation' }
SILibro class >> new [ 
	self error: 'Usar nombre:editorial:año:autores: en lugar de new'.
]

{ #category : #'instance creation' }
SILibro class >> nombre: unNombre editorial: unaEditorial año: unAño autores: losAutores [
	^super new initializeNombre: unNombre editorial: unaEditorial año: unAño autores: losAutores.
]

{ #category : #accessing }
SILibro >> autores [	
	^colAutores
]

{ #category : #accessing }
SILibro >> año [
	^año.
]

{ #category : #'changing state' }
SILibro >> devolver [ 
	prestado := false.
]

{ #category : #accessing }
SILibro >> editorial [ 
	^editorial
]

{ #category : #accessing }
SILibro >> esAudioLibro [
	^false.
]

{ #category : #accessing }
SILibro >> esPrestado [ 
	^prestado.
]

{ #category : #initialization }
SILibro >> initializeNombre: unNombre editorial: unaEditorial año: unAño autores: aColAutores [
	self initialize.
	nombre := unNombre.
	editorial := unaEditorial.
	año := unAño.
	colAutores := aColAutores.
	prestado := false.
	^self.
]

{ #category : #accessing }
SILibro >> nombre [
	^nombre
]

{ #category : #accessing }
SILibro >> prestado [ 
	^prestado.
]

{ #category : #'changing state' }
SILibro >> prestar [ 
	prestado := true.
]
