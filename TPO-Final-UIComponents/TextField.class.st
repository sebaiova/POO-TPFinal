Class {
	#name : #TextField,
	#superclass : #Pane,
	#instVars : [
		'border',
		'textField'
	],
	#category : #'TPO-Final-UIComponents'
}

{ #category : #'instance creation' }
TextField class >> new: aTag [
	^self new initialize: aTag;
		yourself.
]

{ #category : #initialization }
TextField >> accepted [
	border color: Color gray.
]

{ #category : #initialization }
TextField >> initialize: string [
	self initialize.
	^self	layoutPolicy: TableLayout new;
			listDirection: #rightToLeft;
			vResizing: #shrinkWrap;
			width: 280;
			cellInset: 4;
			addMorph: (Tag contents: string);
			addMorph: (border := Morph new 
							layoutPolicy: StackLayout new;
							hResizing: #shrinkWrap;
							vResizing: #shrinkWrap;
							layoutInset: 1;
							color: Color gray;
							addMorph: (textField := RubTextFieldMorph new width: 200));
			yourself.
]

{ #category : #initialization }
TextField >> rejected [
	border color: Color red.
]

{ #category : #accessing }
TextField >> text [ 
	^ textField text string.
]

{ #category : #accessing }
TextField >> text: string [
	textField updateTextWith: string.
]
