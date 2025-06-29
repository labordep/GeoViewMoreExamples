Class {
	#name : 'GeoDomainObjectWrapperForGJFeatureProcessData',
	#superclass : 'SmockProcessData',
	#category : 'GeoView-Examples-GeoJSON',
	#package : 'GeoView-Examples-GeoJSON'
}

{ #category : 'processing' }
GeoDomainObjectWrapperForGJFeatureProcessData >> processCreatedData: aKey incoming: aWrapper with: aDShape context: aContext [

	"choosing the good dShape to create depending feature geometry"
	| geometry dShape dText aGJFeature |
	aGJFeature := aWrapper object.
	dShape := aDShape ifNil:[ SmockDCompositeShape new ].
	dShape key: aWrapper key.

	"create geometry"
	geometry := aGJFeature geometry.
	(geometry isKindOf: GJPolygon) ifTrue:[ | coordinates dPolygone |

		"create polygone"		
		dPolygone := SmockDPolygon new.
		dPolygone key: aWrapper key; strokeColor: Color random; strokeWidth: 8.
		coordinates := geometry coordinates first collect:[ :array | ((array at: 2) @ (array at: 1)) asAbsoluteCoordinates ].
		coordinates := coordinates collect: [ :e | self processor projection projLatLonToCart: e ].
		dPolygone points: coordinates.
		dShape addChild: dPolygone.
		
		"create label with county name"
		dText := (SmockDText new key: (aWrapper key asString , '-label')) fillColor: Color black; smockFont: SmockFont defaultFont.
		dText text: ((aWrapper object properties at: 'nom') asString).
		dText coordinates: (coordinates first); setLeft ; isTranslatedByParent: false.
		dShape addChild: dText.
	].

	^ dShape
]

{ #category : 'processing' }
GeoDomainObjectWrapperForGJFeatureProcessData >> processDeletedData: aKey incoming: aWrapper with: aDShape context: aContext [

	^ aDShape
]

{ #category : 'processing' }
GeoDomainObjectWrapperForGJFeatureProcessData >> processUpdatedData: aKey incoming: aWrapper with: aDShape context: aContext [

	^ aDShape
]
