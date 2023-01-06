Class {
	#name : #SITextField,
	#superclass : #SIPane,
	#instVars : [
		'border',
		'textField'
	],
	#category : #'TPO-Final-UIComponents'
}

{ #category : #initialization }
SITextField >> accepted [
	border color: Color gray.
]

{ #category : #initialization }
SITextField >> initialize [
	super initialize.
	^self
			vResizing: #shrinkWrap;
			hResizing: #shrinkWrap;
			addMorph: (border := SIPane new 
							vResizing: #shrinkWrap;
							hResizing: #shrinkWrap;
							layoutInset: 1;
							color: Color gray;
							addMorph: (textField := RubTextFieldMorph new width: 200);
							yourself
							);
			yourself.
]

{ #category : #initialization }
SITextField >> rejected [
	border color: Color red.
]

{ #category : #accessing }
SITextField >> text [ 
	^ textField text string.
]

{ #category : #accessing }
SITextField >> text: string [
	textField updateTextWith: string.
]
