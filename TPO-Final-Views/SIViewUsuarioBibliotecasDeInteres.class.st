Class {
	#name : #SIViewUsuarioBibliotecasDeInteres,
	#superclass : #SIView,
	#instVars : [
		'outTable',
		'usuario',
		'tag'
	],
	#category : #'TPO-Final-Views'
}

{ #category : #'as yet unclassified' }
SIViewUsuarioBibliotecasDeInteres class >> usuario: unUsuario bibliotecas: lasBibliotecas [ 
	^super new initializeUsuario: unUsuario bibliotecas: lasBibliotecas
]

{ #category : #button }
SIViewUsuarioBibliotecasDeInteres >> actionAceptar [
	outTable elements ifEmpty: [ tag bad: 'Seleccione al menos una biblioteca!']
					ifNotEmpty: [ 
							usuario bibliotecasDeInteres: outTable elements asArray.
							self delete.
						 ]
]

{ #category : #button }
SIViewUsuarioBibliotecasDeInteres >> actionCerrarSesion [ 
	owner delete.
	self delete.
	
]

{ #category : #initialization }
SIViewUsuarioBibliotecasDeInteres >> initializeUsuario: unUsuario bibliotecas: lasBibliotecas [
	| bibliotecasDeInteres |
	self initialize.
	usuario := unUsuario .
	bibliotecasDeInteres := usuario bibliotecasDeInteres.
	^self addMorph: (SIColumn new
			 addMorph: (LabelMorph contents: 'Mueva a la tabla inferior las bibliotecas de su interes');
			 addMorph: (SIDragAndDropTable model: (ModelDragAndDrop array:(lasBibliotecas reject: [ :b | bibliotecasDeInteres includes: b ])) headers: #( Nombre Dirección Teléfono Representante ));
			 addMorph: (outTable := SIDragAndDropTable model: (ModelDragAndDrop array: bibliotecasDeInteres) headers: #( Nombre Dirección Teléfono Representante ));
			 addMorph: (SIRow new
					  addMorph: (SIButton label: 'Cerrar Sesion' target: self message: #actionCerrarSesion);
					  addMorph: SISpacer new;
					  addMorph: (tag := SITag new);
					  addMorph:(SIButton label: 'Aceptar' target: self message: #actionAceptar)))
]
