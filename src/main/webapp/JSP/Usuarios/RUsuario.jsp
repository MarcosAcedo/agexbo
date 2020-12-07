<%-- 
    Document   : RUsuario
    Created on : 03-nov-2020, 17:45:57
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
        
        <c:set var = "user" value = "${user}" />
        <c:set var = "pass" value = "${pass}" />
        
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
                                                    <th scope="col">Usuario</th>
                                                    <th scope="col">Rol</th>
                                                    <th scope="col">Nombre</th>
                                                    <th scope="col">DNI</th>
                                                    <th scope="col">Correo electrónico</th>
                                                    <th scope="col">Teléfono</th>
                                                    <th scope="col">Datos</th>
                                                    <th scope="col">Eliminar</th>
                                                    <th scope="col">Cambiar rol</th>
                                                 </tr>
                                            </thead>
                                            <tbody>
                                        <c:set var="listado" value="${listado}"></c:set>        
                                        <c:if test="${listado != null}">
                                            <c:forEach var="us" items="${listado}">
                                                <c:set var = "usuario" value = "${us.usuarios}" />
                                                <c:set var = "rol" value = "${us.rol}" />
                                                <c:set var = "nombre" value = "${us.nombre}" />
                                                <c:set var = "passwd" value = "${us.passwd}" />
                                                <c:set var = "dni" value = "${us.DNI}" />
                                                <c:set var = "email" value = "${us.email}" />
                                                <c:set var = "tlfno" value = "${us.tlfno}" />
                                                <c:set var = "validado" value = "${us.validado}" />
                                                <c:set var = "datos" value = "${us.datos}" />
                                                <tr>
                                                    <th scope="col">${usuario}</th>
                                                    <th scope="col">${rol}</th>
                                                <c:choose>
                                                    <c:when test="${usuario == 'admin'}">
                                                        <th scope="col">-</th>
                                                        <th scope="col">-</th>
                                                        <th scope="col">-</th>
                                                        <th scope="col">-</th>
                                                        <th scope="col">-</th>
                                                    </c:when>
                                                    <c:when test="${validado == 'si'}">
                                                        <th scope="col">${nombre}</th>
                                                        <th scope="col">${dni}</th>
                                                        <th scope="col">${email}</th>
                                                        <th scope="col">${tlfno}</th>
                                                        <th scope="col">${datos}</th>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <th scope="col">-</th>
                                                        <th scope="col">-</th>
                                                        <th scope="col">-</th>
                                                        <th scope="col">-</th>
                                                        <th scope="col">-</th>
                                                    </c:otherwise>
                                                </c:choose>
                                                    <th scope="col">
                                                        <a class="red" href="<%= request.getContextPath() %>/ControladorDirecciones?enviar=BorrarUsuario&usu=${usuario}&user=${user}&pass=${pass}">
                                                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                                <path fill-rule="evenodd" d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5a.5.5 0 0 0-1 0v7a.5.5 0 0 0 1 0v-7z"/>
                                                            </svg>
                                                        </a>
                                                    </th>
                                                    <th scope="col">
                                                        <a class="yellow" href="<%= request.getContextPath() %>/ControladorDirecciones?enviar=RolUsuario&usu=${usuario}&passwd=${passwd}&user=${user}&pass=${pass}">
                                                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-emoji-smile-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                                <path fill-rule="evenodd" d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zM4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683zM10 8c.552 0 1-.672 1-1.5S10.552 5 10 5s-1 .672-1 1.5S9.448 8 10 8z"/>
                                                            </svg>
                                                        </a>
                                                    </th>
                                                </tr>
                                           </c:forEach>
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