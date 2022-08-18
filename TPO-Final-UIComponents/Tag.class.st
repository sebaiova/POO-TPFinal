Class {
	#name : #Tag,
	#superclass : #LabelMorph,
	#category : #'TPO-Final-UIComponents'
}

{ #category : #accessing }
Tag >> clear [
	self contents: ''.
]

{ #category : #initialization }
Tag >> initialize [
	super initialize.
	^self  "layoutPolicy: StackLayout new;"
		layoutInset: 4;
		yourself.
]
