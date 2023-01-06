Class {
	#name : #SIViewMain,
	#superclass : #View,
	#instVars : [
		'sistema',
		'tfUsuario',
		'tfContraseña',
		'tagError'
	],
	#category : #'TPO-Final-Views'
}

{ #category : #'instance creation' }
SIViewMain class >> new [
	self error: 'Usar sistema:unSistema en lugar de new.'
]

{ #category : #'instance creation' }
SIViewMain class >> sistema: unSistema [
	^super new initializeSistema: unSistema.
]

{ #category : #button }
SIViewMain >> actionAdministrar [
	self addMorph: (SIViewAdministrar sistema: sistema).
]

{ #category : #button }
SIViewMain >> actionIniciarSesion [
	^nil.
]

{ #category : #button }
SIViewMain >> actionRegistrarse [
	self addMorph: (SIViewRegistrarse sistema: sistema).
]

{ #category : #initialization }
SIViewMain >> initializeSistema: unSistema [
	self initialize.
	sistema := unSistema.
	^self
		addMorph: ( SIColumn new
				addMorph: SISpacer new;
				addMorph: (SITextFieldTagged tag: 'DNI');
				addMorph: (SITextFieldTagged tag: 'Contraseña');
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
