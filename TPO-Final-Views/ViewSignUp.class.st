Class {
	#name : #ViewSignUp,
	#superclass : #View,
	#instVars : [
		'tfNombre',
		'tfApellido',
		'tfDNI',
		'tfContraseña',
		'tfContraseña2',
		'tagError'
	],
	#category : #'TPO-Final-Views'
}

{ #category : #button }
ViewSignUp >> crear [
	tfNombre text ifEmpty: [ tfNombre rejected. tagError contents: 'Debe ingresar un nombre.' ] 
	ifNotEmpty: [
			tfNombre accepted.
			tfApellido text ifEmpty: [ tfApellido rejected. tagError contents: 'Debe ingresar un apellido' ] 
			ifNotEmpty: [ 
				tfApellido accepted.
				tfDNI text asInteger ifNil: [ tfDNI rejected. tagError contents: 'DNI inválido.' ] 
				ifNotNil: [
					(model existeUsuario: tfDNI text asInteger) ifTrue: [ tfDNI rejected. tagError contents: 'El DNI ya existe en el sistema.' ] 
					ifFalse: [  
						tfDNI accepted.
					 	tfContraseña text ifEmpty: [ tfContraseña rejected. tagError contents: 'Debe ingresar una contraseña.' ]
							ifNotEmpty: [
							tfContraseña accepted.
							( tfContraseña text ~= tfContraseña2 text) ifTrue: [ tfContraseña2 rejected. tagError contents: 'Las contraseñas no coinciden.' ] 
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
			addMorph: (tfContraseña2	:= TextField new: (Tag contents: 'Repetir Constraseña:'));
			addMorph: (tfContraseña 	:= TextField new: (Tag contents:'Contraseña:'));
			addMorph: (tfDNI 			:= TextField new: (Tag contents:'DNI:'));
			addMorph: (tfApellido 	:= TextField new: (Tag contents:'Apellido:'));		
			addMorph: (tfNombre 		:= TextField new: (Tag contents:'Nombre:'));
			addMorph: (tagError := TagError new);
			addMorph: Spacer new;
			yourself.
]
