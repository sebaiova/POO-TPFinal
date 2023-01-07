Class {
	#name : #SIViewBibliotecasDeInteres,
	#superclass : #SIView,
	#category : #'TPO-Final-Views'
}

{ #category : #'as yet unclassified' }
SIViewBibliotecasDeInteres class >> usuario: unUsuario bibliotecas: lasBibliotecas [ 
	^super new initializeUsuario: unUsuario bibliotecas: lasBibliotecas
]

{ #category : #initialization }
SIViewBibliotecasDeInteres >> initializeUsuario: unUsuario bibliotecas: lasBibliotecas [
	self initialize.
	self addMorph: (SIColumn new
	
				addMorph: (SITable model: FTEasyListDataSource new headers: #(B) );
				
				addMorph: (SIRow new 
					addMorph: (SIButton label: 'Cerrar Sesion' target: self  message: #delete);
					addMorph: SISpacer new;
					addMorph: (SIButton label: 'Aceptar' target: self message: #actionAceptar)
					)
				).
]
