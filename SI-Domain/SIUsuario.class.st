Class {
	#name : #SIUsuario,
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
SIUsuario class >> dni: unDNI nombre: unNombre apellido: unApellido password: unPassword [
	^super new
		initializeDNI: unDNI nombre: unNombre apellido: unApellido password: unPassword;
		yourself.
]

{ #category : #'instance creation' }
SIUsuario class >> from: other [ 
	^super new initializeDNI: other dni nombre: other nombre apellido: other apellido password: other password;
				  bibliotecasDeInteres: other bibliotecasDeInteres.
]

{ #category : #'instance creation' }
SIUsuario class >> new [ 
	self error: 'Usar dni:nombre:apellido:password o from: en lugar de new'.
]

{ #category : #comparing }
SIUsuario >> = other [ 
	^dni = other dni
]

{ #category : #accessing }
SIUsuario >> apellido [
	^apellido
]

{ #category : #accessing }
SIUsuario >> bibliotecasDeInteres [
	^colBibliotecasInteres asArray.
]

{ #category : #accessing }
SIUsuario >> bibliotecasDeInteres: lasBibliotecas [
	colBibliotecasInteres := lasBibliotecas
]

{ #category : #accessing }
SIUsuario >> dni [
	^dni.
]

{ #category : #accessing }
SIUsuario >> esPlus [ 
	^false.
]

{ #category : #accessing }
SIUsuario >> estaSuspendido [
	^diasSuspension > 0.
]

{ #category : #testing }
SIUsuario >> hasDNI: unDNI [
	^ dni=unDNI.
	
]

{ #category : #testing }
SIUsuario >> hasPassword: aPassword [
	^password = aPassword.
]

{ #category : #comparing }
SIUsuario >> hash [ 
	^dni hash.
]

{ #category : #initialization }
SIUsuario >> initializeDNI: unDNI nombre: unNombre apellido: unApellido password: unPassword [
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
SIUsuario >> nombre [
	^nombre.
]

{ #category : #accessing }
SIUsuario >> password [ 
	^password.
]

{ #category : #accessing }
SIUsuario >> puedePedirAudioLibros [ 
	^false.
]

{ #category : #accessing }
SIUsuario >> tieneBibliotecasDeInteres [ 
	^colBibliotecasInteres isNotEmpty .
]
