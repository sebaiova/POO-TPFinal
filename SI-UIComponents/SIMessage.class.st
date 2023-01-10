Class {
	#name : #SIMessage,
	#superclass : #SIView,
	#category : #'SI-UIComponents'
}

{ #category : #accessing }
SIMessage class >> contents: aString [
	^self new initializeContents: aString.
]

{ #category : #initialization }
SIMessage >> initializeContents: aString [
	^self initialize;
			color: (Color black alpha: 0.6);
			addMorph: (SIPane new extent: 256@96; vResizing: #rigid; hResizing: #rigid; borderStyle: BorderStyle raised;
						addMorph: (SIColumn new listCentering: #center; wrapCentering: #center; cellInset: 20;
							addMorph: (LabelMorph contents: aString);
							addMorph: ((SIButton label: 'Ok' target: self message: #delete) extent: 50@24)
			));
		openInWorld;
		yourself. 
]
