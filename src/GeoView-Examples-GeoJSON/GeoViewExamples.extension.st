Extension { #name : 'GeoViewExamples' }

{ #category : '*GeoView-Examples-GeoJSON' }
GeoViewExamples class >> exampleWithGeoJSON [
		
	| geoView layer datas space |
	space := self exampleGeoPositions.
	geoView := space root childWithId: #geoView.
	
	"create GeoJSON map layer"
	layer := GeoViewUtils createDomainObjectsLayer: #GeoJSON.
	layer setProcessData: GeoDomainObjectWrapperForGJFeatureProcessData new forClass: GeoDomainObjectWrapper.
	geoView addLayer: layer beforeIndex: 2. "add the layer between map and cities of the example"

	"add datas"
	datas := (GeoJSONReader fromString: (GeoJSONReaderTest new exampleDepartments)) features.
	1 to: datas size do:[ :i | | country |
		country := (GeoDomainObjectWrapper wrap: (datas at: i)) key: (100 + i).
		geoView addObject: country
	].
]
