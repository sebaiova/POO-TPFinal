Class {
	#name : #ModelAbstract,
	#superclass : #FTSimpleDataSource,
	#category : #'TPO-Final-Models'
}

{ #category : #accessing }
ModelAbstract >> removeAt: row [
	elements removeAt: row.
	self changed: #refresh.
]
