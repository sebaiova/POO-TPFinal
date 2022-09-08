Class {
	#name : #Sistema,
	#superclass : #Object,
	#instVars : [
		'colBibliotecas',
		'colUsuarios'
	],
	#category : #'TPO-Final-Domain'
}

{ #category : #adding }
Sistema >> agregarUsuario: unDNI nombre: unNombre apellido: unApellido password: unPassword [ 
	colUsuarios add: (Usuario newDNI: unDNI nombre: unNombre apellido: unApellido password: unPassword).
]

{ #category : #accessing }
Sistema >> existeUsuario: unDNI [
	^colUsuarios detect: [ :user | user hasDNI: unDNI ] ifFound: [true] ifNone: [false]. 
	
]

{ #category : #initialization }
Sistema >> initialize [
	super initialize.
	colUsuarios := OrderedCollection new.
	colBibliotecas := OrderedCollection new.
	^self.
]

{ #category : #accessing }
Sistema >> logging: aUserName password: aPassword [
	|user|
	user := self obtenerUsuario: aUserName.
	user ifNotNil: [(user hasPassword: aPassword) ifFalse: [ user := nil ]].
	^user.
]

{ #category : #accessing }
Sistema >> obtenerUsuario: aDNI [
	^colUsuarios detect: [ :user | user hasDNI: aDNI ] ifNone: nil.
]

{ #category : #accessing }
Sistema >> usuarios [
	^colUsuarios 
]
