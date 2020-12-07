<%-- 
    Document   : CExplo
    Created on : 08-nov-2020, 14:51:16
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
                    <a class="navbar-brand" href="<%= request.getContextPath() %>/ControladorDirecciones?enviar=Usu&usuario=${user}&passwd=${pass}"><img src="<%= request.getContextPath() %>/images/logo.png" alt=""/></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <p>Expandir</p>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-4">
                            <li class="nav-item dropdown">
                                <a class="nav-link btn" href="<%= request.getContextPath() %>/ControladorDirecciones?enviar=Usu&usuario=${user}&passwd=${pass}">${user}</a>
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
                                        <input type="hidden" class="form-control" name="user" id="user" value="${user}">
                                        <input type="hidden" class="form-control" name="pass" id="pass" value="${pass}">
                                    <h2 class="h2index">REGA</h2>
                                        <div class="capaInt">
                                            <input type="text" class="form-control" name="rega" id="rega" maxlength="14" minlength="14" placeholder="XX000000000000" pattern="[A-Za-z]{2}[0-9]{12}" required>
                                        </div>
                                    <h2 class="h2index">Provincia</h2>
                                        <div class="capaInt">
                                            <input type="text" class="form-control" name="provincia" id="provincia" maxlength="20" placeholder="provincia" required>
                                        </div>
                                    <h2 class="h2index">Municipio</h2>
                                        <div class="capaInt">
                                            <input type="text" class="form-control" name="municipio" id="municipio" maxlength="50" placeholder="municipio" required>
                                        </div>
                                    <h2 class="h2index">Nombre</h2>
                                        <div class="capaInt">
                                            <input type="text" class="form-control" name="nombre" id="nombre" maxlength="50" placeholder="nombre" required>
                                        </div>
                                    <h2 class="h2index">Usuario</h2>
                                        <div class="capaInt">
                                            <select class="form-control" name="usuario2" id="usuario2" value="usuario2">
                                                <c:set var="usu" value="${listado}"></c:set>        
                                                <c:if test="${usu != null}">
                                                    <c:forEach var="u" items="${usu}">     
                                                        <c:if test="${u.rol == 'Cliente' || u.rol == 'Admin'}">
                                                            <c:set var = "usuario" value = "${u.usuarios}" />
                                                            <option value="${usuario}">${usuario}</option>
                                                        </c:if>
                                                   </c:forEach>
                                                </c:if>
                                            </select>
                                        </div>
                                        
                                    <br>
                                    <button type="submit" class="btn btn-outline-success" name="enviar" id="enviar" value="CrearExplotacion">Crear explotacion</button> 
                                    <a class="btn btn-success" href="<%= request.getContextPath() %>/ControladorDirecciones?enviar=Volver&user=${user}&pass=${pass}&rega=${rega}">Volver</a>
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