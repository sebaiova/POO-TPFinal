Class {
	#name : #ModelAbstractTable,
	#superclass : #FTSimpleDataSource,
	#instVars : [
		'array'
	],
	#category : #'TPO-Final-Models'
}

{ #category : #accessing }
ModelAbstractTable >> elementAt: anIndex [
	^array at: anIndex.
]

{ #category : #initialization }
ModelAbstractTable >> initialize [ 
	array := Array new.
]

{ #category : #accessing }
ModelAbstractTable >> numberOfRows [ 
	^array size.
]

{ #category : #accessing }
ModelAbstractTable >> remove: object [
	^nil.
]
