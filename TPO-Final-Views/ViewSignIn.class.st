Class {
	#name : #ViewSignIn,
	#superclass : #View,
	#instVars : [
		'tfUsuario',
		'tfContraseña',
		'tagError'
	],
	#category : #'TPO-Final-Views'
}

{ #category : #button }
ViewSignIn >> admin [
	self stack: (ViewAdminUsers new: model usuarios).
]

{ #category : #button }
ViewSignIn >> crearUsuario [
	self stack: (ViewSignUp new model: model).
]

{ #category : #button }
ViewSignIn >> iniciarSesion [
	|user|
	user := model logging: (tfUsuario text asInteger) password: (tfContraseña text).
	user ifNil: [ tagError contents: 'Usuario o contraseña incorrectos!' ]
			ifNotNil: [ tagError clear ].
	^user.
]

{ #category : #initialization }
ViewSignIn >> initialize [
	super initialize.
	^self	
			addMorph: (Row new 
							addMorph: (Button new: 'Iniciar Sesion' target: self message: #iniciarSesion);
							addMorph: (Button new: 'Crear Usuario' target: self message: #crearUsuario);
							addMorph: (Button new: 'Administrar' target: self message: #admin);
							addMorph: Spacer new;
							yourself);
			addMorph: Spacer new;
			addMorph: (tfContraseña := TextField new: (Tag contents: 'Contraseña:'));
			addMorph: (tfUsuario := TextField new: (Tag contents: 'Usuario:'));
			addMorph: (tagError := TagError new);	
			addMorph: Spacer new;
			addTitle: 'Iniciando sesion';
			yourself.
]
