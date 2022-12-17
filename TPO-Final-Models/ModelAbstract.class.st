Class {
	#name : #ModelAbstract,
	#superclass : #FTSimpleDataSource,
	#category : #'TPO-Final-Models'
}

{ #category : #accessing }
ModelAbstract >> at: index [
	^ self elementAt: index.
]

{ #category : #accessing }
ModelAbstract >> removeAt: row [
	elements removeAt: row.
	self changed: #refresh.
]
