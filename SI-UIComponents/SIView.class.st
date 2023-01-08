Class {
	#name : #SIView,
	#superclass : #SIPane,
	#category : #'SI-UIComponents'
}

{ #category : #'instance creation' }
SIView class >> new: aModel [
	^self new initialize: aModel.
]

{ #category : #adding }
SIView >> addTitle: title [
	self addMorph: ((Tag newLabel: title) hResizing: #spaceFill; backgroundColor: Color gray darker darker darker).
]

{ #category : #initialization }
SIView >> initialize [
	super initialize. 			
	^self	layoutPolicy: StackLayout new;
			vResizing: #spaceFill;
			hResizing: #spaceFill;
			yourself.
]
