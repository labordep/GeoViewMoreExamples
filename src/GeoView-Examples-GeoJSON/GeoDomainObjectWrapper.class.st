"
Incubation of a GeoObjectWrapper class to take an existing domain object and wrap it to use it in GeoView with a key
"
Class {
	#name : 'GeoDomainObjectWrapper',
	#superclass : 'Object',
	#instVars : [
		'key',
		'object'
	],
	#category : 'GeoView-Examples-GeoJSON',
	#package : 'GeoView-Examples-GeoJSON'
}

{ #category : 'constructor' }
GeoDomainObjectWrapper class >> wrap: anObject [ 

	^ self new object: anObject 
]

{ #category : 'accessing' }
GeoDomainObjectWrapper >> key [

	^ key
]

{ #category : 'accessing' }
GeoDomainObjectWrapper >> key: anObject [

	key := anObject
]

{ #category : 'accessing' }
GeoDomainObjectWrapper >> object [

	^ object
]

{ #category : 'accessing' }
GeoDomainObjectWrapper >> object: anObject [

	object := anObject
]
