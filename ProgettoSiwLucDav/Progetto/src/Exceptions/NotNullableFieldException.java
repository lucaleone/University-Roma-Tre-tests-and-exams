package Exceptions;

public class NotNullableFieldException extends Exception {
	
	private static final long serialVersionUID = 1L;

	//Parameterless Constructor
    public NotNullableFieldException(){}

    //Constructor that accepts a message
    public NotNullableFieldException(String message)
    {
       super(message);
    }

}
