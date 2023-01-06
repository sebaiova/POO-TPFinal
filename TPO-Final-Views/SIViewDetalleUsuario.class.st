Class {
	#name : #SIViewDetalleUsuario,
	#superclass : #SIView,
	#instVars : [
		'sistema'
	],
	#category : #'TPO-Final-Views'
}

{ #category : #'instance creation' }
SIViewDetalleUsuario class >> modelIndex: aModelIndex sistema: elSistema [
	^super new initializeModelIndex: aModelIndex sistema: elSistema. 
]

{ #category : #'instance creation' }
SIViewDetalleUsuario class >> new [ 
	self error: 'Usar modelIndex:sistema: en lugar de new'.
]

{ #category : #initialization }
SIViewDetalleUsuario >> initializeModelIndex: aModelIndex sistema: elSistema [
	| usuario tablaPrestamos tablaLibros |
	self initialize.
	usuario := aModelIndex element.
	sistema := elSistema.
	
	self 	addMorph: (SIColumn new 
			addMorph: (LabelMorph new contents: 'Usuario: ', usuario apellido, ', ', usuario nombre, ' - DNI: ', usuario dni asString);
			addMorph: (LabelMorph new contents: 'Prestamos Activos');
			addMorph: (tablaPrestamos := SITable model: (ModelPrestamosUsuario sistema: sistema usuario: usuario) headers: #('Fecha' 'Dias Prestado' 'Cantidad de Libros'));				
			addMorph: (LabelMorph new contents: 'Libros del prestamo');
			addMorph: (tablaLibros := SITable model: FTEasyListDataSource new headers: #(Nombre Año Editorial Autores));		
			addMorph: (SIRow new 	addMorph: (SIButton label: 'Atras' target: self message: #delete);	addMorph: SISpacer new)
		).
		
	tablaPrestamos onClick: [ :modelIndex | tablaLibros model: (ModelLibros prestamo: modelIndex element) ].
	^self.
]