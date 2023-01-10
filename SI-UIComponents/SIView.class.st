Class {
	#name : #SIView,
	#superclass : #SIPane,
	#category : #'SI-UIComponents'
}

{ #category : #'instance creation' }
SIView class >> new: aModel [
	^self new initialize: aModel.
]

{ #category : #initialization }
SIView >> initialize [
	super initialize. 			
	^self	layoutPolicy: StackLayout new;
			vResizing: #spaceFill;
			hResizing: #spaceFill;
			yourself.
]
