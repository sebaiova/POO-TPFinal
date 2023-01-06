Class {
	#name : #SISpacer,
	#superclass : #SIPane,
	#category : #'TPO-Final-UIComponents'
}

{ #category : #initialization }
SISpacer >> initialize [ 
	super initialize.
	^self 	
			layoutPolicy: TableLayout new;
			hResizing: #spaceFill;
			vResizing: #spaceFill;
			yourself.
]
