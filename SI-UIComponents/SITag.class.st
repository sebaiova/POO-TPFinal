Class {
	#name : #SITag,
	#superclass : #LabelMorph,
	#category : #'SI-UIComponents'
}

{ #category : #'as yet unclassified' }
SITag >> bad: aText [
	self contents: aText;
			color: Color red.
]

{ #category : #accessing }
SITag >> clear [ 
	self contents: ''.
]

{ #category : #'as yet unclassified' }
SITag >> good: aText [
	self contents: aText;
			color: Color green.
]

{ #category : #initialization }
SITag >> initialize [
	super initialize.
	^ self
		  contents: '';
		  color: Color red;
		  yourself
]
