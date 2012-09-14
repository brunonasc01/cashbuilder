
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
			url = "jdbc:mysql://127.0.0.1:3306/fazrico"
			username = "admin"
			password = "hj1Br9a"
			properties {
				maxActive = 50
				maxIdle = 25
				minIdle = 5
				initialSize = 5
				minEvictableIdleTimeMillis = 60000
				timeBetweenEvictionRunsMillis = 60000
				maxWait = 10000
				validationQuery = "/* ping */"
			}
		}
	}
}
