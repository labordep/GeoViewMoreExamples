Extension { #name : 'GeoViewExamples' }

{ #category : '*GeoView-Examples-Bloc-GeoJSON' }
GeoViewExamples class >> exampleWithGeoJSON [
		
	| geoView layer datas space |
	space := self exampleWithGeoPositions.
	geoView := space root childWithId: #geoView.
	
	"create GeoJSON map layer"
	layer := GeoViewUtils createGeoObjectsLayer: #GeoJSON.
	layer setProcessData: GeoObjectWrapperForGJFeatureProcessData new forClass: GeoObjectWrapper.
	geoView addLayerAtFirst: layer.

	"add datas"
	datas := (GeoJSONReader fromString: (GeoJSONReaderTest new exampleDepartments)) features.
	(1 to: datas size) do:[ :i | geoView addObject: ((GeoObjectWrapper wrap: (datas at: i)) key: (100 + i)) ].
]
