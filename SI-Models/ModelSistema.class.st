Class {
	#name : #ModelSistema,
	#superclass : #SistemaPreloaded,
	#instVars : [
		'model_usuarios',
		'model_bibliotecas'
	],
	#category : #'SI-Models'
}

{ #category : #adding }
ModelSistema >> agregarUsuario: unDNI nombre: unNombre apellido: unApellido password: unPassword [
	super agregarUsuario: unDNI nombre: unNombre apellido: unApellido password: unPassword.
	model_usuarios changed: #refresh.
]

{ #category : #accessing }
ModelSistema >> bibliotecas [
	^model_bibliotecas 
]

{ #category : #initialization }
ModelSistema >> initialize [ 	
	super initialize.
	model_usuarios := ModelUsuarios new: colUsuarios.
	model_bibliotecas := ModelBibliotecas new: colBibliotecas.
	^self.
]

{ #category : #accessing }
ModelSistema >> usuarios [ 
	^ model_usuarios 
]
