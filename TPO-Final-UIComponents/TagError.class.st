Class {
	#name : #TagError,
	#superclass : #Tag,
	#category : #'TPO-Final-UIComponents'
}

{ #category : #initialization }
TagError >> initialize [ 
	super initialize.
	^ self contents: '';
		color: Color red;
		yourself.
]
