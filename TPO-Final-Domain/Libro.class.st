Class {
	#name : #Libro,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'editorial',
		'año',
		'prestado',
		'colAutores'
	],
	#category : #'TPO-Final-Domain'
}

{ #category : #'instance creation' }
Libro class >> new [ 
	self error: 'Usar nombre:editorial:año:autores: en lugar de new'.
]

{ #category : #'instance creation' }
Libro class >> nombre: unNombre editorial: unaEditorial año: unAño autores: losAutores [
	^super new initializeNombre: unNombre editorial: unaEditorial año: unAño autores: losAutores.
]

{ #category : #accessing }
Libro >> autores [	
	^colAutores
]

{ #category : #accessing }
Libro >> año [
	^año.
]

{ #category : #'changing state' }
Libro >> devolver [ 
	prestado := false.
]

{ #category : #accessing }
Libro >> editorial [ 
	^editorial
]

{ #category : #accessing }
Libro >> esAudioLibro [
	^false.
]

{ #category : #accessing }
Libro >> esPrestado [ 
	^prestado.
]

{ #category : #initialization }
Libro >> initializeNombre: unNombre editorial: unaEditorial año: unAño autores: aColAutores [
	self initialize.
	nombre := unNombre.
	editorial := unaEditorial.
	año := unAño.
	colAutores := aColAutores.
	prestado := false.
	^self.
]

{ #category : #accessing }
Libro >> nombre [
	^nombre
]

{ #category : #accessing }
Libro >> prestado [ 
	^prestado.
]

{ #category : #'changing state' }
Libro >> prestar [ 
	prestado := true.
]
