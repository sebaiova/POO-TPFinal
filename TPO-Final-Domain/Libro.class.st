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
Libro >> esAudioLibro [
	^false.
]

{ #category : #initialization }
Libro >> initializeNombre: unNombre editorial: unaEditorial año: unAño autores: losAutores [
	self initialize.
	nombre := unNombre.
	editorial := unaEditorial.
	año := unAño.
	colAutores := OrderedCollection newFrom: losAutores.
	prestado := false.
	^self.
]
