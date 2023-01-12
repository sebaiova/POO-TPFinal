Class {
	#name : #SIViewUsuario,
	#superclass : #SIView,
	#instVars : [
		'btnNormal',
		'tag'
	],
	#category : #'SI-Views'
}

{ #category : #button }
SIViewUsuario >> actionCambiarBibliotecasInteres [
	self addMorph: (SIViewUsuarioBibliotecasDeInteres interface: iface).
]

{ #category : #button }
SIViewUsuario >> actionPedirYDevolver [
	self addMorph: (SIViewUsuarioBibliotecas interface: iface).
]

{ #category : #button }
SIViewUsuario >> actionSolicituarNormal [
	(iface sys convertirANormal: iface user) ifFalse: [ tag bad: 'Hubo un problema al solicitar dejar de ser Plus.' ]
												ifTrue: [ 
													owner addMorph: (SIMessage contents: 'Ha dejado de ser Plus.').
													self delete ].
]

{ #category : #button }
SIViewUsuario >> actionSolicituarPlus [
	(iface sys convertirAPlus: iface user) ifFalse: [ tag bad: 'Hubo un problema al solicitar el cambio a Plus.' ]
												ifTrue: [ 
													owner addMorph: (SIMessage contents: 'Solicitud Plus Aceptada!').
													self delete ].
]

{ #category : #initialization }
SIViewUsuario >> initializeInterface: aSIInterface [
	| buttonSize btnPlus |
	super initializeInterface: aSIInterface.
	buttonSize := 200@24.
	 self addMorph: (SIColumn new cellInset: 20;
					 	addMorph: SISpacer new; 
						addMorph: (LabelMorph contents: ('Bienvenido/a ', iface user nombre, '!'));
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
								
	iface user esPlus ifTrue: [ btnPlus disable ] ifFalse: [  btnNormal disable ].									
	iface user bibliotecasDeInteres ifEmpty: [ self addMorph: (SIViewUsuarioBibliotecasDeInteres interface: iface) ].
	^self.
]
