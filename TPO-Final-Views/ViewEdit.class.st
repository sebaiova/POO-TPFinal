Class {
	#name : #ViewEdit,
	#superclass : #TabPage,
	#category : #'TPO-Final-Views'
}

{ #category : #'instance creation' }
ViewEdit class >> new: editable [
	^ self new initialize: editable.
]

{ #category : #button }
ViewEdit >> aceptar [
	self close.
]

{ #category : #button }
ViewEdit >> confirmar [
	model changed: #refresh.
]

{ #category : #initialization }
ViewEdit >> initialize [ 
	super initialize.
	^self	addMorph: (Row new 
							addMorph: (Button new: 'Confirmar' target: self message: #confirmar);
							addMorph: Spacer new;
							yourself);
			yourself .
]
