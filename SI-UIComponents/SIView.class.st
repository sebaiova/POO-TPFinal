Class {
	#name : #SIView,
	#superclass : #SIPane,
	#instVars : [
		'iface'
	],
	#category : #'SI-UIComponents'
}

{ #category : #'instance creation' }
SIView class >> interface: aSIInterface [ 
	^self new initializeInterface: aSIInterface .
]

{ #category : #initialization }
SIView >> initialize [
	super initialize. 			
	^self	layoutPolicy: StackLayout new;
			vResizing: #spaceFill;
			hResizing: #spaceFill;
			yourself.
]

{ #category : #initialization }
SIView >> initializeInterface: aSIInterface [
	self initialize.
	iface := aSIInterface .	
	^self
]
