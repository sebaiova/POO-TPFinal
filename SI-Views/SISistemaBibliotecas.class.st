Class {
	#name : #SISistemaBibliotecas,
	#superclass : #SIView,
	#instVars : [
		'sistema'
	],
	#category : #'SI-Views'
}

{ #category : #'instance creation' }
SISistemaBibliotecas class >> run [
	^self new initialize: SISistema new.
]

{ #category : #'instance creation' }
SISistemaBibliotecas class >> runPreloaded [
	^self new initialize: SISistemaPreloaded new.
]

{ #category : #initialization }
SISistemaBibliotecas >> initialize: unSistema [
	self initialize.
	sistema := unSistema.
	^self	extent: 800@500;
			addMorph: (SIViewPrincipal sistema: sistema);
			
			openInWindowLabeled: 'Sistema de Bibliotecas';
			yourself.

]
