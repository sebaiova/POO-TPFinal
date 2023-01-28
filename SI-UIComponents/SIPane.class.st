Class {
	#name : #SIPane,
	#superclass : #Morph,
	#category : #'SI-UIComponents'
}

{ #category : #initialization }
SIPane >> initialize [ 
	super initialize.
	^self	
			layoutPolicy: TableLayout new;
			color: Color darkGray darker;
			borderColor: self color;
			vResizing: #spaceFill; 
			hResizing: #spaceFill;
			yourself.
]
