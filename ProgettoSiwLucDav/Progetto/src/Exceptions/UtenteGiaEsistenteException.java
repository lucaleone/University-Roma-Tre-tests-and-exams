package Exceptions;

public class UtenteGiaEsistenteException extends Exception {
	private static final long serialVersionUID = 1L;

	//Parameterless Constructor
    public UtenteGiaEsistenteException() {}

    //Constructor that accepts a message
    public UtenteGiaEsistenteException(String message)
    {
       super(message);
    }
}
