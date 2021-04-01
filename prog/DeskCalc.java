package prog;

import java.io.*;
import ast.*;

public class DeskCalc {

	public static void main(String[] args) {
		Program p = null;

		/* getting the AST from source input */
		try {
			p = (Program) new CalcParser()
				.parse(new CalcScanner(new InputStreamReader(System.in)));
		} catch (Exception e) {
			System.err.println(e.getMessage());
			System.exit(1);
		}

		for (Expr e : p.getExprList()) {
			System.out.println(e.pp());
		}
	}
}
