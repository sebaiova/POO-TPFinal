Class {
	#name : #ViewEdit,
	#superclass : #View,
	#instVars : [
		'object'
	],
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

{ #category : #initialization }
ViewEdit >> initialize [ 
	super initialize.
	^self	addMorph: (Row new 
				addMorph: (Button new: 'Aceptar' target: self message: #aceptar);
				addMorph: Spacer new;
				addMorph: (Button new: 'Cancelar' target: self message: #close)
				);
			yourself .
]

{ #category : #initialization }
ViewEdit >> initialize: editable [
	super initialize.
	object := editable.
]
