Class {
	#name : #SIViewAdministrar,
	#superclass : #SIView,
	#instVars : [
		'tabs',
		'sistema',
		'tablaBiblioteca',
		'tablaUsuarios',
		'modelBiblioteca'
	],
	#category : #'TPO-Final-Views'
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
	self initialize.
	sistema := unSistema.
	modelBiblioteca := (ModelBibliotecas sistema: sistema).
	
	self addMorph: (SIColumn new
			addMorph: (tabs := SITabs new);
			addMorph: (SIRow new
				addMorph: (SIButton label: 'Atras' target: self message: #delete);
				addMorph: SISpacer new;
				yourself
				);
			yourself
			).

	tabs addPage: (tablaUsuarios := SITable model: (ModelUsuarios sistema: sistema) headers: #(Nombre Apellido DNI)) label: 'Usuarios'.
	tabs addPage: ((tablaBiblioteca := SITable model: modelBiblioteca headers: #(Nombre Dirección Teléfono Representante)) 
		addMorphBack: (SIRow new 
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
