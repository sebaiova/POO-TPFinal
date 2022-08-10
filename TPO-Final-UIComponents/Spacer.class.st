Class {
	#name : #Spacer,
	#superclass : #Pane,
	#category : #'TPO-Final-UIComponents'
}

{ #category : #initialization }
Spacer >> initialize [ 
	super initialize.
	^self vResizing: #spaceFill; 
			hResizing: #spaceFill;
			yourself.
]
