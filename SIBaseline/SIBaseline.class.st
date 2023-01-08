Class {
	#name : #SIBaseline,
	#superclass : #BaselineOf,
	#category : #SIBaseline
}

{ #category : #baselines }
SIBaseline >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"The main code of the baseline will go here"
			spec 
				package: 'SI-Domain';
				package: 'SI-Models';
				package: 'SI-Views';
				package: 'SI-UIComponents'
		]
]

{ #category : #accessing }
SIBaseline >> projectClass [
	^ MetacelloCypressBaselineProject
]
