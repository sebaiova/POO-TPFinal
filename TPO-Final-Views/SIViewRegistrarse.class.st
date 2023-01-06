Class {
	#name : #SIViewRegistrarse,
	#superclass : #View,
	#instVars : [
		'sistema',
		'tfRepetirPass',
		'tfPass',
		'tfDNI',
		'tfApellido',
		'tfNombre',
		'tagError'
	],
	#category : #'TPO-Final-Views'
}

{ #category : #'instance creation' }
SIViewRegistrarse class >> new [
	self error: 'Usar sistema:unSistema en lugar de new.'
]

{ #category : #'instance creation' }
SIViewRegistrarse class >> sistema: unSistema [
	^super new initializeSistema: unSistema.
]

{ #category : #button }
SIViewRegistrarse >> actionRegistrar [
	self esNombreVacio ifFalse: [
		self esApellidoVacio ifFalse: [ 
			self esDNIInvalido ifFalse: [ 
				self existeDNI ifFalse: [
					self esPassVacio ifFalse: [
						self passEquals ifTrue: [ 
								sistema agregarUsuario: tfDNI text asInteger nombre: tfNombre text apellido: tfApellido text password: tfPass text.
								self delete.
								]
							]
						]
					]
				]
			]
]

{ #category : #'as yet unclassified' }
SIViewRegistrarse >> esApellidoVacio [
	^ tfApellido text ifEmpty: [ tfApellido rejected. tagError contents: 'Debe ingresar un apellido'. true ] 
			ifNotEmpty: [ tfApellido accepted. false ]
]

{ #category : #'as yet unclassified' }
SIViewRegistrarse >> esDNIInvalido [
	^tfDNI text asInteger ifNil: [ tfDNI rejected. tagError contents: 'DNI inválido.'. true] 
							ifNotNil: [ tfDNI accepted. false ]
]

{ #category : #'as yet unclassified' }
SIViewRegistrarse >> esNombreVacio [
	^ tfNombre text ifEmpty: [ tfNombre rejected. tagError contents: 'Debe ingresar un nombre.'. true ] 
						 ifNotEmpty: [ tfNombre accepted. false ]
]

{ #category : #'as yet unclassified' }
SIViewRegistrarse >> esPassVacio [
	^tfPass text ifEmpty: [ tfPass rejected. tagError contents: 'Debe ingresar una contraseña.'. true ]
					ifNotEmpty: [ tfPass accepted. false ]
]

{ #category : #'as yet unclassified' }
SIViewRegistrarse >> existeDNI [ 
	^(sistema existeUsuario: tfDNI text asInteger) ifTrue: [ tfDNI rejected. tagError contents: 'El DNI ya existe en el sistema.'. true ] 
																ifFalse: [ tfDNI accepted. false ]
]

{ #category : #initialization }
SIViewRegistrarse >> initializeSistema: unSistema [
	self initialize.
	sistema := unSistema.
	^self
		addMorph: (SIColumn new
			addMorph: SISpacer new;
			addMorph: (tagError 		:= TagError new);
			addMorph: (tfNombre 		:= SITextFieldTagged tag: 'Nombre');
			addMorph: (tfApellido 	:= SITextFieldTagged tag: 'Apellido');		
			addMorph: (tfDNI 			:= SITextFieldTagged tag: 'DNI');
			addMorph: (tfPass 			:= SITextFieldTagged tag: 'Contraseña');
			addMorph: (tfRepetirPass	:= SITextFieldTagged tag: 'Repetir Constraseña');
			addMorph: SISpacer new;
			addMorph: (SIRow new
				addMorph: (SIButton label: 'Atras' target: self message: 'delete' );
				addMorph: (SISpacer new);
				addMorph: (SIButton label: 'Crear Cuenta' target: self message: 'actionRegistrar' );
				yourself );
			yourself);
		yourself .
]

{ #category : #button }
SIViewRegistrarse >> passEquals [ 
	^(tfPass text ~= tfRepetirPass text) ifTrue: [ tfRepetirPass rejected. tagError contents: 'Las contraseñas no coinciden.'. false ] 
												ifFalse: [ tfRepetirPass accepted. true ]. 
]
