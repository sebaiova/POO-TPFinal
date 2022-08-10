Class {
	#name : #Pane,
	#superclass : #Morph,
	#category : #'TPO-Final-UIComponents'
}

{ #category : #initialization }
Pane >> initialize [ 
	super initialize.
	^self	
			layoutPolicy: TableLayout new;
			color: Color darkGray darker;
			layoutInset: 4;
			yourself.
]
