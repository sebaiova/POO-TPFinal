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

{ #category : #'as yet unclassified' }
Sistema >> getUniversidadesDondeEstudia: unDNI [
	^universidades select: [ :universidad | universidad esEstudiando: unDNI ].
]

{ #category : #initialization }
Sistema >> initialize [
	super initialize.
	colUsuarios := Dictionary new.
	colBibliotecas := OrderedCollection new.
	^self.
]

{ #category : #'as yet unclassified' }
Sistema >> pushUniversidad: aUniversidad [
	universidades add: aUniversidad .
]
