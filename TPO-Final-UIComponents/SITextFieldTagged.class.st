Class {
	#name : #SITextFieldTagged,
	#superclass : #SITextField,
	#category : #'TPO-Final-UIComponents'
}

{ #category : #'instance creation' }
SITextFieldTagged class >> new [ 
	self error: 'Usar tag: en lugar de new'
]

{ #category : #'instance creation' }
SITextFieldTagged class >> tag: aTag [
	^super new initializeTag: aTag;
		yourself.
]

{ #category : #initialization }
SITextFieldTagged >> initializeTag: string [
	self initialize.
	^self	
			addMorph: (LabelMorph contents: string);
			yourself.
]
