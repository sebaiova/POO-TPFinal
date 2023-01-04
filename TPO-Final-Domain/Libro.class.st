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
Libro class >> newNombre: unNombre editorial: unaEditorial año: unAño autores: losAutores [
	^self new initializeNombre: unNombre editorial: unaEditorial año: unAño autores: losAutores.
]

{ #category : #accessing }
Libro >> autores [	
	^colAutores
]

{ #category : #accessing }
Libro >> año [
	^año.
]

{ #category : #accessing }
Libro >> editorial [ 
	^editorial
]

{ #category : #accessing }
Libro >> esAudioLibro [
	^false.
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
