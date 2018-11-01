package com.springtest.ex;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;


public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*Calculation calculation = new Calculation();
		calculation.setFirstNum(10);
		calculation.setSecondNum(2);
		
		calculation.add();
		calculation.sub();
		calculation.mult();
		calculation.div();*/
		
		//스프링 DI가 적용된 것 
		String configLocation ="classpath:applicationCTX.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation); //추상 클래스 생성
		MyCalculator myCalculator = ctx.getBean("myCalculator", MyCalculator.class);
		//MyCalculator.class 타입에서 myCalculator을 가져와서 객체 생성
		myCalculator.add();
		myCalculator.sub();
		myCalculator.mul();
		myCalculator.div();
	}//

}
