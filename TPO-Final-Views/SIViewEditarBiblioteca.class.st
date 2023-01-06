Class {
	#name : #SIViewEditarBiblioteca,
	#superclass : #View,
	#instVars : [
		'ftRepresentante',
		'ftDireccion',
		'ftTelefono',
		'tfNombre',
		'modelLibros',
		'modelIndex',
		'tablaLibros'
	],
	#category : #'TPO-Final-Views'
}

{ #category : #'instance creation' }
SIViewEditarBiblioteca class >> modelIndex: aModelIndex [ 
	^super new initializeModelIndex: aModelIndex.
]

{ #category : #'instance creation' }
SIViewEditarBiblioteca class >> new [ 
	self error: 'No llamar new.'
]

{ #category : #button }
SIViewEditarBiblioteca >> actionAgregarLibro [
	^self addMorph: (SIViewAgregarLibro model: modelLibros).
]

{ #category : #button }
SIViewEditarBiblioteca >> actionConfirmarDatos [
	|biblioteca|
	biblioteca := modelIndex element.
	biblioteca nombre: tfNombre text.
	biblioteca telefono: ftTelefono text.
	biblioteca representante: ftRepresentante text.
	biblioteca direccion: ftDireccion text.
	modelIndex elementChanged.
]

{ #category : #'as yet unclassified' }
SIViewEditarBiblioteca >> actionDarDeBaja [ 
	modelLibros remove: tablaLibros selected.
]

{ #category : #initialization }
SIViewEditarBiblioteca >> initializeModelIndex: aModelIndex [
 	| biblioteca tabs |
	self initialize;
		addMorph: (SIColumn new 
			addMorph: (tabs := Tabs new);
			addMorph: (SIRow new 
				addMorph: (SIButton label: 'Atras' target: self message: #delete);
				addMorph: SISpacer new;
				yourself
				)).
				
	modelIndex := aModelIndex.
	biblioteca := aModelIndex element.		
	modelLibros := modelIndex model getModelLibros: modelIndex index.
			
	tabs addPage: (SIPane new addMorph: (SIColumn new
			addMorph: SISpacer new;
			addMorph: (tfNombre := (SITextFieldTagged tag: 'Nombre:') text: biblioteca nombre);
			addMorph: (ftTelefono := (SITextFieldTagged tag: 'Teléfono') text: biblioteca telefono asString);
			addMorph: (ftDireccion := (SITextFieldTagged tag: 'Dirección') text: biblioteca direccion);
			addMorph: (ftRepresentante := (SITextFieldTagged tag: 'Representante') text: biblioteca representante);	
			addMorph: SISpacer new;
			addMorph: (SIButton label: 'Confirmar' target: self message: #actionConfirmarDatos);
			addMorph: SISpacer new;
			yourself	)
	) 	label: 'Datos'.
		
		
		tabs addPage: (( tablaLibros := SITable model: modelLibros headers: #(Nombre Estado Año Editorial Autores)) 		
			addMorphBack: (SIRow new 
				addMorph: SISpacer new;
				addMorph: (SIButton label: 'Dar de Baja' target: self message: #actionDarDeBaja); 
				addMorph: (SIButton label: 'Agregar Libro' target: self message: #actionAgregarLibro); 
				yourself)
			yourself
			)
		label: 'Libros'.
		
				
	
			
	"	tablaLibros addMorphBack: (SIButton label: 'Agregar Libro' target: self message: #actionAgregarLibro)."
		
		
"	tabs addPage: (SIColumn new  
""			addMorph: (tablaLibros := SITable model: modelLibros headers: #(Nombre Estado Año Editorial Autores));""
			addMorph: (SIButton label: 'Agregar Libro' target: self message: #actionAgregarLibro);
						addMorph: (SIButton label: 'Agregar Libro' target: self message: #actionAgregarLibro);
			yourself) 
	 	label: 'Libros'.	"
			
	tabs addPage: (TabPage new) label: 'Prestamos'.
	tabs selectedPageIndex: 1.

"	tablaLibros addDependency: biblioteca."

	^self
]
