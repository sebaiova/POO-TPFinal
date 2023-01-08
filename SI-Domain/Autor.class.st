Class {
	#name : #Autor,
	#superclass : #Object,
	#instVars : [
		'nombre'
	],
	#category : #'SI-Domain'
}

{ #category : #'instance creation' }
Autor class >> new [ 
	self error: 'Usar nombre: en lugar de new.'
]

{ #category : #accessing }
Autor class >> nombre: unNombre [ 
	^super new initializeNombre: unNombre.
]

{ #category : #comparing }
Autor >> = other [
	^ self nombre = other nombre.
]

{ #category : #comparing }
Autor >> hash [ 
	^nombre hash.
]

{ #category : #initialization }
Autor >> initializeNombre: aNombre [
	nombre := aNombre
]

{ #category : #initialization }
Autor >> nombre [
	^nombre.
]
