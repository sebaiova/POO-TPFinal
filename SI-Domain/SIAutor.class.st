Class {
	#name : #SIAutor,
	#superclass : #Object,
	#instVars : [
		'nombre'
	],
	#category : #'SI-Domain'
}

{ #category : #'instance creation' }
SIAutor class >> new [ 
	self error: 'Usar nombre: en lugar de new.'
]

{ #category : #accessing }
SIAutor class >> nombre: unNombre [ 
	^super new initializeNombre: unNombre.
]

{ #category : #comparing }
SIAutor >> = other [
	^ self nombre = other nombre.
]

{ #category : #comparing }
SIAutor >> hash [ 
	^nombre hash.
]

{ #category : #initialization }
SIAutor >> initializeNombre: aNombre [
	nombre := aNombre
]

{ #category : #initialization }
SIAutor >> nombre [
	^nombre.
]
