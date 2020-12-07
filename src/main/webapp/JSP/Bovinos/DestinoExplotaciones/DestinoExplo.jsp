<%-- 
    Document   : DestinoExplo
    Created on : 22-nov-2020, 13:42:43
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
                                        <input type="hidden" class="form-control" name="rega" id="rega" value="${rega}">
                                    <h1><u>Explotacion ${rega}</u></h1>
                                    <table class="table">
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th scope="col">DIB</th>
                                                    <th scope="col">Nacimiento</th>
                                                    <th scope="col">Pais origen y REGA nacimiento</th>
                                                    <th scope="col">Raza</th>
                                                    <th scope="col">Sexo</th>
                                                    <th scope="col">DIB madre</th>
                                                    <th scope="col">Fecha alta</th>
                                                    <th scope="col">¿Es un ternero?</th>
                                                    <th scope="col">Modificar, eliminar, dar de baja/alta y destino</th>
                                                 </tr>
                                            </thead>
                                            <tbody>
                                        <c:set var="bovinos" value="${bovinos}"></c:set>  
                                        <c:set var="bajas" value="${bajas}"></c:set>  
                                        <c:set var="destinos" value="${desti}"></c:set>       
                                        <c:if test="${bovinos != null}">
                                            <c:forEach var="b" items="${bovinos}">
                                                <c:set var = "DIB" value = "${b.DIB}" />
                                                <c:set var = "nacimiento" value = "${b.nacimiento}" />
                                                <c:set var = "paisOrigen" value = "${b.paisOrigen}" />
                                                <c:set var = "raza" value = "${b.raza}" />
                                                <c:set var = "sexo" value = "${b.sexo}" />
                                                <c:set var = "DIBMadre" value = "${b.DIBMadre}" />
                                                <c:set var = "fechaAlta" value = "${b.fechaAlta}" />
                                                <c:set var = "Ternero" value = "${b.ternero}" /> 
                                                <c:set var = "exploNaci" value = "${b.exploNaci}" /> 
                                                
                                                <!--Comprobaciones-->
                                                <c:set var = "baja" value = "" />
                                                <c:if test="${bajas != null}">
                                                    <c:forEach var="ba" items="${bajas}">
                                                        <c:set var = "DIBBA" value = "${ba.DIB}" />
                                                        <c:if test="${DIB == DIBBA}">
                                                            <c:set var = "baja" value = "(Baja en la explotación)" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                                
                                                <c:set var = "desti" value = "" />
                                                <c:if test="${destinos != null}">
                                                    <c:forEach var="d" items="${destinos}">
                                                        <c:set var = "DIBDE" value = "${d.DIB}" />
                                                        <c:set var = "destinoExplo" value = "${d.destinoExplo}" />
                                                        <c:if test="${DIB == DIBDE}">
                                                            <c:set var = "desti" value = "(${destinoExplo})" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                                
                                                <!--Calcular edad-->
                                                <c:set var = "year" value = "${fn:substringBefore(nacimiento, '-')}" />
                                                    <fmt:parseNumber var = "aE" type = "number" value = "${year}" />
                                                <c:set var = "rest" value = "${fn:substringAfter(nacimiento, '-')}" />
                                                    <c:set var = "mes" value = "${fn:substringBefore(rest, '-')}" /> 
                                                        <fmt:parseNumber var = "mE" type = "number" value = "${mes}" />
                                                    <c:set var = "dia" value = "${fn:substringAfter(rest, '-')}" />
                                                        <fmt:parseNumber var = "dE" type = "number" value = "${dia}" />
                                                        
                                                <c:set var = "edadA" value = "${aA - aE}" />
                                                <c:set var = "edadM" value = "${mA - mE}" />
                                                <c:set var = "edadD" value = "${dA - dE}" />
                                                
                                                <c:if test="${edadA < 0}">
                                                    <c:set var = "edadA" value = "0" />
                                                </c:if>
                                                
                                                <c:if test="${edadM < 0}">
                                                    <c:set var = "edadM" value = "0" />
                                                </c:if>
                                                
                                                <c:if test="${edadD < 0}">
                                                    <c:set var = "edadD" value = "0" />
                                                </c:if>
                                                        
                                                <c:if test="${desti == destino}">
                                                <tr>
                                                    <th scope="col">
                                                        ${DIB}<br>
                                                        <a href="<%= request.getContextPath() %>/ControladorDirecciones?enviar=VerBajas&usuario=${user}&passwd=${pass}&rega=${rega}">
                                                            ${baja}
                                                        </a>
                                                            ${desti}
                                                    </th>
                                                    <th scope="col">${nacimiento}<bR>${edadA} años<bR>${edadM} meses<bR>${edadD} dias</th>
                                                    <th scope="col">${paisOrigen}<br>${exploNaci}</th>
                                                    <th scope="col">${raza}</th>
                                                    <th scope="col">${sexo}</th>
                                                    <th scope="col">${DIBMadre}</th>
                                                    <th scope="col">${fechaAlta}</th>
                                                    <th scope="col">${Ternero}</th>
                                                    <th scope="col">
                                                    <c:choose>
                                                        <c:when test="${baja != '(De baja)'}">
                                                        <a class="yellow" href="<%= request.getContextPath() %>/ControladorDirecciones?enviar=UpdateBovino&DIB=${DIB}&user=${user}&pass=${pass}&rega=${rega}">
                                                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                                <path fill-rule="evenodd" d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
                                                            </svg> 
                                                        </a>
                                                        <c:choose>
                                                            <c:when test="${desti == destino}">
                                                            <a class="red" href="<%= request.getContextPath() %>/ControladorDirecciones?enviar=DeleteDestino&DIB=${DIB}&user=${user}&pass=${pass}&rega=${rega}">
                                                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                                    <path fill-rule="evenodd" d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5a.5.5 0 0 0-1 0v7a.5.5 0 0 0 1 0v-7z"/>
                                                                </svg>
                                                            </a>  
                                                            </c:when>
                                                            <c:otherwise>
                                                            <a class="red" href="<%= request.getContextPath() %>/ControladorDirecciones?enviar=DeleteBovino&DIB=${DIB}&user=${user}&pass=${pass}&rega=${rega}">
                                                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                                    <path fill-rule="evenodd" d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5a.5.5 0 0 0-1 0v7a.5.5 0 0 0 1 0v-7z"/>
                                                                </svg>
                                                            </a>  
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <a class="red" href="<%= request.getContextPath() %>/ControladorDirecciones?enviar=BajaBovino&DIB=${DIB}&user=${user}&pass=${pass}&rega=${rega}">
                                                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-down-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                                <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                                <path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v5.793l2.146-2.147a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L7.5 10.293V4.5A.5.5 0 0 1 8 4z"/>
                                                             </svg>
                                                        </a>
                                                        </c:when>
                                                        <c:otherwise>
                                                        <a class="yellow" href="<%= request.getContextPath() %>/ControladorDirecciones?enviar=UBajas&DIB=${DIB}&user=${user}&pass=${pass}&rega=${rega}">
                                                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                                <path fill-rule="evenodd" d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
                                                            </svg> 
                                                        </a>
                                                        <c:choose>
                                                            <c:when test="${desti == destino}">
                                                            <a class="red" href="<%= request.getContextPath() %>/ControladorDirecciones?enviar=DeleteDestinoYBaja&DIB=${DIB}&user=${user}&pass=${pass}&rega=${rega}">
                                                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                                    <path fill-rule="evenodd" d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5a.5.5 0 0 0-1 0v7a.5.5 0 0 0 1 0v-7z"/>
                                                                </svg>
                                                            </a>
                                                            </c:when>
                                                            <c:otherwise>
                                                            <a class="red" href="<%= request.getContextPath() %>/ControladorDirecciones?enviar=DBajas&DIB=${DIB}&user=${user}&pass=${pass}&rega=${rega}&alta=no">
                                                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                                    <path fill-rule="evenodd" d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5a.5.5 0 0 0-1 0v7a.5.5 0 0 0 1 0v-7z"/>
                                                                </svg>
                                                            </a>  
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <a class="green" href="<%= request.getContextPath() %>/ControladorDirecciones?enviar=DBajas&DIB=${DIB}&user=${user}&pass=${pass}&rega=${rega}&alta=si">
                                                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-up-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                                <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                                <path fill-rule="evenodd" d="M8 12a.5.5 0 0 0 .5-.5V5.707l2.146 2.147a.5.5 0 0 0 .708-.708l-3-3a.5.5 0 0 0-.708 0l-3 3a.5.5 0 1 0 .708.708L7.5 5.707V11.5a.5.5 0 0 0 .5.5z"/>
                                                             </svg>
                                                        </a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                        <br>
                                                        <c:choose>
                                                            <c:when test="${baja == '(De baja)'}">
                                                                <span class="grey">
                                                                    Reposicion
                                                                </span>
                                                                <span class="grey">
                                                                    Cebadero
                                                                </span>
                                                            </c:when>
                                                            <c:when test="${desti == '(Reposicion)'}">
                                                                <a class="yellow" href="<%= request.getContextPath() %>/ControladorDirecciones?enviar=SacarDe&DIB=${DIB}&rega=${rega}&user=${user}&pass=${pass}">
                                                                    Sacar de Reposicion
                                                                </a>
                                                            </c:when>
                                                            <c:when test="${desti == '(Cebadero)'}">
                                                                <a class="yellow" href="<%= request.getContextPath() %>/ControladorDirecciones?enviar=SacarDe&DIB=${DIB}&rega=${rega}&user=${user}&pass=${pass}">
                                                                    Sacar de Cebadero
                                                                </a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <a class="yellow" href="<%= request.getContextPath() %>/ControladorDirecciones?enviar=ReposicionBovino&DIB=${DIB}&user=${user}&pass=${pass}">
                                                                    Reposicion
                                                                </a>
                                                                <a class="yellow" href="<%= request.getContextPath() %>/ControladorDirecciones?enviar=CebaderoBovino&DIB=${DIB}&user=${user}&pass=${pass}">
                                                                    Cebadero
                                                                </a>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </th>
                                                </tr>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                            </tbody>
                                        </table>
                                                
                                        <button type="submit" class="btn btn-success" name="enviar" id="enviar" value="CreateBovino">Añadir bovino</button>
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