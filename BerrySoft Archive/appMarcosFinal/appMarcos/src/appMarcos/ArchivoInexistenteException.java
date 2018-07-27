package appMarcos;

public class ArchivoInexistenteException extends Exception {

    /**
     * Creates a new instance of <code>ArchivoInexistenteException</code>
     * without detail message.
     */
    public ArchivoInexistenteException() {
    }

    /**
     * Constructs an instance of <code>ArchivoInexistenteException</code> with
     * the specified detail message.
     *
     * @param msg the detail message.
     */
    public ArchivoInexistenteException(String msg) {
        super(msg);
    }
}
