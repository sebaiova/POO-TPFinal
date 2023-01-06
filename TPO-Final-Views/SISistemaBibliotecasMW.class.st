Class {
	#name : #SISistemaBibliotecasMW,
	#superclass : #View,
	#instVars : [
		'sistema'
	],
	#category : #'TPO-Final-Views'
}

{ #category : #'instance creation' }
SISistemaBibliotecasMW class >> run [
	^self new initialize: Sistema new.
]

{ #category : #'instance creation' }
SISistemaBibliotecasMW class >> runPreloaded [
	^self new initialize: SistemaPreloaded new.
]

{ #category : #initialization }
SISistemaBibliotecasMW >> initialize: unSistema [
	self initialize.
	sistema := unSistema.
	^self	extent: 800@500;
			addMorph: (SIViewMain sistema: sistema);
			
			openInWindowLabeled: 'Sistema de Bibliotecas';
			yourself.

]
