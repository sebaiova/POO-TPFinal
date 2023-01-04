Class {
	#name : #Autor,
	#superclass : #Object,
	#instVars : [
		'nombre'
	],
	#category : #'TPO-Final-Domain'
}

{ #category : #'instance creation' }
Autor class >> new: aNombre [
	^self new initialize: aNombre.
]

{ #category : #initialization }
Autor >> initialize: aNombre [
	nombre := aNombre
]

{ #category : #initialization }
Autor >> nombre [
	^nombre.
]
