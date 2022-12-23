Class {
	#name : #ModelAbstractList,
	#superclass : #FTSimpleDataSource,
	#category : #'TPO-Final-Models'
}

{ #category : #accessing }
ModelAbstractList >> at: index [
	^ self elementAt: index.
]

{ #category : #accessing }
ModelAbstractList >> removeAt: row [
	elements removeAt: row.
	self changed: #refresh.
]
