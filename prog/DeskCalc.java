package prog;

import java.io.*;
import ast.*;

public class DeskCalc {
	
	public static void main(String[] args) {
		Program p = null;

		try { 
			p = (Program) new CalcParser()
				.parse(new CalcScanner(new InputStreamReader(System.in)));
		}
		catch (Exception e) {
			System.err.println("syntax error");
		}

		for (int i = 0; i < p.getNumExpression(); ++i)
			System.err.printf("[%d] %d\n", i + 1, p.getExpression(i).result());
	}
}

