Class {
	#name : #View,
	#superclass : #Pane,
	#instVars : [
		'model'
	],
	#category : #'TPO-Final-UIComponents'
}

{ #category : #'instance creation' }
View class >> new: aModel [
	^self new initialize: aModel.
]

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

{ #category : #initialization }
View >> initialize: aModel [ 
	^self initialize;
		model: aModel;
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
