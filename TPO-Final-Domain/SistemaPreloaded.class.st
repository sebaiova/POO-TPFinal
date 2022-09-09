Class {
	#name : #SistemaPreloaded,
	#superclass : #Sistema,
	#category : #'TPO-Final-Domain'
}

{ #category : #initialization }
SistemaPreloaded >> initialize [ 
	super initialize.
	^self agregarUsuario: 39062823 nombre: 'Sebastian' apellido: 'Iovaldi' password: 1234; yourself.
]
