Class {
	#name : #ModelSistema,
	#superclass : #SistemaPreloaded,
	#instVars : [
		'model_usuarios',
		'model_bibliotecas'
	],
	#category : #'TPO-Final-Models'
}

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
