class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller: 'categoria', action: 'indice')
		"500"(view:'/error')
	}
}
