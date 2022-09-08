package lx.edu.team2.aop;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.aspectj.lang.JoinPoint;

public class InstaAdvice {

	public void beforeExcution(JoinPoint jp) {
		String methodName = jp.getSignature().getName();
		Object[] args = jp.getArgs();
		for(Object obj : args) {
			System.out.println(obj);
		}
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("HH시 mm분 ss초");
		String time = format.format(date);
		System.out.println(methodName + "() beforeExcution, 시간 : " + time);
	}
}
