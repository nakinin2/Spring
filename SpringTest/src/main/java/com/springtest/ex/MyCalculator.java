package com.springtest.ex;

public class MyCalculator {
	
	public Calculator calculator;
	private int firstNum;
	private int secondNum;
	
	public MyCalculator() {
		
	}
	
	public void add() {
		calculator.addition(firstNum, secondNum);
		
	}
	
	public void sub() {
		calculator.subtraction(firstNum, secondNum);
	}
	
	public void mul() {
		calculator.multiplication(firstNum, secondNum);
	}
	
	public void div() {
		calculator.division(firstNum, secondNum);
	}//
	
	public void setCalculator(Calculator calculator) {
		this.calculator = calculator;
	}
	
	public void setFirstNum(int firstNum) {
		this.firstNum = firstNum;
	}

	public void setSecondNum(int secondNum) {
		this.secondNum = secondNum;
	}
}/* setSecondNum이랑 setFirstNum은 객체 이름을 할 때
	앞에 set을 버리고 다음 시작하는 단어인 대문자를 소문자로 바꿔서 정한다.
	setSecondNum = secondNum
	setFirstNum = firstNum
*/


