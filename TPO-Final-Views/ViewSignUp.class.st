Class {
	#name : #ViewSignUp,
	#superclass : #View,
	#instVars : [
		'tfNombre',
		'tfApellido',
		'tfDNI',
		'tfContraseña',
		'tfContraseña2'
	],
	#category : #'TPO-Final-Views'
}

{ #category : #button }
ViewSignUp >> crear [
	tfNombre text ifEmpty: [ tfNombre error: 'Debe ingresar un nombre.' ] 
	ifNotEmpty: [
			tfNombre accepted.
			tfApellido text ifEmpty: [ tfApellido error: 'Debe ingresar un apellido' ] 
			ifNotEmpty: [ 
				tfApellido accepted.
				tfDNI text asInteger ifNil: [ tfDNI error: 'DNI inválido.' ] 
				ifNotNil: [
					(model existeUsuario: tfDNI text asInteger) ifTrue: [ tfDNI error: 'El DNI ya existe en el sistema.' ] 
					ifFalse: [  
						tfDNI accepted.
					 	tfContraseña text ifEmpty: [ tfContraseña error: 'Debe ingresar una contraseña.' ]
							ifNotEmpty: [
							tfContraseña accepted.
							( tfContraseña text ~= tfContraseña2 text) ifTrue: [ tfContraseña2 error: 'Las contraseñas no coinciden.' ] 
								ifFalse: [ 
								model agregarUsuario: tfDNI text asInteger nombre: tfNombre text apellido: tfApellido text password:  tfContraseña text.
								self close.
								]
							]
						]
					]
				]
			]
]

{ #category : #initialization }
ViewSignUp >> initialize [ 
	super initialize.
	^self addMorph: (Row new 
				addMorph: (Button new: 'Crear' target: self message: #crear);
				addMorph: Spacer new;
				addMorph: (Button new: 'Atras' target: self message: #close)
				);
			addMorph: Spacer new;
			addMorph: (tfContraseña2	:= TextField new: 'Repetir Constraseña:');
			addMorph: (tfContraseña 	:= TextField new: 'Contraseña:');
			addMorph: (tfDNI 			:= TextField new: 'DNI:');
			addMorph: (tfApellido 	:= TextField new: 'Apellido:');		
			addMorph: (tfNombre 		:= TextField new: 'Nombre:');
			addMorph: Spacer new;
			yourself.
]
