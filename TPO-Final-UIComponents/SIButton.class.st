Class {
	#name : #SIButton,
	#superclass : #SimpleButtonMorph,
	#category : #'TPO-Final-UIComponents'
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

{ #category : #initialization }
SIButton >> initializeLabel: aLabel target: aTarget message: aMessage [
	^self label: aLabel;
			target: aTarget;
			actionSelector: aMessage;
			color: Color gray;
			yourself.
	
]
