package com.cashbuilder

import org.joda.time.DateTime;
import org.joda.time.LocalDateTime;

class LoginService {
	
	static transactional = true
	
	boolean isLoggedInPreviousMonth(Date lasLogin){
		Calendar cal = Calendar.getInstance()
		cal.setTime(lasLogin)
		int lastLoginMonth = cal.get(Calendar.MONTH)
		int currentMonth = DateUtils.currentMonth
		
		return lastLoginMonth < currentMonth
	}

}
