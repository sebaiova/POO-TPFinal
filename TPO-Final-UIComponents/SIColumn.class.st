Class {
	#name : #SIColumn,
	#superclass : #SILayout,
	#category : #'TPO-Final-UIComponents'
}

{ #category : #initialization }
SIColumn >> initializeOrientation [
	^self 	listDirection: #topToBottom;		
			vResizing: #spaceFill;
			hResizing: #spaceFill;
			yourself.
]
