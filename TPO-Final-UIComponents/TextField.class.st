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
TextField >> error: aString [
	border color: Color red.
]

{ #category : #initialization }
TextField >> initialize: aTag [
	self initialize.
	^self	layoutPolicy: TableLayout new;
			listDirection: #rightToLeft;
			vResizing: #shrinkWrap;
			width: 280;
			cellInset: 4;
			addMorph: (LabelMorph contents: aTag);
			addMorph: (border := Morph new 
							layoutPolicy: StackLayout new;
							hResizing: #shrinkWrap;
							vResizing: #shrinkWrap;
							layoutInset: 1;
							color: Color gray;
							addMorph: (textField := RubTextFieldMorph new width: 200));
			yourself.
]

{ #category : #accessing }
TextField >> text [ 
	^ textField text string.
]
