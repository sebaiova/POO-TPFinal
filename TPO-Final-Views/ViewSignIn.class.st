Class {
	#name : #ViewSignIn,
	#superclass : #View,
	#instVars : [
		'tfUsuario',
		'tfContraseña'
	],
	#category : #'TPO-Final-Views'
}

{ #category : #button }
ViewSignIn >> admin [
	self stack: ViewAdmin new. 
]

{ #category : #button }
ViewSignIn >> crearUsuario [
	self stack: (ViewSignUp new model: model).
]

{ #category : #button }
ViewSignIn >> iniciarSesion [
	|user|
	user := model logging: (tfUsuario text) password: (tfContraseña text).
	Transcript show: user; cr.
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
			addMorph: (tfContraseña := TextField new: 'Contraseña:');
			addMorph: (tfUsuario := TextField new: 'Usuario:');
			addMorph: Spacer new;
			yourself.
]
