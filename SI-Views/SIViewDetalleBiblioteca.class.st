Class {
	#name : #SIViewDetalleBiblioteca,
	#superclass : #SIView,
	#instVars : [
		'ftRepresentante',
		'ftDireccion',
		'ftTelefono',
		'tfNombre',
		'modelLibros',
		'modelIndex',
		'tablaLibros'
	],
	#category : #'SI-Views'
}

{ #category : #'instance creation' }
SIViewDetalleBiblioteca class >> modelIndex: aModelIndex [ 
	^super new initializeModelIndex: aModelIndex.
]

{ #category : #'instance creation' }
SIViewDetalleBiblioteca class >> new [ 
	self error: 'No llamar new.'
]

{ #category : #button }
SIViewDetalleBiblioteca >> actionAgregarLibro [
	^self addMorph: (SIViewAgregarLibro model: modelLibros).
]

{ #category : #button }
SIViewDetalleBiblioteca >> actionConfirmarDatos [
	|biblioteca|
	biblioteca := modelIndex element.
	biblioteca nombre: tfNombre text.
	biblioteca telefono: ftTelefono text.
	biblioteca representante: ftRepresentante text.
	biblioteca direccion: ftDireccion text.
	modelIndex elementChanged.
]

{ #category : #'as yet unclassified' }
SIViewDetalleBiblioteca >> actionDarDeBaja [ 
	modelLibros remove: tablaLibros selected.
]

{ #category : #initialization }
SIViewDetalleBiblioteca >> initializeModelIndex: aModelIndex [
 	| biblioteca tabs tablaPrestamos tableLibrosPrestamo |
	
	self initialize;
		addMorph: (SIColumn new 
			addMorph: (tabs := SITabs new);
			addMorph: (SIRow new 
				addMorph: (SIButton label: 'Atras' target: self message: #delete);
				addMorph: SISpacer new;
				yourself
				)).
				
	modelIndex := aModelIndex.
	biblioteca := aModelIndex element.		
	modelLibros := modelIndex model getModelLibros: modelIndex index.
			
	tabs addPage: (SIColumn new
			addMorph: SISpacer new;
			addMorph: (tfNombre := (SITextFieldTagged tag: 'Nombre:') text: biblioteca nombre);
			addMorph: (ftTelefono := (SITextFieldTagged tag: 'Teléfono') text: biblioteca telefono asString);
			addMorph: (ftDireccion := (SITextFieldTagged tag: 'Dirección') text: biblioteca direccion);
			addMorph: (ftRepresentante := (SITextFieldTagged tag: 'Representante') text: biblioteca representante);	
			addMorph: SISpacer new;
			addMorph: (SIButton label: 'Confirmar' target: self message: #actionConfirmarDatos);
			addMorph: SISpacer new
			)
	 	label: 'Datos'.
		
	tabs addPage: (SIColumn new 
			addMorph: (tablaLibros := SITable model: modelLibros headers: #(Titulo Disponible Año Editorial Autores)); 		
			addMorph: (SIRow new 
				addMorph: SISpacer new;
				addMorph: (SIButton label: 'Dar de Baja' target: self message: #actionDarDeBaja); 
				addMorph: (SIButton label: 'Agregar Libro' target: self message: #actionAgregarLibro)
				)
			)
		label: 'Libros'.
			
	tabs addPage: (SIColumn new
		addMorph: (tablaPrestamos := SITable model: (SIModelPrestamosBiblioteca biblioteca: biblioteca) headers: #('Usuario' 'Fecha Inicio' 'Fecha Limite' 'Cantidad de Libros'));
		addMorph: (tableLibrosPrestamo := SITable model: FTEasyListDataSource new headers: #(Titulo Año Editorial Autores))
	
	) label: 'Prestamos'.
	tabs selectedPageIndex: 1.
			
	tablaPrestamos onClick: [ :index | tableLibrosPrestamo model: (SIModelLibros prestamo: index element) ].

	^self
]
