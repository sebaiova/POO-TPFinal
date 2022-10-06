Class {
	#name : #View,
	#superclass : #Pane,
	#instVars : [
		'model'
	],
	#category : #'TPO-Final-UIComponents'
}

{ #category : #adding }
View >> addTitle: title [
	self addMorph: ((Tag newLabel: title) hResizing: #spaceFill; backgroundColor: Color gray darker darker darker).
]

{ #category : #'initialize-release' }
View >> close [
	self delete.
]

{ #category : #initialization }
View >> initialize [
	super initialize. 			
	^self	layoutPolicy: TableLayout new;
			vResizing: #spaceFill;
			hResizing: #spaceFill;
			yourself.
]

{ #category : #accessing }
View >> model [
	^model
]

{ #category : #accessing }
View >> model: aModel [
	model := aModel.
]

{ #category : #accessing }
View >> stack: aMenu [
	owner stack: aMenu.
]
