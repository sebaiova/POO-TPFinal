Class {
	#name : #TabPage,
	#superclass : #View,
	#instVars : [
		'parent'
	],
	#category : #'TPO-Final-UIComponents'
}

{ #category : #'initialize-release' }
TabPage >> close [ 
	parent delete.
]

{ #category : #accessing }
TabPage >> parent: aParent [
	parent := aParent.
]
