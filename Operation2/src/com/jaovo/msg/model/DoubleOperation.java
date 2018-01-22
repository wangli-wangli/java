package com.jaovo.msg.model;

public class DoubleOperation {
	private static int operationNumber;
	private static double[] result;
    private static String[] question;
    
	public static String[] getQuestion() {
		return question;
	}
	public static void setQuestion(String[] question) {
		DoubleOperation.question = question;
	}
	public int getOperationNumber() {
		return operationNumber;
	}
	public void setOperationNumber(int operationNumber) {
		this.operationNumber = operationNumber;
	}
	public double[] getResult() {
		return result;
	}
	public void setResult(double[] result) {
		this.result = result;
	}
	

}
