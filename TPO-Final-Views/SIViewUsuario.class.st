Class {
	#name : #SIViewUsuario,
	#superclass : #SIView,
	#instVars : [
		'usuario',
		'sistema'
	],
	#category : #'TPO-Final-Views'
}

{ #category : #'instance creation' }
SIViewUsuario class >> new [ 
	self error: 'Usar usuario:sistema: en lugar de new'.
]

{ #category : #'instance creation' }
SIViewUsuario class >> usuario: unUsuario sistema: elSistema [ 
	^super new initializeUsuario: unUsuario sistema: elSistema.
]

{ #category : #button }
SIViewUsuario >> actionCambiarBibliotecasInteres [
	self addMorph: (SIViewUsuarioBibliotecasDeInteres usuario: usuario bibliotecas: sistema bibliotecas).
]

{ #category : #initialization }
SIViewUsuario >> initializeUsuario: unUsuario sistema: elSistema [
	| buttonSize |
	self initialize.
	usuario := unUsuario.
	sistema := elSistema.
	buttonSize := 200@24.
	 self addMorph: (SIColumn new cellInset: 20;
					 	addMorph: SISpacer new; 	
						addMorph: ((SIButton label: 'Pedir y Devolver' target: self  message: 'actionPedirYDevolver' ) extent: buttonSize) ;
						addMorph: ((SIButton label: 'Cambiar Bibliotecas de Interes' target: self  message: 'actionCambiarBibliotecasInteres' ) extent: buttonSize);
						addMorph: ((SIButton label: 'Solicitar Usuario Plus' target: self  message: 'actionSolicituarPlus' ) extent: buttonSize); 
					 	addMorph: SISpacer new; 	
						addMorph: (SIRow new
					  		addMorph: (SIButton label: 'Cerrar Sesion' target: self message: #delete);
					  		addMorph: SISpacer new)).
								
	usuario bibliotecasDeInteres ifEmpty: [ self addMorph: (SIViewUsuarioBibliotecasDeInteres usuario: usuario bibliotecas: sistema bibliotecas) ].
	^self.
]
