package Exceptions;

public class UtenteNonEsistenteException extends Exception {
	private static final long serialVersionUID = 1L;

	//Parameterless Constructor
    public UtenteNonEsistenteException() {}

    //Constructor that accepts a message
    public UtenteNonEsistenteException(String message)
    {
       super(message);
    }
}
