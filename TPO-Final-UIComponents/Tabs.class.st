Class {
	#name : #Tabs,
	#superclass : #TabGroupMorph,
	#category : #'TPO-Final-UIComponents'
}

{ #category : #adding }
Tabs >> addPage: morph label: label [
	super addPage: morph label: label.
]

{ #category : #initialization }
Tabs >> initialize [
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
