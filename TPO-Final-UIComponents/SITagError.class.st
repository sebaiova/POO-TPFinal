Class {
	#name : #SITagError,
	#superclass : #LabelMorph,
	#category : #'TPO-Final-UIComponents'
}

{ #category : #initialization }
SITagError >> initialize [ 
	super initialize.
	^ self contents: '';
		color: Color red;
		yourself.
]
