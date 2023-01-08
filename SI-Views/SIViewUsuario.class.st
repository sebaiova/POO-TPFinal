Class {
	#name : #SIViewUsuario,
	#superclass : #SIView,
	#instVars : [
		'usuario',
		'sistema',
		'btnNormal',
		'tag'
	],
	#category : #'SI-Views'
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

{ #category : #button }
SIViewUsuario >> actionPedirYDevolver [
	self addMorph: (SIViewUsuarioBibliotecas usuario: usuario).
]

{ #category : #'as yet unclassified' }
SIViewUsuario >> actionSolicituarNormal [
	(sistema convertirANormal: usuario) ifFalse: [ tag bad: 'Hubo un problema al solicitar dejar de ser Plus.' ]
												ifTrue: [ self delete ].
]

{ #category : #'as yet unclassified' }
SIViewUsuario >> actionSolicituarPlus [
	(sistema convertirAPlus: usuario) ifFalse: [ tag bad: 'Hubo un problema al solicitar el cambio a Plus.' ]
												ifTrue: [ self delete ].
]

{ #category : #initialization }
SIViewUsuario >> initializeUsuario: unUsuario sistema: elSistema [
	| buttonSize btnPlus |
	self initialize.
	usuario := unUsuario.
	sistema := elSistema.
	buttonSize := 200@24.
	 self addMorph: (SIColumn new cellInset: 20;
					 	addMorph: SISpacer new; 
						addMorph: (LabelMorph contents: ('Bienvenido/a ', usuario nombre, '!'));
					 	addMorph: SISpacer new;
						addMorph: ((SIButton label: 'Pedir y Devolver' target: self  message: 'actionPedirYDevolver' ) extent: buttonSize) ;
						addMorph: ((SIButton label: 'Cambiar Bibliotecas de Interes' target: self  message: 'actionCambiarBibliotecasInteres' ) extent: buttonSize);
						addMorph: (btnPlus := (SIButton label: 'Solicitar Usuario Plus' target: self  message: 'actionSolicituarPlus' ) extent: buttonSize);
						addMorph: (btnNormal := (SIButton label: 'Solicitar Usuario Normal' target: self  message: 'actionSolicituarNormal' ) extent: buttonSize); 
						addMorph: (tag := SITag new);
					 	addMorph: SISpacer new; 	
						addMorph: (SIRow new
					  		addMorph: (SIButton label: 'Cerrar Sesion' target: self message: #delete);
					  		addMorph: SISpacer new)).
								
	usuario esPlus ifTrue: [ btnPlus disable ] ifFalse: [  btnNormal disable ].			
									
	usuario bibliotecasDeInteres ifEmpty: [ self addMorph: (SIViewUsuarioBibliotecasDeInteres usuario: usuario bibliotecas: sistema bibliotecas) ].
	^self.
]
