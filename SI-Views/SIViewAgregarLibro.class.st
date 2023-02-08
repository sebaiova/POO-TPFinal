Class {
	#name : #SIViewAgregarLibro,
	#superclass : #SIView,
	#instVars : [
		'tfNombre',
		'tfEditorial',
		'tfAño',
		'lfAutores',
		'cbAudioLibro'
	],
	#category : #'SI-Views'
}

{ #category : #button }
SIViewAgregarLibro >> actionAgregar [
	| model |
	model := iface model .
	model agregar: (self claseDeLibro nombre: tfNombre text editorial: tfEditorial text año: tfAño text autores: (lfAutores elements collect: [ :nombre | SIAutor nombre: nombre ])).
	self delete.

]

{ #category : #button }
SIViewAgregarLibro >> claseDeLibro [
	cbAudioLibro selected ifTrue: [ ^SIAudioLibro  ].
	^SILibro.
]

{ #category : #initialization }
SIViewAgregarLibro >> initializeInterface: aSIInterface [
	super initializeInterface: aSIInterface.
	^self addMorph: (SIColumn new 
				addMorph: SIPane new;
				addMorph: (SIRow new
					addMorph: SIPane new;	
					addMorph: (SIColumn new 
						addMorph: (tfNombre := SITextField tag: 'Nombre');
						addMorph: (tfAño := SITextField tag: 'Año');
						addMorph: (tfEditorial := SITextField tag: 'Editorial');
						addMorph: (SIRow new 
								addMorph: (LabelMorph contents: 'Audio Libro');
								addMorph: (cbAudioLibro := CheckboxButtonMorph new)
							)
						yourself
					);
					addMorph: (SIColumn new 
						addMorph: (LabelMorph contents: 'Autores');
						addMorph: (lfAutores := SIListInput new));
					addMorph: SIPane new;	
					yourself
				);
				addMorph: SIPane new;	
				addMorph: (SIRow new
					addMorph: (SIButton label: 'Atras' target: self message: #delete);
					addMorph: SIPane new;
					addMorph: (SIButton label: 'Agregar' target: self message: #actionAgregar);
					yourself
				));
			yourself
]
