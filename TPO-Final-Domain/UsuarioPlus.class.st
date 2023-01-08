Class {
	#name : #UsuarioPlus,
	#superclass : #Usuario,
	#category : #'TPO-Final-Domain'
}

{ #category : #'as yet unclassified' }
UsuarioPlus >> esPlus [ 
	^true.
]

{ #category : #accessing }
UsuarioPlus >> estaAlDiaConCuota [
	^true.
]

{ #category : #accessing }
UsuarioPlus >> puedePedirAudioLibros [ 
	^ self estaAlDiaConCuota.
]
