package kr.or.ddit.utils;

import java.lang.reflect.InvocationTargetException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.chrono.IsoEra;
import java.time.format.DateTimeFormatter;
import java.time.temporal.Temporal;
import java.util.Map;
import java.util.Optional;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;
import org.apache.commons.beanutils.converters.AbstractConverter;
import org.apache.commons.lang3.StringUtils;

public class PopulationUtils {
	/**
	 * String 타입 데이터를 TimeStamp 변환할때 패턴("yyyy-MM-dd'T'HH:mm")을 사용하기 위한 유틸리티
	 * @param bean
	 * @param map
	 * @throws IllegalAccessException
	 * @throws InvocationTargetException
	 */
	public static void populate(Object bean, Map<String, ? extends Object> map) throws IllegalAccessException, InvocationTargetException {
//		DateConverter converter = new DateConverter();
//		converter.setPattern("yyyy-MM-dd'T'HH:mm");
		Converter converter = new AbstractConverter() {
			@Override
			protected Class<?> getDefaultType() {
				return Temporal.class;
			}
			
			@Override
			protected <T> T convertToType(Class<T> type, Object value) throws Throwable {
				String str = Optional.ofNullable(value)
									.map(Object::toString)
									.orElse("");
				if(StringUtils.isNotBlank(str)) {
					return (T) type.getDeclaredMethod("parse", CharSequence.class).invoke(null, str);
				}else {
					return null;
				}
			}
		};
		
//		ConvertUtils.register(converter, Timestamp.class);
		ConvertUtils.register(converter, LocalDateTime.class);
		ConvertUtils.register(converter, LocalDate.class);
		BeanUtils.populate(bean, map);
	}
}
