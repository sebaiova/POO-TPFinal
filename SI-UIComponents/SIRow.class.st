Class {
	#name : #SIRow,
	#superclass : #SILayout,
	#category : #'SI-UIComponents'
}

{ #category : #initialization }
SIRow >> initializeOrientation [
	^self 	listDirection: #leftToRight;		
			vResizing: #shrinkWrap;
			yourself.
]
