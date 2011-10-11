package com.cashbuilder.utils

class TextUtils {

	static String abbreviateText(String text, int lineLength){
		if(text.length() > lineLength){
			StringBuilder buffer = new StringBuilder()
			buffer.append(text.substring(0, lineLength-3));
			buffer.append("...")

			return buffer.toString() 
		}
		return text
	}
}
