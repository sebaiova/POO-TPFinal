Class {
	#name : #SIViewAgregarLibro,
	#superclass : #View,
	#instVars : [
		'tfNombre',
		'tfEditorial',
		'tfAño',
		'lfAutores',
		'modelLibros'
	],
	#category : #'TPO-Final-Views'
}

{ #category : #'instance creation' }
SIViewAgregarLibro class >> model: aModelLibros [
	^super new initializeModel: aModelLibros .
]

{ #category : #'instance creation' }
SIViewAgregarLibro class >> new [ 
	self error: 'Usar model: en lugar de new'
]

{ #category : #button }
SIViewAgregarLibro >> actionAgregar [
	modelLibros add: (Libro nombre: tfNombre text editorial: tfEditorial text año: tfAño text autores: (lfAutores elements collect: [ :nombre | Autor nombre: nombre ])).
	self delete.

]

{ #category : #initialization }
SIViewAgregarLibro >> initializeModel: aModelLibros [
	self initialize.
	modelLibros := aModelLibros.
	^self addMorph: (SIColumn new 
	
				addMorph: SISpacer new;
				addMorph: (SIRow new
					addMorph: SISpacer new;	
					addMorph: (SIColumn new 

						addMorph: (tfNombre := SITextFieldTagged tag: 'Nombre');
						addMorph: (tfAño := SITextFieldTagged tag: 'Año');
						addMorph: (tfEditorial := SITextFieldTagged tag: 'Editorial');
						yourself
					
					);
					addMorph: (lfAutores := SIListInput new);
					addMorph: SISpacer new;	
					yourself
				);
				addMorph: SISpacer new;	
				addMorph: (SIRow new
					addMorph: (SIButton label: 'Atras' target: self message: #delete);
					addMorph: SISpacer new;
					addMorph: (SIButton label: 'Agregar' target: self message: #actionAgregar);
					yourself
				));
			yourself
]
