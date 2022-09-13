Class {
	#name : #Tabs,
	#superclass : #TabGroupMorph,
	#category : #'TPO-Final-UIComponents'
}

{ #category : #adding }
Tabs >> addPage: morph label: label [
	super addPage: morph label: label.
	morph parent: owner.
]

{ #category : #initialization }
Tabs >> initialize [
	super initialize.
	^self	vResizing: #spaceFill; 
			hResizing: #spaceFill;
			yourself.
]
