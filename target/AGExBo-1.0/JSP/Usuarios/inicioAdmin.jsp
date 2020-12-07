<%-- 
    Document   : inicioAdmin
    Created on : 24-oct-2020, 15:05:35
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
        
        <c:set var="usu" value="${user}"></c:set>        
        <c:if test="${usu != null}">
            <c:forEach var="u" items="${usu}">
                <c:set var = "usuario" value = "${u.usuarios}" />
                <c:set var = "passwd" value = "${u.passwd}" />
           </c:forEach>
        </c:if>
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
                                        <input type="hidden" class="form-control" name="usuario" id="usuario" value="${usuario}">
                                        <input type="hidden" class="form-control" name="passwd" id="passwd" value="${passwd}">
                                    <h1><u>¡Hola ${usuario}!</u></h1>
                                    <h2 class="h2index">Opciones de usuario admin</h2>
                                        <div class="capaInt">
                                            <button type="submit" class="btn btn-success" name="enviar" id="enviar" value="CreateUsuario">Crear Usuario</button>
                                            <button type="submit" class="btn btn-success" name="enviar" id="enviar" value="UpdateUsuario">Editar Administrador</button>
                                            <button type="submit" class="btn btn-success" name="enviar" id="enviar" value="ListarUsuario">Listar Usuario</button>
                                            <br><br>
                                            <button type="submit" class="btn btn-success" name="enviar" id="enviar" value="CreateExplotacion">Crear Explotacion</button>
                                            <button type="submit" class="btn btn-success" name="enviar" id="enviar" value="VerExplotacion">Ver Explotaciones</button>
                                        </div>
                                     <h2 class="h2index">Seleccione una explotacion</h2>
                                        <div class="capaInt">
                                            <p class="error" id="errorREGA">${errorREGA}</p>
                                            <c:set var="exp" value="${explo}"></c:set>
                                            <select class="form-control" id="rega" name="rega">  
                                                <option value="${rega}">${rega}</option>     
                                            <c:if test="${exp != null}">
                                                <c:forEach var="e" items="${exp}">
                                                    <c:set var = "rega" value = "${e.REGA}"/>
                                                        <option value="${rega}">${rega}</option>
                                               </c:forEach>
                                            </c:if>
                                            </select>
                                            <br>
                                            <button type="submit" class="btn btn-success" name="enviar" id="enviar" value="UpdateExplotacion">Editar Explotacion</button>
                                            <button type="submit" class="btn btn-success" name="enviar" id="enviar" value="EliminarExplotacion">Eliminar Explotacion</button>
                                            <br><br>
                                            <button type="submit" class="btn btn-success" name="enviar" id="enviar" value="VerBovinos">Ver bovinos</button>
                                            <button type="submit" class="btn btn-success" name="enviar" id="enviar" value="VerBajas">Ver bajas</button>
                                            <button type="submit" class="btn btn-success" name="enviar" id="enviar" value="VerReposicion">Ver reposicion</button>
                                            <button type="submit" class="btn btn-success" name="enviar" id="enviar" value="VerCebadero">Ver cebadero</button>
                                            <button type="submit" class="btn btn-success" name="enviar" id="enviar" value="ListadoTerneros">Ver terneros</button>
                                        </div>
                                    <a class="btn btn-outline-success" href="<%= request.getContextPath() %>/ControladorDirecciones?enviar=CerrarSesion">Cerrar sesion</a>
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
