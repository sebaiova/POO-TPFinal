Class {
	#name : #SIViewRegistrarUsuario,
	#superclass : #SIView,
	#instVars : [
		'tfRepetirPass',
		'tfPass',
		'tfDNI',
		'tfApellido',
		'tfNombre',
		'tag'
	],
	#category : #'SI-Views'
}

{ #category : #button }
SIViewRegistrarUsuario >> actionRegistrar [
	self esNombreVacio ifFalse: [
		self esApellidoVacio ifFalse: [ 
			self esDNIInvalido ifFalse: [ 
				self existeDNI ifFalse: [
					self esPassVacio ifFalse: [
						self passEquals ifTrue: [ 
								iface sys agregarUsuario: tfDNI text asInteger nombre: tfNombre text apellido: tfApellido text password: tfPass text.
								self delete.
								]
							]
						]
					]
				]
			]
]

{ #category : #verification }
SIViewRegistrarUsuario >> esApellidoVacio [
	^ tfApellido text ifEmpty: [ tfApellido rejected. tag bad: 'Debe ingresar un apellido'. true ] 
			ifNotEmpty: [ tfApellido accepted. false ]
]

{ #category : #verification }
SIViewRegistrarUsuario >> esDNIInvalido [
	^tfDNI text asInteger ifNil: [ tfDNI rejected. tag bad: 'DNI inválido.'. true] 
							ifNotNil: [ tfDNI accepted. false ]
]

{ #category : #verification }
SIViewRegistrarUsuario >> esNombreVacio [
	^ tfNombre text ifEmpty: [ tfNombre rejected. tag bad: 'Debe ingresar un nombre.'. true ] 
						 ifNotEmpty: [ tfNombre accepted. false ]
]

{ #category : #verification }
SIViewRegistrarUsuario >> esPassVacio [
	^tfPass text ifEmpty: [ tfPass rejected. tag bad: 'Debe ingresar una contraseña.'. true ]
					ifNotEmpty: [ tfPass accepted. false ]
]

{ #category : #verification }
SIViewRegistrarUsuario >> existeDNI [ 
	^(iface sys existeDNIUsuario: tfDNI text asInteger) ifTrue: [ tfDNI rejected. tag bad: 'El DNI ya existe en el sistema.'. true ] 
																ifFalse: [ tfDNI accepted. false ]
]

{ #category : #initialization }
SIViewRegistrarUsuario >> initializeInterface: aSIInterface [
	super initializeInterface: aSIInterface.
	^self
		addMorph: (SIColumn new
			addMorph: SIPane new;
			addMorph: (tag 	:= SITag new);
			addMorph: (tfNombre 		:= SITextField tag: 'Nombre');
			addMorph: (tfApellido 	:= SITextField tag: 'Apellido');		
			addMorph: (tfDNI 			:= SITextField tag: 'DNI');
			addMorph: (tfPass 			:= SITextField tag: 'Contraseña');
			addMorph: (tfRepetirPass	:= SITextField tag: 'Repetir Constraseña');
			addMorph: SIPane new;
			addMorph: (SIRow new
				addMorph: (SIButton label: 'Atras' target: self message: 'delete' );
				addMorph: (SIPane new);
				addMorph: (SIButton label: 'Crear Cuenta' target: self message: 'actionRegistrar' );
				yourself );
			yourself);
		yourself .
]

{ #category : #button }
SIViewRegistrarUsuario >> passEquals [ 
	^(tfPass text ~= tfRepetirPass text) ifTrue: [ tfRepetirPass rejected. tag bad: 'Las contraseñas no coinciden.'. false ] 
												ifFalse: [ tfRepetirPass accepted. true ]. 
]
