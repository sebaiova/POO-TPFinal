Class {
	#name : #SISistemaBibliotecas,
	#superclass : #SIView,
	#category : #'SI-Views'
}

{ #category : #'instance creation' }
SISistemaBibliotecas class >> run [
	^self new initializeInterface: (SIInterface sistema: SISistema new).
]

{ #category : #'instance creation' }
SISistemaBibliotecas class >> runPreloaded [
		^self new initializeInterface: (SIInterface sistema: SISistemaPreCargado new).
]

{ #category : #initialization }
SISistemaBibliotecas >> initializeInterface: aSIInterface [
	super initializeInterface: aSIInterface.
	^self	extent: 800@500;
			addMorph: (SIViewPrincipal interface: iface);
			
			openInWindowLabeled: 'Sistema de Bibliotecas';
			yourself.

]
