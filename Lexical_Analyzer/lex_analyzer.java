package lexical_analyzer;


public class lex_analyzer {

	public static void main(String[] args) {
		String expression1 = "sum=(a+5)/2";
		String expression2 = "difference = sum - (b * 5)";
		
		lexRunner(expression1);
		lexRunner(expression2);
		
		System.out.println("\nDone lexically analyzing the expresson(s)!");
	}
	
	/* Formats the expressions and sends them to lex() */
	public static void lexRunner(String expression) {
		char [] tokens = expression.toCharArray();

		System.out.print("Lexically analyzing the expression: ");
		
		for(int i = 0; i < tokens.length; i++)
			System.out.print(tokens[i] + "");
		System.out.println("\n");
		
		lex(tokens);
	}
	 
	
	/* a function to lookup operators and parentheses
	 * and return the token */
	public static int lookup(char ch) {
		int nextToken;
		
		switch(ch) {
		case '=':
			nextToken = tokens.ASSIGN_OP;
			break;
		case '+':
			nextToken = tokens.ADD_OP;
			break;
		case '-':
			nextToken = tokens.SUB_OP;
			break;
		case '*':
			nextToken = tokens.MULT_OP;
			break;
		case '/':
			nextToken = tokens.DIV_OP;
			break;
		case '(':
			nextToken = tokens.LEFT_PAREN;
			break;
		case ')':
			nextToken = tokens.RIGHT_PAREN;
			break;
		default:
			nextToken = tokens.UNIDENTIFIED;
			break;
			
		}
		return nextToken;
	}
	
	
	/* a function to get the next character of
	 * input and determine its character class */
	public static char addChar(char [] token, int i) {
		if(i >= token.length)
			return ' ';
		
		return token[i];
	}
	
	
	/* Returns the character class of the lexeme */
	public static String getChar(char nextChar) {

		String charClass = "";
		
		if(Character.isAlphabetic(nextChar))
			charClass = tokens.LETTER;
		else if(Character.isDigit(nextChar))
			charClass = tokens.DIGIT;
		else
			charClass = tokens.UNKNOWN;
		
		return charClass;
	}

	/* A simple lexical analyzer for arithmetic expressions */
	public static void lex(char [] token) {
		int nextToken = 0;
		int i = 0;
		char nextLexeme = token[i];
		String fullLexeme = "";
		String charClass = "";
	

		while(i < token.length) {
			nextLexeme = token[i];
			
			/* This if statement skips blank characters */
			if(Character.isSpaceChar(nextLexeme)) {
				i++;
				continue;
			}
			
			/* Resetting the fullLexeme string to " " */
			fullLexeme = "";
			
			charClass = getChar(nextLexeme);
			switch(charClass) {
			case "LETTER":
				nextLexeme = token[i];
				charClass = getChar(nextLexeme);
				while (charClass == "LETTER" || charClass == "DIGIT") {
					fullLexeme += addChar(token, i++);
				
					if(token.length <= i)
						break;
					
					nextLexeme = token[i];
					charClass = getChar(nextLexeme);
				}
				--i;
				
				nextToken = tokens.IDENT;
				break;
			case "DIGIT":
				nextLexeme = token[i];
				charClass = getChar(nextLexeme);
				while(charClass == "DIGIT") {
					fullLexeme += addChar(token, i++);
					
					if(token.length <= i)
						break;
					
					nextLexeme = token[i];
					charClass = getChar(nextLexeme);
				}
				--i;
				
				nextToken = tokens.INT_LIT;
				break;
			case "UNKNOWN":
				fullLexeme += nextLexeme;
				nextToken = lookup(nextLexeme);
				break;
			default:
				nextToken = -1;
				break;
			}
			
			System.out.println("Next token is: " + nextToken + "    "
					+ "Next lexeme is: " + fullLexeme);
			
			i++;
		}
		System.out.println();
	}

	
	/* Table of reserved words */
	public static class tokens {
		
		/* Character Classes */
		public static String LETTER = "LETTER";
		public static String DIGIT = "DIGIT";
		public static String UNKNOWN = "UNKNOWN";
		
		/* Token Codes */
		public static int INT_LIT = 10;
		public static int IDENT = 11;
		public static int ASSIGN_OP = 20;
		public static int ADD_OP = 21;
		public static int SUB_OP = 22;
		public static int MULT_OP = 23;
		public static int DIV_OP = 24;
		public static int LEFT_PAREN = 25;
		public static int RIGHT_PAREN = 26;
		public static int UNIDENTIFIED = 99;

	}
}

