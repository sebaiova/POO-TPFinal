Class {
	#name : #SILayout,
	#superclass : #SIPane,
	#category : #'SI-UIComponents'
}

{ #category : #initialization }
SILayout >> initialize [
	super initialize.
	^self 
			cellInset: 4;
			layoutInset: 4;
			reverseTableCells: true;
			listCentering: #center;
			initializeOrientation;
			yourself.
]

{ #category : #initialization }
SILayout >> initializeOrientation [ 
	self subclassResponsibility .
]
