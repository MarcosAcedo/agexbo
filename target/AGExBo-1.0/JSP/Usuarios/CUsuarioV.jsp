<%-- 
    Document   : CUsuarioV
    Created on : 23-nov-2020, 19:46:28
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
                <nav class="navbar navbar-expand-lg fixed-top">
                    <a class="navbar-brand" href="<%= request.getContextPath() %>/ControladorDirecciones?enviar=Usu&usuario=${usuario}&passwd=${passwd}"><img src="<%= request.getContextPath() %>/images/logo.png" alt=""/></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <p>Expandir</p>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-4">
                            <li class="nav-item dropdown">
                                <a class="nav-link btn" href="<%= request.getContextPath() %>/ControladorDirecciones?enviar=Usu&usuario=${usuario}&passwd=${passwd}">${usuario}</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link btn" href="<%= request.getContextPath() %>/ControladorDirecciones?enviar=CerrarSesion">Cerrar sesion</a>
                            </li>
                        </ul>
                    </div>
                </nav>
                <!--HEADER-->
                <header class="encabezado">
                    <div class="overlay">
                        <div class="container">
                            <div class="header">
                            </div>
                            <!--TEXTO-->
                            <div class="texto">
                                <form method="post" id="formulario" action="<%= request.getContextPath() %>/ControladorDirecciones">
                                <div class="capaExt">
                                    <p class="error" id="error">${error}</p>
                                    <h2 class="h2index">Usuario</h2>
                                        <div class="capaInt">
                                            <input type="text" class="form-control" name="usuario2" id="usuario2" maxlength="20" placeholder="Usuario" required>
                                        </div>
                                    <h2 class="h2index">Contraseña</h2>
                                        <div class="capaInt">
                                            <input type="password" class="form-control" name="passwd2" id="passwd2" maxlength="20" placeholder="Contraseña" required>
                                        </div>
                                    <h2 class="h2index">Rol</h2>
                                        <div class="capaInt">
                                            <select class="form-control" name="rol" id="rol" value="Visitante">
                                                <option value="Visitante">Visitante</option>
                                            </select>
                                        </div>
                                        
                                    <br>
                                    <button type="submit" class="btn btn-outline-success" name="enviar" id="enviar" value="CrearUsuarioV">Crear usuario</button> 
                                    <a class="btn btn-success" href="<%= request.getContextPath() %>">Volver</a>
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