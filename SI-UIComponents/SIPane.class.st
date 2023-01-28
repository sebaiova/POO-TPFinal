Class {
	#name : #SIPane,
	#superclass : #PanelMorph,
	#category : #'SI-UIComponents'
}

{ #category : #initialization }
SIPane >> initialize [ 
	super initialize.
	^self	
			layoutPolicy: TableLayout new;
			color: self theme baseColor;
			borderColor: self color;
			vResizing: #spaceFill; 
			hResizing: #spaceFill;
			yourself.
]
