Class {
	#name : #ViewSignIn,
	#superclass : #View,
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

{ #category : #initialization }
ViewSignIn >> initialize [
	super initialize.
	^self	
			addMorph: (Row new 
							addMorph: (Button new: 'Iniciar Sesion');
							addMorph: (Button new: 'Crear Usuario' target: self message: #crearUsuario);
							addMorph: (Button new: 'Administrar' target: self message: #admin);
							addMorph: Spacer new;
							yourself);
			addMorph: Spacer new;
			addMorph: (TextField new: 'Contraseña:');
			addMorph: (TextField new: 'Usuario:');
			addMorph: Spacer new;
			yourself.
]
