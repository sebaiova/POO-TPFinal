Class {
	#name : #View,
	#superclass : #Pane,
	#instVars : [
		'model'
	],
	#category : #'TPO-Final-UIComponents'
}

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
View >> model: aModel [
	model := aModel.
]

{ #category : #accessing }
View >> stack: aMenu [
	owner stack: aMenu.
]
