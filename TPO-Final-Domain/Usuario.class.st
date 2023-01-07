Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'apellido',
		'dni',
		'password',
		'colBibliotecasInteres'
	],
	#category : #'TPO-Final-Domain'
}

{ #category : #'instance creation' }
Usuario class >> dni: unDNI nombre: unNombre apellido: unApellido password: unPassword [
	^self new
		initializeDNI: unDNI nombre: unNombre apellido: unApellido password: unPassword;
		yourself.
]

{ #category : #comparing }
Usuario >> = other [ 
	^dni = other dni
]

{ #category : #adding }
Usuario >> addBibliotecaInteres: unaBiblioteca [
	colBibliotecasInteres add: unaBiblioteca .
]

{ #category : #accessing }
Usuario >> apellido [
	^apellido
]

{ #category : #'as yet unclassified' }
Usuario >> bibliotecasDeInteres [
	^colBibliotecasInteres asArray.
]

{ #category : #accessing }
Usuario >> bibliotecasDeInteres: lasBibliotecas [
	colBibliotecasInteres := lasBibliotecas
]

{ #category : #accessing }
Usuario >> dni [
	^dni.
]

{ #category : #'as yet unclassified' }
Usuario >> esPlus [ 
	^false.
]

{ #category : #testing }
Usuario >> hasDNI: unDNI [
	^ dni=unDNI.
	
]

{ #category : #testing }
Usuario >> hasPassword: aPassword [
	^password = aPassword.
]

{ #category : #comparing }
Usuario >> hash [ 
	^dni hash.
]

{ #category : #initialization }
Usuario >> initializeDNI: unDNI nombre: unNombre apellido: unApellido password: unPassword [
	self initialize.
	dni := unDNI.
	nombre := unNombre.
	apellido := unApellido.
	password := unPassword.
	colBibliotecasInteres := OrderedCollection new.
	^self.
]

{ #category : #accessing }
Usuario >> nombre [
	^nombre.
]

{ #category : #'as yet unclassified' }
Usuario >> tieneBibliotecasDeInteres [ 
	^colBibliotecasInteres isNotEmpty .
]
