<%-- 
    Document   : index.jsp
    Created on : 09-jun-2020, 17:36:29
    Author     : Markitos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/estilos.css">
        <link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/CSS/bootstrap.min.css">
        <link rel="stylesheet" type="text/inc" href="<%= request.getContextPath() %>/INC/metas.inc">
        
        <title>AGExBo</title>
    </head>
    <body>
            <div class="container-fluid text-center">
                
                <!--NAVBAR
                <nav class="navbar navbar-expand-lg fixed-top">
                <a class="navbar-brand" href="<%= request.getContextPath() %>/index.jsp">Inicio</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <p>Expandir</p>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-4">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Vistas</a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                    <a class="dropdown-item" data-value="Vista"  href="<%= request.getContextPath() %>/ControladorDireccionesCRUD?enviar=VistasA">Vista alumno</a>
                                    <a class="dropdown-item" data-value="Vista"  href="<%= request.getContextPath() %>/ControladorDireccionesCRUD?enviar=VistasE">Vista equipos</a>
                                    <a class="dropdown-item" data-value="Vista"  href="<%= request.getContextPath() %>/ControladorDireccionesCRUD?enviar=VistasG">Vista grupos</a>
                                    <a class="dropdown-item" data-value="Vista"  href="<%= request.getContextPath() %>/ControladorDireccionesCRUD?enviar=VistasAEq">Vista alumnos y equipos</a>
                                    <a class="dropdown-item" data-value="Vista"  href="<%= request.getContextPath() %>/ControladorDireccionesCRUD?enviar=VistasAE">Vista alumnos por equipos</a>
                                    <a class="dropdown-item" data-value="Vista"  href="<%= request.getContextPath() %>/ControladorDireccionesCRUD?enviar=VistasAG">Vista alumnos por grupo</a>
                                    <a class="dropdown-item" data-value="Vista"  href="<%= request.getContextPath() %>/ControladorDireccionesCRUD?enviar=VistasAnoE">Vista alumnos sin equipos</a>
                                    <a class="dropdown-item" data-value="Vista"  href="<%= request.getContextPath() %>/ControladorDireccionesCRUD?enviar=VistasEnoA">Vista equipo sin alumno</a>
                                    <a class="dropdown-item" data-value="Vista"  href="<%= request.getContextPath() %>/ControladorDireccionesCRUD?enviar=VistasAll">Vista todos los datos</a>
                                    <a class="dropdown-item" data-value="Vista"  href="<%= request.getContextPath() %>/ControladorDireccionesCRUD?enviar=VistasAjax">Vista alumnos con ajax</a>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Alumnos</a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                    <a class="dropdown-item" data-value="Alumnos" href="<%= request.getContextPath() %>/ControladorDireccionesCRUD?enviar=AlumnoC">Crear alumnos</a>
                                        <div class="btn-group dropright">
                                            <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                              Dropright
                                            </button>
                                            <div class="dropdown-menu">
                                                <a class="dropdown-item" data-value="Alumnos" href="<%= request.getContextPath() %>/ControladorDireccionesCRUD?enviar=AlumnoU">Modificar alumnos</a>
                                            </div>
                                        </div>
                                    <a class="dropdown-item" data-value="Alumnos" href="<%= request.getContextPath() %>/ControladorDireccionesCRUD?enviar=AlumnoR">Visualizar alumnos</a>
                                    <a class="dropdown-item" data-value="Alumnos" href="<%= request.getContextPath() %>/ControladorDireccionesCRUD?enviar=AlumnoU">Modificar alumnos</a>
                                    <a class="dropdown-item" data-value="Alumnos" href="<%= request.getContextPath() %>/ControladorDireccionesCRUD?enviar=AlumnoD">Eliminar alumnos</a>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Equipos</a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                    <a class="dropdown-item" data-value="Equipos" href="<%= request.getContextPath() %>/ControladorDireccionesCRUD?enviar=EquipoC">Crear equipos</a>
                                    <a class="dropdown-item" data-value="Equipos" href="<%= request.getContextPath() %>/ControladorDireccionesCRUD?enviar=EquipoR">Visualizar equipos</a>
                                    <a class="dropdown-item" data-value="Equipos" href="<%= request.getContextPath() %>/ControladorDireccionesCRUD?enviar=EquipoU">Modificar equipos</a>
                                    <a class="dropdown-item" data-value="Equipos" href="<%= request.getContextPath() %>/ControladorDireccionesCRUD?enviar=EquipoD">Eliminar equipos</a>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Grupos</a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                    <a class="dropdown-item" data-value="Grupos" href="<%= request.getContextPath() %>/ControladorDireccionesCRUD?enviar=GrupoC">Crear grupos</a>
                                    <a class="dropdown-item" data-value="Grupos" href="<%= request.getContextPath() %>/ControladorDireccionesCRUD?enviar=GrupoR">Visualizar grupos</a>
                                    <a class="dropdown-item" data-value="Grupos" href="<%= request.getContextPath() %>/ControladorDireccionesCRUD?enviar=GrupoU">Modificar grupos</a>
                                    <a class="dropdown-item" data-value="Grupos" href="<%= request.getContextPath() %>/ControladorDireccionesCRUD?enviar=GrupoD">Eliminar grupos</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
                -->
                <!--HEADER-->
                <header class="encabezado">
                    <div class="overlay">
                        <div class="container">
                            <div class="header">
                                <h1 class="display-1"><b><u> </u></b></h1>
                            </div>
                            <!--TEXTO-->
                            <div class="texto">
                                <form method="post" id="formulario" action="<%= request.getContextPath() %>/ControladorDirecciones">
                                <div class="capaExt">
                                    <p class="error" id="error">${error}</p>
                                    <h2 class="h2index">Usuario:</h2>
                                        <div class="capaInt">
                                            <input type="text" name="usuario" id="usuario" class="form-control" required maxlength="20" placeholder="Introduzca el nombre de Usuario">
                                        </div>
                                    <h2 class="h2index">Contraseña:</h2>
                                        <div class="capaInt">
                                            <input type="password" name="passwd" id="passwd" class="form-control" required maxlength="20" placeholder="Introduzca la contraseña">
                                        </div>
                                    <p>Si no tienes una cuenta solicitala en el correo agexbo@gmail.com o <a href="<%= request.getContextPath() %>/ControladorDirecciones?enviar=CreateUsuarioV">crea una cuenta de visitante</a></p>
                                    <br>
                                    <button type="submit" class="btn btn-outline-success" name="enviar" id="enviar" value="Usuario">Iniciar sesion</button> 
                                </div>
                                </form>
                            </div>
                            <!-- FOOTER -->
                            <footer class="page-footer">
                                <div class="footer-copyright text-center">
                                    <div class="footer-img"><img src="images/logoGrande.png" alt=""/></div>
                                    <p><u>&copy; Copyright </u> <br> Marcos Acedo Mejías <br> AGExBo (Aplicación para la GEstión de EXplotaciones Bovinas) - Mérida, Badajoz <br> Contacto: agexbo@gmail.com <br> DAW - 2019/2020</p>
                                </div>
                            </footer>
                            <br>
                        </div>
                    </div>
                </header>
                
        </div>
    <script src="<%= request.getContextPath() %>/JS/jquery-3.4.1.min.js"></script>
    <script src="<%= request.getContextPath() %>/JS/popper.min.js"></script>     
    <script src="<%= request.getContextPath() %>/JS/bootstrap.min.js"></script>
    </body>
</html>
