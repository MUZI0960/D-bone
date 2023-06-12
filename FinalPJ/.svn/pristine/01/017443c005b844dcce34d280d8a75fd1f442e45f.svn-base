package kr.or.ddit.utils;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.text.WordUtils;

public class CaseConvertingUtils {
	public static String snakeToCamel(String columnName) {
		String capName = WordUtils.capitalizeFully(columnName, '_');
		String rvName = StringUtils.remove(capName, '_');
		String propName = StringUtils.uncapitalize(rvName);
		return propName;
	}
}
