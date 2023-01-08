Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'apellido',
		'dni',
		'password',
		'colBibliotecasInteres',
		'diasSuspension'
	],
	#category : #'SI-Domain'
}

{ #category : #'instance creation' }
Usuario class >> dni: unDNI nombre: unNombre apellido: unApellido password: unPassword [
	^super new
		initializeDNI: unDNI nombre: unNombre apellido: unApellido password: unPassword;
		yourself.
]

{ #category : #'instance creation' }
Usuario class >> from: other [ 
	^super new initializeDNI: other dni nombre: other nombre apellido: other apellido password: other password;
				  bibliotecasDeInteres: other bibliotecasDeInteres.
]

{ #category : #'instance creation' }
Usuario class >> new [ 
	self error: 'Usar dni:nombre:apellido:password o from: en lugar de new'.
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

{ #category : #accessing }
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

{ #category : #accessing }
Usuario >> esPlus [ 
	^false.
]

{ #category : #accessing }
Usuario >> estaSuspendido [
	^diasSuspension > 0.
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
	diasSuspension := 0.
	^self.
]

{ #category : #accessing }
Usuario >> nombre [
	^nombre.
]

{ #category : #accessing }
Usuario >> password [ 
	^password.
]

{ #category : #accessing }
Usuario >> puedePedirAudioLibros [ 
	^false.
]

{ #category : #accessing }
Usuario >> tieneBibliotecasDeInteres [ 
	^colBibliotecasInteres isNotEmpty .
]
