Class {
	#name : #Button,
	#superclass : #SimpleButtonMorph,
	#category : #'TPO-Final-UIComponents'
}

{ #category : #creation }
Button class >> new: aLabel [
	^self new
		initialize: aLabel ;
		yourself.
	
]

{ #category : #creation }
Button class >> new: aLabel target: aTarget message: messageName [
	^self new
		initialize: aLabel target: aTarget message: messageName;
		yourself.
	
]

{ #category : #initialization }
Button >> initialize: aLabel [
	^self initialize;
			label: aLabel;
			color: Color gray;
			yourself.
	
]

{ #category : #initialization }
Button >> initialize: aLabel target: aTarget message: aMessage [
	^self initialize: aLabel;
			target: aTarget;
			actionSelector: aMessage;
			yourself.
	
]
