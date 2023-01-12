Class {
	#name : #SITabs,
	#superclass : #TabGroupMorph,
	#instVars : [
		'onBlockChangedBlock'
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
	onBlockChangedBlock := [ :index | nil ].
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
	onBlockChangedBlock := aBlock.
]

{ #category : #page }
SITabs >> updatePageIndex: index [
	onBlockChangedBlock value: index.
	^super updatePageIndex: index.
	

]
