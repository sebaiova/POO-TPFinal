Class {
	#name : #SIViewDetalleUsuario,
	#superclass : #SIView,
	#category : #'SI-Views'
}

{ #category : #initialization }
SIViewDetalleUsuario >> initializeInterface: aSIInterface [
	|tablaPrestamos tablaLibros |
	super initializeInterface: aSIInterface.
	
	self 	addMorph: (SIColumn new
				addMorph: (SIRow new addMorph: ((self iconNamed: (iface user esPlus ifTrue: [ #smallNew ] ifFalse: [ #user ])) asMorph);
				addMorph: (LabelMorph new contents: 'Usuario: ', iface user apellido, ', ', iface user nombre, ' - DNI: ', iface user dni asString));
			addMorph: (LabelMorph new contents: 'Prestamos Activos');
			addMorph: (tablaPrestamos := SITable model: (SIModelPrestamosUsuario interface: iface) headers: #('Fecha Inicio' 'Fecha Limite' 'Cantidad de Libros'));				
			addMorph: (LabelMorph new contents: 'Libros del prestamo');
			addMorph: (tablaLibros := SITable model: FTEasyListDataSource new headers: #(Titulo Año Editorial Autores));		
			addMorph: (SIRow new 	addMorph: (SIButton label: 'Atras' target: self message: #delete);	addMorph: SIPane new)
		).
		
	tablaPrestamos onClick: [ :modelIndex | iface loan: modelIndex element. tablaLibros model: (SIModelLibrosPrestamo interface: iface) ].
	^self.
]
