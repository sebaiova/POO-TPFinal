Class {
	#name : #SITabs,
	#superclass : #TabGroupMorph,
	#category : #'SI-UIComponents'
}

{ #category : #adding }
SITabs >> addPage: morph label: label [
	super addPage: morph label: label.
]

{ #category : #initialization }
SITabs >> initialize [
	super initialize.

	^self	
			layoutPolicy: TableLayout new;
			cellPositioning: #center;
			listCentering: #center;
			wrapCentering: #center;
			vResizing: #spaceFill; 
			hResizing: #spaceFill;
			yourself.
]
