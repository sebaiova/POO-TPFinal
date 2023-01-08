Class {
	#name : #SIViewUsuarioBibliotecas,
	#superclass : #SIView,
	#category : #'SI-Views'
}

{ #category : #'instance creation' }
SIViewUsuarioBibliotecas class >> new [ 
	self error: 'Usar usuario: en lugar de new'.
]

{ #category : #'instance creation' }
SIViewUsuarioBibliotecas class >> usuario: unUsuario [ 
	^super new initializeUsuario: unUsuario.
]

{ #category : #initialization }
SIViewUsuarioBibliotecas >> initializeUsuario: unUsuario [
	| tabs |
	self initialize.
	self	addMorph: (SIColumn new 
				addMorph: (tabs := SITabs new);
				addMorph: (SIRow new addMorph: (SIButton label: 'Atras' target: self message: #delete); addMorph: SISpacer new)).
				
	unUsuario bibliotecasDeInteres do: [ :biblioteca | tabs addPage: (SIViewUsuarioPedirYDevolver usuario: unUsuario biblioteca: biblioteca) label: biblioteca nombre ].
	tabs selectedPageIndex: 1. 
]
