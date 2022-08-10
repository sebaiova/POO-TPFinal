Class {
	#name : #ViewAdmin,
	#superclass : #View,
	#category : #'TPO-Final-Views'
}

{ #category : #initialization }
ViewAdmin >> initialize [ 
	super initialize.
	^self addMorph: (Button new: 'Atras' target: self message: #close);
			addMorph: Spacer new;
		yourself.
]
