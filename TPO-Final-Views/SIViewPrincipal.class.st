Class {
	#name : #SIViewPrincipal,
	#superclass : #SIView,
	#instVars : [
		'sistema',
		'tfUsuario',
		'tfContraseña',
		'tagError'
	],
	#category : #'TPO-Final-Views'
}

{ #category : #'instance creation' }
SIViewPrincipal class >> new [
	self error: 'Usar sistema:unSistema en lugar de new.'
]

{ #category : #'instance creation' }
SIViewPrincipal class >> sistema: unSistema [
	^super new initializeSistema: unSistema.
]

{ #category : #button }
SIViewPrincipal >> actionAdministrar [
	self addMorph: (SIViewAdministrar sistema: sistema).
]

{ #category : #button }
SIViewPrincipal >> actionIniciarSesion [
	| usuario |
	
	self esUsuarioVacio ifFalse: [
		self esDNIInvalido ifFalse: [ 
			self esContraseñaVacio ifFalse: [
				usuario := sistema logging: tfUsuario text asInteger password: tfContraseña text.
				usuario ifNil: [ tagError contents: 'Usuario o contraseña incorrectos' ] 
					  			ifNotNil: [ tfContraseña accepted. tfUsuario accepted.
										tagError contents: ''.
										tfContraseña text: ''.
										self addMorph: ( SIViewUsuario usuario: usuario sistema: sistema)]
						 ]
					]
				].
]

{ #category : #button }
SIViewPrincipal >> actionRegistrarse [
	self addMorph: (SIViewRegistrarUsuario sistema: sistema).
]

{ #category : #'as yet unclassified' }
SIViewPrincipal >> esContraseñaVacio [ 
	tfContraseña text ifEmpty: [ tagError contents: 'Ingrese su contraseña'. tfContraseña rejected. ^true ]
						ifNotEmpty: [ tfContraseña accepted. ^false ].
]

{ #category : #verification }
SIViewPrincipal >> esDNIInvalido [
	^tfUsuario text asInteger ifNil: [ tfUsuario rejected. tagError contents: 'DNI inválido.'. true] 
							ifNotNil: [ tfUsuario accepted. false ]
]

{ #category : #'as yet unclassified' }
SIViewPrincipal >> esUsuarioVacio [ 
	tfUsuario text isEmpty ifTrue: [ tagError contents: 'Ingrese su DNI'. tfUsuario rejected. ^true ]
									ifFalse: [ tfUsuario accepted. ^false ]
]

{ #category : #initialization }
SIViewPrincipal >> initializeSistema: unSistema [
	self initialize.
	sistema := unSistema.
	^self
		addMorph: ( SIColumn new
				addMorph: SISpacer new;
				addMorph: (tagError := SITagError new);
				addMorph: (tfUsuario := SITextFieldTagged tag: 'DNI');
				addMorph: (tfContraseña := SITextFieldTagged tag: 'Contraseña');
				addMorph: SISpacer new;
				addMorph: (SIRow new
					addMorph: (SIButton label: 'Administrar' target: self message: 'actionAdministrar'); 
					addMorph: SISpacer new;
					addMorph: (SIButton label: 'Registrarse' target: self message: 'actionRegistrarse');
					addMorph: (SIButton label: 'Iniciar Sesión' target: self message: 'actionIniciarSesion');
					yourself
				);
				yourself
			);
		yourself	.
]
