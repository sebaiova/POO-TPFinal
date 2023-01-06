Class {
	#name : #TagError,
	#superclass : #LabelMorph,
	#category : #'TPO-Final-UIComponents'
}

{ #category : #initialization }
TagError >> initialize [ 
	super initialize.
	^ self contents: '';
		color: Color red;
		yourself.
]
