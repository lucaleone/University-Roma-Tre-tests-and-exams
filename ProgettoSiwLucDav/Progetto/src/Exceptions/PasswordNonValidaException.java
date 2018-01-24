package Exceptions;

public class PasswordNonValidaException extends Exception {
	private static final long serialVersionUID = 1L;

		//Parameterless Constructor
	    public PasswordNonValidaException() {}

	    //Constructor that accepts a message
	    public PasswordNonValidaException(String message)
	    {
	       super(message);
	    }
	}

