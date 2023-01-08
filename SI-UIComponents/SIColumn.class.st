Class {
	#name : #SIColumn,
	#superclass : #SILayout,
	#category : #'SI-UIComponents'
}

{ #category : #initialization }
SIColumn >> initializeOrientation [
	^self 	listDirection: #topToBottom;		
			vResizing: #spaceFill;
			hResizing: #spaceFill;
			yourself.
]
