<%-- 
    Document   : UBovino
    Created on : 12-nov-2020, 19:25:54
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
        
        <c:set var="b" value="${bovino}"></c:set>        
        <c:if test="${b != null}">
            <c:set var = "DIB" value = "${b.DIB}" />
            <c:set var = "nacimiento" value = "${b.nacimiento}" />
            <c:set var = "rega" value = "${b.REGA}" />
            <c:set var = "paisOrigen" value = "${b.paisOrigen}" />
            <c:set var = "raza" value = "${b.raza}" />
            <c:set var = "sexo" value = "${b.sexo}" />
            <c:set var = "DIBMadre" value = "${b.DIBMadre}" />
            <c:set var = "fechaAlta" value = "${b.fechaAlta}" />
            <c:set var = "Ternero" value = "${b.ternero}" />
        </c:if>
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
                                        <input type="hidden" class="form-control" name="rega" id="rega" value="${rega}">
                                        <input type="hidden" class="form-control" name="DIB" id="DIB" value="${DIB}">
                                    <h1><u>Modificar la oveja con DIB ${DIB}</u></h1>
                                    
                                    <h2 class="h2index">Nacimiento</h2>
                                        <div class="capaInt">
                                            <input type="date" class="form-control" name="nacimiento" id="nacimiento" value="${nacimiento}" required>
                                        </div>
                                    <h2 class="h2index">País origen</h2>
                                        <div class="capaInt">
                                            <input type="text" class="form-control" name="paisOrigen" id="paisOrigen" maxlength="20" placeholder="pais de origen" value="${paisOrigen}" required>
                                        </div>
                                    <h2 class="h2index">Raza</h2>
                                        <div class="capaInt">
                                            <input type="text" class="form-control" name="raza" id="raza" maxlength="50" placeholder="Raza" value="${raza}" required>
                                        </div>
                                    <h2 class="h2index">Sexo</h2>
                                        <div class="capaInt">
                                            <c:choose>
                                                <c:when test="${sexo == 'Macho'}">
                                                    <input type="radio" name="sexo" id="sexo" value="Macho" required checked>&nbsp;Macho
                                                    &nbsp;&nbsp;
                                                    <input type="radio" name="sexo" id="sexo" value="Hembra" required>&nbsp;Hembra
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="radio" name="sexo" id="sexo" value="Macho" required>&nbsp;Macho
                                                    &nbsp;&nbsp;
                                                    <input type="radio" name="sexo" id="sexo" value="Hembra" required checked>&nbsp;Hembra
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    <h2 class="h2index">DIB Madre</h2>
                                        <div class="capaInt">
                                            <input type="text" class="form-control" name="dibMadre" id="dibMadre" maxlength="14" placeholder="DIB de la madre" value="${DIBMadre}" required>
                                        </div>
                                    <h2 class="h2index">¿Es un ternero?</h2>
                                        <div class="capaInt">
                                            <c:choose>
                                                <c:when test="${Ternero == 'Si'}">
                                                    <input type="radio" name="Ternero" id="Ternero" value="Si" required checked>&nbsp;Si
                                                    &nbsp;&nbsp;
                                                    <input type="radio" name="Ternero" id="Ternero" value="No" required>&nbsp;No
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="radio" name="Ternero" id="Ternero" value="Si" required>&nbsp;Si
                                                    &nbsp;&nbsp;
                                                    <input type="radio" name="Ternero" id="Ternero" value="No" required checked>&nbsp;No
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    <h2 class="h2index">Explotacion nacimiento</h2>
                                        <div class="capaInt">    
                                            <input type="text" class="form-control" name="exploNaci" id="exploNaci" maxlength="14" minlength="14" value="${rega}" pattern="[A-Z]{2}[0-9]{12}" required>
                                        </div>
                                    <br>
                                    <button type="submit" class="btn btn-outline-success" name="enviar" id="enviar" value="ModificarBovino">Modificar bovino</button> 
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