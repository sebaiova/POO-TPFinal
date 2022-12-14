Class {
	#name : #SIViewAdministrar,
	#superclass : #SIView,
	#instVars : [
		'tablaBiblioteca',
		'tablaUsuarios',
		'modelBiblioteca'
	],
	#category : #'SI-Views'
}

{ #category : #button }
SIViewAdministrar >> actionAgregarBiblioteca [
	iface model: tablaBiblioteca model.
	self addMorph: (SIViewAgregarBiblioteca interface: iface).
]

{ #category : #initialization }
SIViewAdministrar >> initializeInterface: aSIInterface [
	| tabs |
	super initializeInterface: aSIInterface.
	modelBiblioteca := (SIModelBibliotecas sistema: iface sys).
	
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
				addMorph: (tablaUsuarios := SITable model: (SIModelUsuarios sistema: iface sys) headers: #(Nombre Apellido DNI))) 
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
	
	tablaUsuarios onDoubleClick: [ :modelIndex | iface user: modelIndex element. self addMorph: (SIViewDetalleUsuario interface: iface) ].
	tablaBiblioteca onDoubleClick: [ :modelIndex | iface modelIndex: modelIndex. self addMorph: (SIViewDetalleBiblioteca interface: iface)].
	^self.

]
