//dataSource {
//	pooled = true
//	driverClassName = "org.hsqldb.jdbcDriver"
//	username = "sa"
//	password = ""
//}
dataSource {
	pooled = true
	driverClassName = "oracle.jdbc.driver.OracleDriver"
	url = "jdbc:oracle:thin:@127.0.0.1:1521/XE"
	username = "CASH_BUILDER"
	password = "hj1Br9a"
}
hibernate {
	cache.use_second_level_cache = true
	cache.use_query_cache = true
	cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}

//Backup
//url = "jdbc:oracle:thin:@127.0.0.1:1521/XE"

// environment specific settings
environments {
	development {
		dataSource {
			dbCreate = "update" // one of 'create', 'create-drop','update'
			url = "jdbc:oracle:thin:@127.0.0.1:1521/XE"
		}
	}
	test {
		dataSource {
			dbCreate = "update"
			url = "jdbc:hsqldb:mem:testDb"
		}
	}
	production {
		dataSource {
			dbCreate = "update"
			url = "jdbc:oracle:thin:@127.0.0.1:1521/XE"
		}
	}
}
