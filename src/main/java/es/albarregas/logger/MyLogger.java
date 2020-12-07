package es.albarregas.logger;

/**
 *
 * @author Jesus
 */
public class MyLogger {

    public static void doLog(Exception excepcion, Class clase, String nivel) {

        System.setProperty("logPath", clase.getSimpleName());
        System.setProperty("projectName", "EquiposDept");

        org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(clase);

        String out = "Línea: " + excepcion.getStackTrace()[0].getLineNumber() + " Causa: " + excepcion;

        switch (nivel) {

            case "fatal":
                logger.fatal(out);
                break;
            case "warn":
                logger.warn(out);
                break;
            case "error":
                logger.error(out);
                break;
            default:
                logger.info(out);
                
        }
        
    }
    
}
