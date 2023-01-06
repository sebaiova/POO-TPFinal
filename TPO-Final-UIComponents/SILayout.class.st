Class {
	#name : #SILayout,
	#superclass : #SIPane,
	#category : #'TPO-Final-UIComponents'
}

{ #category : #initialization }
SILayout >> initialize [
	super initialize.
	^self 
			cellInset: 10;
			layoutInset: 4;
			reverseTableCells: true;
		"	cellPositioning: #center;"
			listCentering: #center;
	"		wrapCentering: #center;"
			initializeOrientation;
			yourself.
]

{ #category : #initialization }
SILayout >> initializeOrientation [ 
	self subclassResponsibility .
]
