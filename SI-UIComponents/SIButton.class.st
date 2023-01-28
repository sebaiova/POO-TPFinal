Class {
	#name : #SIButton,
	#superclass : #SimpleButtonMorph,
	#instVars : [
		'disabled'
	],
	#category : #'SI-UIComponents'
}

{ #category : #creation }
SIButton class >> label: aLabel target: aTarget message: messageName [
	^super new initializeLabel: aLabel target: aTarget message: messageName;
		yourself.
	
]

{ #category : #'instance creation' }
SIButton class >> new [
	self error: 'Usar label:target:message: en lugar de new.'
]

{ #category : #protocol }
SIButton >> disable [ 
	self color: self theme baseColor.
	disabled := true.
]

{ #category : #protocol }
SIButton >> enable [ 
	self color: self theme baseColor lighter lighter.
	disabled := false.
]

{ #category : #events }
SIButton >> handleEvent: anEvent [
	disabled ifFalse:[	^anEvent sentTo: self].
]

{ #category : #initialization }
SIButton >> initializeLabel: aLabel target: aTarget message: aMessage [
	^self label: aLabel;
			target: aTarget;
			actionSelector: aMessage;
			enable;
			yourself.
	
]
