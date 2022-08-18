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
	colUsuarios at: unDNI put: (Usuario newDNI: unDNI nombre: unNombre apellido: unApellido password: unPassword).
]

{ #category : #accessing }
Sistema >> existeUsuario: unDNI [
	^colUsuarios at: unDNI ifPresent: [ true ] ifAbsent: [ false ].
	
]

{ #category : #initialization }
Sistema >> initialize [
	super initialize.
	colUsuarios := Dictionary new.
	colBibliotecas := OrderedCollection new.
	^self.
]

{ #category : #accessing }
Sistema >> logging: aUserName password: aPassword [
	|user|
	user := colUsuarios at: aUserName ifAbsent: [nil].
	user ifNotNil: [(user hasPassword: aPassword) ifFalse: [ user := nil ]].
	^user.
]
