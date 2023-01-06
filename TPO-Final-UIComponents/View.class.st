Class {
	#name : #View,
	#superclass : #Morph,
	#instVars : [
		'model'
	],
	#category : #'TPO-Final-UIComponents'
}

{ #category : #'instance creation' }
View class >> new: aModel [
	^self new initialize: aModel.
]

{ #category : #adding }
View >> addTitle: title [
	self addMorph: ((Tag newLabel: title) hResizing: #spaceFill; backgroundColor: Color gray darker darker darker).
]

{ #category : #initialization }
View >> initialize [
	super initialize. 			
	^self	layoutPolicy: StackLayout new;
			vResizing: #spaceFill;
			hResizing: #spaceFill;
			yourself.
]
