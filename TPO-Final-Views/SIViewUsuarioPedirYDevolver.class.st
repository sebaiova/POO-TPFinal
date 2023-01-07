Class {
	#name : #SIViewUsuarioPedirYDevolver,
	#superclass : #SIView,
	#instVars : [
		'outTable',
		'tag'
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
SIViewUsuarioPedirYDevolver >> actionPedirPrestamo [ 
	| libros |
	libros := outTable elements.
	libros ifEmpty: [ tag bad: 'Seleccione al menos un Libro!']
					ifNotEmpty: [ 
							(libros size > 5) ifTrue: [ tag bad: 'Máximo 5 libros por préstamo!' ]
													ifFalse: [  tag good: 'Prestamo pedido!' ] 
						 ]
]

{ #category : #initialization }
SIViewUsuarioPedirYDevolver >> initializeUsuario: unUsuario biblioteca: unaBiblioteca [
	self initialize.
	^self addMorph: (SIColumn new 
				addMorph: (SIDragAndDropTable model: (ModelDragAndDrop array: unaBiblioteca libros) headers: #(Nombre Autores));
				addMorph: (outTable := (SIDragAndDropTable model: (ModelDragAndDrop array: #()) headers: #(Nombre Autores)) extent: 100@140; vResizing: #rigid; yourself);
				addMorph: (SIRow new
					addMorph: SISpacer new;
					addMorph: (tag := SITag new);
					addMorph: ((SIButton label: 'Devolver Prestamo' target: self message: #actionDevolverPrestamo ) disable );
					addMorph: ((SIButton label: 'Pedir Prestamo' target: self message: #actionPedirPrestamo )
					))
			).
]
