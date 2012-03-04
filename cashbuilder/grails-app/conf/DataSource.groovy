
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}

// environment specific settings
environments {
	development {
		dataSource {
			pooled = true
			driverClassName = "org.h2.Driver"
			dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:h2:mem:devDb;MVCC=TRUE"
			username = "sa"
			password = ""
		}
	}
	test {
		dataSource {
			pooled = true
			driverClassName = "org.h2.Driver"
			dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE"
			username = "sa"
			password = ""
		}
	}
	production {
		dataSource {
			pooled = true
			dbCreate = "update"
			driverClassName = "com.mysql.jdbc.Driver"
			url = "jdbc:mysql://127.0.0.1:3306/cashbuilder"
			username = "root"
			password = "g40Nf65"
		}
	}
}
