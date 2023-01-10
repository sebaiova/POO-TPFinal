Class {
	#name : #SIViewAdministrar,
	#superclass : #SIView,
	#instVars : [
		'sistema',
		'tablaBiblioteca',
		'tablaUsuarios',
		'modelBiblioteca'
	],
	#category : #'SI-Views'
}

{ #category : #'instance creation' }
SIViewAdministrar class >> new [ 
	self error: 'Usar sistema: en lugar de new'
]

{ #category : #'instance creation' }
SIViewAdministrar class >> sistema: unSistema [
	^super new initializeSistema: unSistema. 
]

{ #category : #button }
SIViewAdministrar >> actionAgregarBiblioteca [
	self addMorph: (SIViewAgregarBiblioteca model: modelBiblioteca)
]

{ #category : #initialization }
SIViewAdministrar >> initializeSistema: unSistema [
	| tabs |
	self initialize.
	sistema := unSistema.
	modelBiblioteca := (SIModelBibliotecas sistema: sistema).
	
	self addMorph: (SIColumn new
			addMorph: (tabs := SITabs new);
			addMorph: (SIRow new
				addMorph: (SIButton label: 'Atras' target: self message: #delete);
				addMorph: SISpacer new;
				yourself
				);
			yourself
			).
			
	tabs addPage: (SIColumn new 
				addMorph: (SIRow new addMorph: (LabelMorph contents: 'Doble click para Detalles'); addMorph: SISpacer new;
							addMorph: ((self iconNamed: #smallNew) asMorph ); addMorph: (LabelMorph contents: '=  usuario Plus'));		
				addMorph: (tablaUsuarios := SITable model: (SIModelUsuarios sistema: sistema) headers: #(Nombre Apellido DNI))) 
				label: 'Usuarios'.
						
	tabs addPage: (SIColumn new 
		addMorph: (SIRow new addMorph: (LabelMorph contents: 'Doble click para Detalles'); addMorph: SISpacer new);
		addMorph: (tablaBiblioteca := SITable model: modelBiblioteca headers: #(ID Nombre Dirección Teléfono Representante));
		addMorph: (SIRow new 
			addMorph: SISpacer new;
			addMorph: (SIButton label: 'Agregar Biblioteca' target: self message: #actionAgregarBiblioteca);
			yourself
		);
		yourself
	) label: 'Bibliotecas'.	
	tabs selectedPageIndex: 1.
	
	tablaUsuarios onDoubleClick: [ :modelIndex | self addMorph: (SIViewDetalleUsuario modelIndex: modelIndex sistema: sistema) ].
	tablaBiblioteca onDoubleClick: [ :modelIndex | self addMorph: (SIViewDetalleBiblioteca modelIndex: modelIndex)].
	^self.

]
