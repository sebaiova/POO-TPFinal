Class {
	#name : #Row,
	#superclass : #Pane,
	#category : #'TPO-Final-UIComponents'
}

{ #category : #initialization }
Row >> initialize [ 
	super initialize.
	^self layoutPolicy: TableLayout new;
			listDirection: #leftToRight;		
			hResizing: #spaceFill;
			vResizing: #shrinkWrap;
"			layoutInset:10;"
			cellInset: 10;
			yourself.
]
