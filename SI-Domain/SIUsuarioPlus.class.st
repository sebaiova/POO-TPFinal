Class {
	#name : #SIUsuarioPlus,
	#superclass : #SIUsuario,
	#category : #'SI-Domain'
}

{ #category : #'as yet unclassified' }
SIUsuarioPlus >> esPlus [ 
	^true.
]

{ #category : #accessing }
SIUsuarioPlus >> estaAlDiaConCuota [
	^true.
]

{ #category : #accessing }
SIUsuarioPlus >> puedePedirAudioLibros [ 
	^ self estaAlDiaConCuota.
]
