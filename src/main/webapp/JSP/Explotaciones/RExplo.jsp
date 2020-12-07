<%-- 
    Document   : RExplo
    Created on : 10-nov-2020, 17:54:32
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
                                    <table class="table">
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th scope="col">REGA</th>
                                                    <th scope="col">Nombre</th>
                                                    <th scope="col">Provincia</th>
                                                    <th scope="col">Municipio</th>
                                                    <th scope="col">Usuario</th>
                                                    <th scope="col">Correo</th>
                                                    <th scope="col">Teléfono</th>
                                                 </tr>
                                            </thead>
                                            <tbody>
                                        <c:set var="explotaciones" value="${explotaciones}"></c:set> 
                                        <c:set var="usuar" value="${usuar}"></c:set>         
                                        <c:if test="${explotaciones != null}">
                                        <c:if test="${usuar != null}">
                                            <c:forEach var="ex" items="${explotaciones}">
                                                <c:set var = "REGA" value = "${ex.REGA}" />
                                                <c:set var = "nombre" value = "${ex.nombre}" />
                                                <c:set var = "provincia" value = "${ex.provincia}" />
                                                <c:set var = "municipio" value = "${ex.municipio}" />
                                                <c:set var = "usuario" value = "${ex.usuario}" />  
                                                <c:forEach var="us" items="${usuar}">
                                                    <c:set var = "use" value = "${us.usuarios}" />
                                                        <c:if test="${usuario == use}">
                                                            <c:set var = "email" value = "${us.email}" />
                                                            <c:set var = "tlfno" value = "${us.tlfno}" />
                                                        </c:if>
                                                    </c:forEach>
                                                            <tr>
                                                                <th scope="col">${REGA}</th>
                                                                <th scope="col">${nombre}</th>
                                                                <th scope="col">${provincia}</th>
                                                                <th scope="col">${municipio}</th>
                                                                <th scope="col">${usuario}</th>
                                                                <th scope="col">${email}</th>
                                                                <th scope="col">${tlfno}</th>
                                                            </tr>
                                                </c:forEach>
                                            </c:if>
                                        </c:if>
                                            </tbody>
                                        </table>
                                        <button type="submit" class="btn btn-success" name="enviar" id="enviar" value="Volver">Volver</button>
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