Class {
	#name : #SIViewUsuarioPedirYDevolver,
	#superclass : #SIView,
	#instVars : [
		'outTable',
		'tag',
		'biblioteca',
		'usuario',
		'inTable',
		'btnDevolver',
		'btnPedir'
	],
	#category : #'TPO-Final-Views'
}

{ #category : #'instance creation' }
SIViewUsuarioPedirYDevolver class >> new [
	self error: 'Llamar usuario:biblioteca en lugar de new'
]

{ #category : #'instance creation' }
SIViewUsuarioPedirYDevolver class >> usuario: unUsuario biblioteca: unaBiblioteca [ 
	^super new initializeUsuario: unUsuario biblioteca: unaBiblioteca.
]

{ #category : #button }
SIViewUsuarioPedirYDevolver >> actionDevolverPrestamo [ 
	(biblioteca devolverPrestamo: usuario) ifTrue: [ self prepararPedirPrestamo].
]

{ #category : #button }
SIViewUsuarioPedirYDevolver >> actionPedirPrestamo [ 
	| libros |
	libros := outTable elements.
	libros ifEmpty: [ tag bad: 'Seleccione al menos un Libro!']
					ifNotEmpty: [ 
							(libros size > 5) ifTrue: [ tag bad: 'Máximo 5 libros por préstamo!' ]
													ifFalse: [ 
															(biblioteca registrarPrestamoUsuario: usuario libros: libros) ifTrue: [ self prepararDevolverPrestamo. tag good: 'Prestamo pedido!' ]
																																			ifFalse: [ tag bad: 'Hubo un error al solicitar el prestamo!' ]
															]
													
							]
]

{ #category : #initialization }
SIViewUsuarioPedirYDevolver >> initializeUsuario: unUsuario biblioteca: unaBiblioteca [
	self initialize.
	usuario := unUsuario.
	biblioteca := unaBiblioteca .
	self addMorph: (SIColumn new 
				addMorph: (inTable := SIDragAndDropTable model: (ModelDragAndDrop array: #()) headers: #(Nombre Autores));
				addMorph: (outTable := (SIDragAndDropTable model: (ModelDragAndDrop array: #()) headers: #(Nombre Autores)) extent: 100@140; vResizing: #rigid; yourself);
				addMorph: (SIRow new
					addMorph: SISpacer new;
					addMorph: (tag := SITag new);
					addMorph: ((btnDevolver := SIButton label: 'Devolver Prestamo' target: self message: #actionDevolverPrestamo ));
					addMorph: ((btnPedir := SIButton label: 'Pedir Prestamo' target: self message: #actionPedirPrestamo )
					))
			).
	(biblioteca tienePrestamoActivo: usuario) ifTrue: [ self prepararDevolverPrestamo ]
													ifFalse: [ self prepararPedirPrestamo  ].
	^self.
]

{ #category : #'display protocol' }
SIViewUsuarioPedirYDevolver >> prepararDevolverPrestamo [ 
	inTable disable.
	outTable disable.
	btnPedir disable.
	btnDevolver enable.
	outTable model array: (biblioteca prestamoActivo: usuario) libros.
	inTable model array: biblioteca librosDisponibles.
]

{ #category : #'display protocol' }
SIViewUsuarioPedirYDevolver >> prepararPedirPrestamo [ 
	inTable enable.
	outTable enable.
	btnPedir enable.
	btnDevolver disable.
	outTable model array: #().
	inTable model array: biblioteca librosDisponibles.
]
