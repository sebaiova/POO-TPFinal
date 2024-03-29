Class {
	#name : #SIViewUsuarioPedirYDevolver,
	#superclass : #SIView,
	#instVars : [
		'outTable',
		'tag',
		'inTable',
		'btnPedir',
		'btnDevolverLibros',
		'btnDevolverAudioLibros',
		'prestamoAudioLibro',
		'prestamoLibro',
		'labelCanasta',
		'lbLeftDays',
		'lbLeftDaysAL'
	],
	#category : #'SI-Views'
}

{ #category : #button }
SIViewUsuarioPedirYDevolver >> actionDevolverAudioLibros [
	(iface lib devolverPrestamoAudioLibros: iface user) ifFalse: [ ^ self ].
	prestamoAudioLibro := nil.
	self refresh.
	tag good: 'Prestamo de Audio Libros devuelto!'
]

{ #category : #button }
SIViewUsuarioPedirYDevolver >> actionDevolverLibros [
	(iface lib devolverPrestamo: iface user) ifFalse: [ ^ self ].
	prestamoLibro := nil.
	self refresh.
	tag good: 'Prestamo devuelto!'
]

{ #category : #button }
SIViewUsuarioPedirYDevolver >> actionPedirPrestamo [ 
	| libros |
	libros := outTable elements.
	libros ifEmpty: [ tag bad: 'Seleccione al menos un Libro!'. ^nil].
	(libros size > 5) ifTrue: [ tag bad: 'Máximo 5 libros por préstamo!'. ^nil ].
	((iface user esPlus) not and: (libros anySatisfy: [ :libro | libro esAudioLibro ])) ifTrue: [ tag bad: 'Debe ser usuario Plus para pedir Audio Libros! '. ^nil ].

	(iface lib registrarPrestamoUsuario: iface user libros: libros) ifTrue: [ self refresh. tag good: 'Prestamo pedido!' ]
																					ifFalse: [ tag bad: 'Hubo un error al solicitar el prestamo!' ].
]

{ #category : #initialization }
SIViewUsuarioPedirYDevolver >> initializeInterface: aSIInterface [
	super initializeInterface: aSIInterface.
	
	self addMorph: (SIColumn new
				addMorph: (LabelMorph contents: 'Libros Disponibles');
				addMorph: (inTable := SIDragAndDropTable model: (SIModelDragAndDrop array: #()) headers: #(Titulo Autores));
				addMorph: (SIRow new
						addMorph: (lbLeftDays := LabelMorph contents: '');
						addMorph: (labelCanasta := LabelMorph contents: 'Canasta');
						addMorph: (lbLeftDaysAL := LabelMorph contents: '')
						);
				addMorph: (outTable := (SIDragAndDropTable model: (SIModelDragAndDrop array: #()) headers: #(Titulo Autores)) extent: 100@140; vResizing: #rigid; yourself);
				addMorph: (SIRow new
					addMorph: SIPane new;
					addMorph: (tag := SITag new);
					addMorph: ((btnDevolverLibros := (SIButton label: 'Devolver Libros' target: self message: #actionDevolverLibros ) disable; yourself));
					addMorph: ((btnDevolverAudioLibros := (SIButton label: 'Devolver Audio Libros' target: self message: #actionDevolverAudioLibros) disable; yourself));
					addMorph: ((btnPedir := SIButton label: 'Pedir Prestamo' target: self message: #actionPedirPrestamo )
					))
			).
	self refresh.										
	^self.
]

{ #category : #'display protocol' }
SIViewUsuarioPedirYDevolver >> prepararDevolverAudioLibros [
	inTable disable.
	outTable disable.
	btnPedir disable.
	btnDevolverAudioLibros enable.
	labelCanasta contents: ' - '.
	lbLeftDaysAL contents: 'Dias restantes para Audio Libros: ', prestamoAudioLibro diasHastaVencimiento asInteger asString.
]

{ #category : #'display protocol' }
SIViewUsuarioPedirYDevolver >> prepararDevolverLibros [
	inTable disable.
	outTable disable.
	btnPedir disable.
	btnDevolverLibros enable.
	labelCanasta contents: ' - '.
	lbLeftDays contents: 'Días Restantes: ', prestamoLibro diasHastaVencimiento asInteger asString.
]

{ #category : #'display protocol' }
SIViewUsuarioPedirYDevolver >> prepararPedirPrestamo [
	inTable enable.
	outTable enable.
	btnPedir enable.
	btnDevolverLibros disable.
	btnDevolverAudioLibros disable.
	lbLeftDays contents: ''.
	lbLeftDaysAL contents: ''.
	labelCanasta contents: 'Canasta'.
]

{ #category : #refresh }
SIViewUsuarioPedirYDevolver >> refresh [
	| libros |
	self prepararPedirPrestamo.
	inTable model array: iface lib librosDisponibles.
	outTable model array: #().
	(iface lib prestamosActivosDe: iface user) do: [ :prestamo | libros := prestamo libros.
																				outTable addAll: libros.
																				(libros first esAudioLibro) ifTrue: [ prestamoAudioLibro := prestamo. self prepararDevolverAudioLibros]
																													ifFalse: [ prestamoLibro := prestamo. self prepararDevolverLibros]].
									
]
