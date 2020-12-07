<%-- 
    Document   : UExplo
    Created on : 09-nov-2020, 0:00:37
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
        
        <c:set var="explo" value="${explotaciones}"></c:set>        
        <c:if test="${explo != null}">
            <c:forEach var="r" items="${explo}">
                <c:set var = "rega" value = "${r.REGA}" />
                <c:set var = "provincia" value = "${r.provincia}" />
                <c:set var = "municipio" value = "${r.municipio}" />
                <c:set var = "nombre" value = "${r.nombre}" />
                <c:set var = "usuarioEd" value = "${r.usuario}" />
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
                -->
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
                                        <input type="hidden" class="form-control" name="user" id="user" value="${usuario}">
                                        <input type="hidden" class="form-control" name="pass" id="pass" value="${passwd}">
                                        <input type="hidden" class="form-control" name="rega" id="rega" value="${rega}">
                                    <h1><u>Explotacion ${rega}</u></h1>
                                    <h2 class="h2index">Provincia</h2>
                                        <div class="capaInt">
                                            <input type="text" class="form-control" name="provincia" id="provincia" maxlength="20" placeholder="provincia" value="${provincia}" required>
                                        </div>
                                    <h2 class="h2index">Municipio</h2>
                                        <div class="capaInt">
                                            <input type="text" class="form-control" name="municipio" id="municipio" maxlength="50" placeholder="municipio" value="${municipio}" required>
                                        </div>
                                    <h2 class="h2index">Nombre</h2>
                                        <div class="capaInt">
                                            <input type="text" class="form-control" name="nombre" id="nombre" maxlength="50" placeholder="nombre" value="${nombre}" required>
                                        </div>
                                    <h2 class="h2index">Usuario</h2>
                                        <div class="capaInt">
                                            <select class="form-control" name="usuario2" id="usuario2" value="usuario2">
                                                <option value="${usuarioEd}">${usuarioEd}</option>
                                                
                                                <c:set var="usu" value="${listado}"></c:set>        
                                                <c:if test="${usu != null}">
                                                    <c:forEach var="u" items="${usu}">     
                                                        <c:if test="${u.rol == 'Cliente' || u.rol == 'Admin'}">
                                                            <c:set var = "usuario3" value = "${u.usuarios}" />
                                                            <c:if test="${usuario3 != usuarioEd}">
                                                                <option value="${usuario3}">${usuario3}</option>
                                                            </c:if>
                                                        </c:if>
                                                   </c:forEach>
                                                </c:if>
                                            </select>
                                        </div>
                                        
                                    <br>
                                    <button type="submit" class="btn btn-outline-success" name="enviar" id="enviar" value="ModificarExplotacion">Modificar explotacion</button>
                                    <a class="btn btn-success" href="<%= request.getContextPath() %>/ControladorDirecciones?enviar=Volver&user=${usuario}&pass=${passwd}&rega=${rega}">Volver</a>
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
