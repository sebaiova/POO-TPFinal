Class {
	#name : #SIViewUsuarioBibliotecas,
	#superclass : #SIView,
	#category : #'SI-Views'
}

{ #category : #initialization }
SIViewUsuarioBibliotecas >> initializeInterface: aSIInterface [
	| tabs bibliotecas|
	super initializeInterface: aSIInterface.
	self	addMorph: (SIColumn new 
				addMorph: (tabs := SITabs new);
				addMorph: (SIRow new addMorph: (SIButton label: 'Atras' target: self message: #delete); addMorph: SISpacer new)).
	
	bibliotecas := iface user bibliotecasDeInteres.
	tabs onTabChanged: [ :index | iface lib: ( bibliotecas at: index) ].
	bibliotecas do: [ :biblioteca | iface lib: biblioteca. tabs addPage: (SIViewUsuarioPedirYDevolver interface: iface) label: biblioteca nombre ].
]
