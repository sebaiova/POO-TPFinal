Class {
	#name : #SITabs,
	#superclass : #TabGroupMorph,
	#instVars : [
		'onTabChangedBlock'
	],
	#category : #'SI-UIComponents'
}

{ #category : #adding }
SITabs >> addPage: morph label: label [
	super addPage: morph label: label.
]

{ #category : #initialization }
SITabs >> initialize [
	super initialize.
	onTabChangedBlock := [ :index | nil ].
	^self	
			layoutPolicy: TableLayout new;
			cellPositioning: #center;
			listCentering: #center;
			wrapCentering: #center;
			vResizing: #spaceFill; 
			hResizing: #spaceFill;
			yourself.
]

{ #category : #events }
SITabs >> onTabChanged: aBlock [ "[:index | ]"
	onTabChangedBlock := aBlock.
]

{ #category : #page }
SITabs >> updatePageIndex: index [
	onTabChangedBlock value: index.
	^super updatePageIndex: index.
	

]
