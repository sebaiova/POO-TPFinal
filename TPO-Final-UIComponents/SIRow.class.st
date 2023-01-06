Class {
	#name : #SIRow,
	#superclass : #SILayout,
	#category : #'TPO-Final-UIComponents'
}

{ #category : #initialization }
SIRow >> initializeOrientation [
	^self 	listDirection: #leftToRight;		
			hResizing: #spaceFill;
			vResizing: #shrinkWrap;
			yourself.
]
