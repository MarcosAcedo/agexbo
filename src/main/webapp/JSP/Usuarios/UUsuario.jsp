<%-- 
    Document   : CUsuario
    Created on : 25-oct-2020, 14:49:53
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
                <c:set var = "rol" value = "${u.rol}" />
                <c:set var = "passwd" value = "${u.passwd}" />
                <c:set var = "Oldpasswd" value = "${u.passwd}" />
                <c:set var = "nombre" value = "${u.nombre}" />
                <c:set var = "dni" value = "${u.DNI}" />
                <c:set var = "email" value = "${u.email}" />
                <c:set var = "tlfno" value = "${u.tlfno}" />
                <c:set var = "datos" value = "${u.datos}" />
                <c:set var = "validado" value = "${u.validado}" />
           </c:forEach>
        </c:if>
    </head>
    <body>
            <div class="container-fluid text-center">
                <nav class="navbar navbar-expand-lg fixed-top">
                    <a class="navbar-brand" href="<%= request.getContextPath() %>/ControladorDirecciones?enviar=Usu&usuario=${usuario}&passwd=${Oldpasswd}"><img src="<%= request.getContextPath() %>/images/logo.png" alt=""/></a>
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
                                <form method="post" id="formulario" action="<%= request.getContextPath() %>/ControladorDirecciones" onSubmit="validacion(); return false">
                                <div class="capaExt">
                                        <input type="hidden" class="form-control" name="usuario" id="usuario" value="${usuario}">
                                        <input type="hidden" class="form-control" name="rol" id="rol" value="${rol}">
                                    <h2 class="h2index">Nombre y apellidos:</h2>
                                        <div class="capaInt">
                                            <input type="text" class="form-control" name="nombre" id="nombre" maxlength="50" placeholder="Nombre y apellidos" value="${nombre}">
                                        </div>
                                    <h2 class="h2index">Contraseña</h2>
                                        <div class="capaInt">
                                            <input type="password" class="form-control" name="passwd" id="passwd" maxlength="20" placeholder="Contraseña" required>
                                        </div>
                                    <h2 class="h2index">DNI</h2>
                                        <div class="capaInt">
                                        <p class="error" id="error">${error}</p>
                                            <input type="text" class="form-control" name="dni" id="dni" maxlength="9" minlength="9" placeholder="DNI" value="${dni}" pattern="[0-9]{8}[A-Za-z]{1}" required>
                                        </div>
                                    <h2 class="h2index">Correo electrónico:</h2>
                                        <div class="capaInt">
                                            <input type="text" class="form-control" name="email" id="email" maxlength="50" placeholder="Email@correo.com" value="${email}" pattern="[A-Za-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required>
                                        </div>
                                    <h2 class="h2index">Teléfono</h2>
                                        <div class="capaInt">
                                            <input type="tel" class="form-control" name="tlfno" id="tlfno" maxlength="12" minlength="9" placeholder="Número de teléfeno" pattern="^[9|8|7|6]\d{8}$" value="${tlfno}" required>
                                        </div> 
                                    <label for="datos">
                                        <c:choose>
                                            <c:when test="${datos == 'Si'}">
                                                <input type="checkbox" class="form-check-input" name="datos" id="datos" value="Si" checked>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="checkbox" class="form-check-input" name="datos" id="datos" value="Si">
                                            </c:otherwise>
                                        </c:choose>
                                        Autorizo la cesión de mis datos a terceros con fines comerciales
                                    </label>
                                    <br>
                                    <button type="submit" class="btn btn-outline-success" name="enviar" id="enviar" value="ModificarUsuario" onclick="validacion()">Guardar usuario</button> 
                                    <c:choose>
                                        <c:when test="${validado == 'Si'}">
                                            <a class="btn btn-success" href="<%= request.getContextPath() %>/ControladorDirecciones?enviar=Volver&user=${usuario}&pass=${passwd}">Volver</a>
                                        </c:when>
                                        <c:otherwise>
                                            <button class="btn btn-success" disabled>Volver</button>
                                        </c:otherwise>
                                    </c:choose>
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
    <script src="<%= request.getContextPath() %>/JS/ValidaUsu.js"></script>
    <script src="<%= request.getContextPath() %>/JS/jquery-3.4.1.min.js"></script>
    <script src="<%= request.getContextPath() %>/JS/popper.min.js"></script>     
    <script src="<%= request.getContextPath() %>/JS/bootstrap.min.js"></script>
    </body>
</html>