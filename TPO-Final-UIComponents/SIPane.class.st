Class {
	#name : #SIPane,
	#superclass : #PanelMorph,
	#category : #'TPO-Final-UIComponents'
}

{ #category : #initialization }
SIPane >> initialize [ 
	super initialize.
	^self	
			layoutPolicy: TableLayout new;
			color: Color darkGray darker;
			borderColor: self color;
		"	cellPositioning: #center;
			listCentering: #center;
			wrapCentering: #center;"
		"	layoutInset: 4;"
			"cellInset: 4"
		"	listSpacing: 4"
		"	cellSpacing: 4;"
			vResizing: #spaceFill; 
			hResizing: #spaceFill;
			yourself.
]
