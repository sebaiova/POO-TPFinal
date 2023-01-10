Class {
	#name : #SIView,
	#superclass : #SIPane,
	#category : #'SI-UIComponents'
}

{ #category : #initialization }
SIView >> initialize [
	super initialize. 			
	^self	layoutPolicy: StackLayout new;
			vResizing: #spaceFill;
			hResizing: #spaceFill;
			yourself.
]
