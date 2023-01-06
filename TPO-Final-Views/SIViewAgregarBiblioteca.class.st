Class {
	#name : #SIViewAgregarBiblioteca,
	#superclass : #View,
	#instVars : [
		'tfNombre',
		'tfDireccion',
		'tfTelefono',
		'tfRepresentante',
		'modelBibliotecas',
		'tfID'
	],
	#category : #'TPO-Final-Views'
}

{ #category : #'instance creation' }
SIViewAgregarBiblioteca class >> model: aModelLibros [
	^super new initializeModel: aModelLibros .
]

{ #category : #'instance creation' }
SIViewAgregarBiblioteca class >> new [ 
	self error: 'Usar model: en lugar de new'
]

{ #category : #button }
SIViewAgregarBiblioteca >> actionAgregar [
	modelBibliotecas add:(Biblioteca id: tfID text nombre: tfNombre text telefono: tfTelefono text direccion: tfDireccion text representante: tfRepresentante text).
	self delete.

]

{ #category : #initialization }
SIViewAgregarBiblioteca >> initializeModel: aModelBiblioteca [
	self initialize.
	modelBibliotecas := aModelBiblioteca.
	^self addMorph: (SIColumn new 
				addMorph: SISpacer new;
				addMorph: (tfID := SITextFieldTagged tag: 'ID');
				addMorph: (tfNombre := SITextFieldTagged tag: 'Nombre');
				addMorph: (tfDireccion := SITextFieldTagged tag: 'Dirección');
				addMorph: (tfTelefono := SITextFieldTagged tag: 'Teléfono');
				addMorph: (tfRepresentante := SITextFieldTagged tag: 'Representante');		
				addMorph: SISpacer new;			
				addMorph: (SIRow new
					addMorph: (SIButton label: 'Atras' target: self message: #delete);
					addMorph: SISpacer new;
					addMorph: (SIButton label: 'Agregar' target: self message: #actionAgregar);
					yourself
				));
			yourself
]
