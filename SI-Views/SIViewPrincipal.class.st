Class {
	#name : #SIViewPrincipal,
	#superclass : #SIView,
	#instVars : [
		'tfUsuario',
		'tfContraseña',
		'tag'
	],
	#category : #'SI-Views'
}

{ #category : #button }
SIViewPrincipal >> actionAdministrar [
	self addMorph: (SIViewAdministrar interface: iface).
]

{ #category : #initialization }
SIViewPrincipal >> actionIniciarSesion [
	| usuario |
	
	self esUsuarioVacio ifFalse: [
		self esDNIInvalido ifFalse: [ 
			self esContraseñaVacio ifFalse: [
				usuario := iface sys logging: tfUsuario text asInteger password: tfContraseña text.
				usuario ifNil: [ tag bad: 'Usuario o contraseña incorrectos' ] 
					  			ifNotNil: [ tfContraseña accepted. tfUsuario accepted.
										tag clear.
										tfContraseña text: ''.
										iface user: usuario.
										self addMorph: (SIViewUsuario interface: iface)]
						 ]
					]
				].
]

{ #category : #button }
SIViewPrincipal >> actionRegistrarse [
	self addMorph: (SIViewRegistrarUsuario interface: iface).
]

{ #category : #verification }
SIViewPrincipal >> esContraseñaVacio [ 
	tfContraseña text ifEmpty: [ tag bad: 'Ingrese su contraseña'. tfContraseña rejected. ^true ]
						ifNotEmpty: [ tfContraseña accepted. ^false ].
]

{ #category : #verification }
SIViewPrincipal >> esDNIInvalido [
	^tfUsuario text asInteger ifNil: [ tfUsuario rejected. tag bad: 'DNI inválido.'. true] 
							ifNotNil: [ tfUsuario accepted. false ]
]

{ #category : #verification }
SIViewPrincipal >> esUsuarioVacio [ 
	tfUsuario text isEmpty ifTrue: [ tag bad: 'Ingrese su DNI'. tfUsuario rejected. ^true ]
									ifFalse: [ tfUsuario accepted. ^false ]
]

{ #category : #initialization }
SIViewPrincipal >> initializeInterface: aSIInterface [
	super initializeInterface: aSIInterface.
	^self
		addMorph: ( SIColumn new
				addMorph: SIPane new;
				addMorph: (tag := SITag new);
				addMorph: (tfUsuario := SITextField tag: 'DNI');
				addMorph: (tfContraseña := SITextField tag: 'Contraseña');
				addMorph: SIPane new;
				addMorph: (SIRow new
					addMorph: (SIButton label: 'Administrar' target: self message: 'actionAdministrar'); 
					addMorph: SIPane new;
					addMorph: (SIButton label: 'Registrarse' target: self message: 'actionRegistrarse');
					addMorph: (SIButton label: 'Iniciar Sesión' target: self message: 'actionIniciarSesion');
					yourself
				);
				yourself
			);
		yourself	.
]
