Class {
	#name : #SIViewUsuarioBibliotecasDeInteres,
	#superclass : #SIView,
	#instVars : [
		'outTable',
		'tag'
	],
	#category : #'SI-Views'
}

{ #category : #button }
SIViewUsuarioBibliotecasDeInteres >> actionAceptar [
	outTable elements ifEmpty: [ tag bad: 'Seleccione al menos una biblioteca!']
					ifNotEmpty: [ 
							iface user bibliotecasDeInteres: outTable elements asArray.
							self delete.
						 ]
]

{ #category : #button }
SIViewUsuarioBibliotecasDeInteres >> actionCerrarSesion [ 
	owner delete.
	self delete.
	
]

{ #category : #initialization }
SIViewUsuarioBibliotecasDeInteres >> initializeInterface: aSIInterface [
	| bibliotecasDeInteres |
	super initializeInterface: aSIInterface.
	bibliotecasDeInteres := iface user bibliotecasDeInteres.
	^self addMorph: (SIColumn new
			 addMorph: (LabelMorph contents: 'Mueva a la tabla inferior las bibliotecas de su interes');
			 addMorph: (SIDragAndDropTable model: (SIModelDragAndDrop array:(iface sys bibliotecas reject: [ :b | bibliotecasDeInteres includes: b ])) headers: #( Nombre Dirección Teléfono Representante ));
			 addMorph: (outTable := SIDragAndDropTable model: (SIModelDragAndDrop array: bibliotecasDeInteres) headers: #( Nombre Dirección Teléfono Representante ));
			 addMorph: (SIRow new
					  addMorph: (SIButton label: 'Cerrar Sesion' target: self message: #actionCerrarSesion);
					  addMorph: SISpacer new;
					  addMorph: (tag := SITag new);
					  addMorph:(SIButton label: 'Aceptar' target: self message: #actionAceptar)))
]
