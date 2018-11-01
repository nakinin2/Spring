package com.javalec.ex;

public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Calculation calculation = new Calculation();
		calculation.setFirstNum(10);
		calculation.setSecondNum(2);
		
		calculation.add();
		calculation.sub();
		calculation.mult();
		calculation.div(); 
	}

}
