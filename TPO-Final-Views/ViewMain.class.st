Class {
	#name : #ViewMain,
	#superclass : #View,
	#category : #'TPO-Final-Views'
}

{ #category : #initialization }
ViewMain >> initialize [
	super initialize.
	model := SistemaPreloaded new.
	^self	extent: 480@360;
			layoutPolicy: StackLayout new;
			addMorph: (ViewSignIn new model: model);		
			openInWindowLabeled: 'Sistema de Bibliotecas';
			yourself.

]

{ #category : #accessing }
ViewMain >> stack: aMenu [
	self addMorph: aMenu.
]
