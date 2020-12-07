/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.controllers;

import es.albarregas.DAO.IBajasDAO;
import es.albarregas.DAO.IBovinoDAO;
import es.albarregas.DAO.IDestinoExplotacionesDAO;
import es.albarregas.DAO.IExplotacionesDAO;
import es.albarregas.DAO.IUsuariosDAO;
import es.albarregas.DaoFactory.DAOFactory;
import es.albarregas.beans.Bajas;
import es.albarregas.beans.Bovinos;
import es.albarregas.beans.DestinosExplotaciones;
import es.albarregas.beans.Explotaciones;
import es.albarregas.beans.Usuarios;
import es.albarregas.methods.Methods;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Markitos
 */
@WebServlet(name = "ControladorDirecciones", urlPatterns = {"/ControladorDirecciones"})
public class ControladorDirecciones extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NoSuchAlgorithmException {
        response.setContentType("text/html;charset=UTF-8");
        
        String url = "index.jsp";
        
        String  usuario = null, passwd = null, contra = null, nombre, dni, email, tlfno, rol, datos, 
                rega, provincia, municipio, 
                dib, destinoExplo, 
                paisOrigen, raza, sexo, dibMadre, ternero, exploNaci,
                causa, destino, alta,
                nacimientoS, fechaAltaS, fechaBajaS;
        int dia, mes, anyo;
        Calendar rightNow = Calendar.getInstance();
        
        Usuarios usu = new Usuarios();
        Explotaciones explo = new Explotaciones();
        DestinosExplotaciones destiExplo = new DestinosExplotaciones();
        Bovinos bovi = new Bovinos();
        Bajas bjs = new Bajas();
        Methods method = new Methods();
        
        DAOFactory daof = DAOFactory.getDAOFactory();
            IUsuariosDAO usuDAO = daof.getUsuariosDAO();
            IExplotacionesDAO exploDAO = daof.getExplotacionesDAO();
            IDestinoExplotacionesDAO destiExploDAO = daof.getDestinoExplotacionesDAO();
            IBovinoDAO boviDAO = daof.getBovinoDAO();
            IBajasDAO bjsDAO = daof.getBajasDAO();
            
        List<Usuarios> listaU = new ArrayList();
        List<Explotaciones> listaE = new ArrayList();
        List<DestinosExplotaciones> listaDE = new ArrayList();
        List<Bovinos> listaBo = new ArrayList();
        List<Bajas> listaBa = new ArrayList();
           
        String enviar = request.getParameter("enviar");
        switch(enviar){
            //LogIn y LogOut
            case "Usuario":
                Usuarios root = new Usuarios("admin", "admin", "Admin", "si");
                
                usuDAO.setUsuario(root);
                
                usuario = request.getParameter("usuario").toLowerCase();
                contra = request.getParameter("passwd");
                
                passwd = method.cifrarMD5(contra);
                
                usu = usuDAO.getUsuario(usuario, passwd);
                listaU.add(usu);
                
                request.setAttribute("user", listaU);
                
                if(usu == null) {
                    url = "index.jsp";
                    request.setAttribute("error", "Usuario o contraseña erróneos");
                } else {
                    listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                    request.setAttribute("explo", listaE);
                    switch (usu.getRol()) {
                        case "Admin":
                            if(usu.getValidado().equals("si")){
                                url = "JSP/Usuarios/inicioAdmin.jsp";
                            } else {
                                url = "JSP/Usuarios/UUsuario.jsp";
                            }
                            break;
                        case "Cliente":
                            if(usu.getValidado().equals("si")){
                                url = "JSP/Usuarios/inicioCliente.jsp";
                            } else {
                                url = "JSP/Usuarios/UUsuario.jsp";
                            }
                            break;
                        case "Visitante":
                            if(usu.getValidado().equals("si")){
                                url = "JSP/Usuarios/inicioVisitante.jsp";
                            } else {
                                url = "JSP/Usuarios/UUsuario.jsp";
                            }
                            break;
                    }
                }
                break;
                
                case "Usu":
                    usuario = request.getParameter("usuario");
                    passwd = request.getParameter("passwd");
                    
                    usu = method.guarda(usuario, passwd);
                    listaU.add(usu);
                    request.setAttribute("user", listaU);

                    listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                    request.setAttribute("explo", listaE);

                    switch (usu.getRol()) {
                        case "Admin":
                            if(usu.getValidado().equals("si")){
                                url = "JSP/Usuarios/inicioAdmin.jsp";
                            } else {
                                url = "JSP/Usuarios/UUsuario.jsp";
                            }
                            break;
                        case "Cliente":
                            if(usu.getValidado().equals("si")){
                                url = "JSP/Usuarios/inicioCliente.jsp";
                            } else {
                                url = "JSP/Usuarios/UUsuario.jsp";
                            }
                            break;
                        case "Visitante":
                            if(usu.getValidado().equals("si")){
                                url = "JSP/Usuarios/inicioVisitante.jsp";
                            } else {
                                url = "JSP/Usuarios/UUsuario.jsp";
                            }
                            break;
                    }
                    break;

                
                case "CerrarSesion":
                    url = "index.jsp";
                    break;
                
            //Crear usuario  
            case "CreateUsuario":
                usuario = request.getParameter("usuario");
                passwd = request.getParameter("passwd");
                
                usu = method.guarda(usuario, passwd);
                listaU.add(usu);
                request.setAttribute("user", listaU);
                
                listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                request.setAttribute("explo", listaE);
                
                url = "JSP/Usuarios/CUsuario.jsp";
                break;
                
                case "CrearUsuario":
                    usuario = request.getParameter("usuario");
                    passwd = request.getParameter("passwd");
                    usu = method.guarda(usuario, passwd);
                    listaU.add(usu);
                    
                    listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                    request.setAttribute("explo", listaE);

                    usuario = request.getParameter("usuario2").toLowerCase();
                    passwd = request.getParameter("passwd2");
                    rol = request.getParameter("rol");

                    request.setAttribute("user", listaU);

                    usu = new Usuarios(usuario, passwd, rol, "no");
                    usuDAO.setUsuario(usu);

                    url = "JSP/Usuarios/inicioAdmin.jsp";
                    break;
              
            case "CreateUsuarioV":
                url = "JSP/Usuarios/CUsuarioV.jsp";
                break;
                
                case "CrearUsuarioV":
                    
                    usuario = request.getParameter("usuario2").toLowerCase();
                    passwd = request.getParameter("passwd2");
                    rol = request.getParameter("rol");

                    usu = new Usuarios(usuario, passwd, rol, "no");
                    usuDAO.setUsuario(usu);

                    url = "index.jsp";
                    break;
                    
                
            //Modificar usuario    
            case "UpdateUsuario":
                usuario = request.getParameter("usuario");
                passwd = request.getParameter("passwd");
                
                usu = method.guarda(usuario, passwd);
                listaU.add(usu);
                request.setAttribute("user", listaU);
                
                listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                request.setAttribute("explo", listaE);
                
                url = "JSP/Usuarios/UUsuario.jsp";
                break;
                
                case "ModificarUsuario":
                    usuario = request.getParameter("usuario");
                    nombre = request.getParameter("nombre");
                    passwd = method.cifrarMD5(request.getParameter("passwd"));
                    dni = request.getParameter("dni");
                    email = request.getParameter("email");
                    tlfno = request.getParameter("tlfno");
                    rol = request.getParameter("rol");
                    datos = "No";
                    String varDatos;
                    try{
                       varDatos = request.getParameter("datos");
                        if(varDatos.equals("Si")) {
                            datos = "Si";
                        }
                    } catch(NullPointerException e) { }
                    
                    usu = new Usuarios(usuario.toLowerCase(), passwd, nombre, dni, email, tlfno, "si", rol, datos);
                    usuDAO.updateUsuario(usu);

                    listaU.add(usu);
                    request.setAttribute("user", listaU);
                    
                    listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                    request.setAttribute("explo", listaE);

                    switch (rol) {
                        case "Admin":
                            url = "JSP/Usuarios/inicioAdmin.jsp";
                            break;
                        case "Cliente":
                            url = "JSP/Usuarios/inicioCliente.jsp";
                            break;
                        case "Visitante":
                            url = "JSP/Usuarios/inicioVisitante.jsp";
                            break;
                        default:
                            break;
                    }

                    break;

                
            //Listar usuario    
            case "ListarUsuario":
                usuario = request.getParameter("usuario");
                passwd = request.getParameter("passwd");
                
                usu = method.guarda(usuario, passwd);
                
                request.setAttribute("user", usuario);
                request.setAttribute("pass", passwd);
                
                if(usu.getRol().equals("Admin")){
                    url = "JSP/Usuarios/RUsuario.jsp";
                } else {
                    url = "JSP/Usuarios/RUsuarioC.jsp";
                }
                
                listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                request.setAttribute("explo", listaE);
                     
                listaU.clear();
                listaU = usuDAO.getAllUsuarios();
                
                request.setAttribute("listado", listaU);
                break;
                
                case "Volver":
                    usuario = request.getParameter("user");
                    passwd = request.getParameter("pass");

                    usu = method.guarda(usuario, passwd);
                    listaU.add(usu);
                    request.setAttribute("user", listaU);

                    listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                    request.setAttribute("explo", listaE);
                    
                    rega = request.getParameter("rega");
                    request.setAttribute("rega", rega);
                    
                    switch (usu.getRol()) {
                        case "Admin":
                            url = "JSP/Usuarios/inicioAdmin.jsp";
                            break;
                        case "Cliente":
                            url = "JSP/Usuarios/inicioCliente.jsp";
                            break;
                        default:
                            url = "JSP/Usuarios/inicioVisitante.jsp";
                            break;
                    }   
                    break;

                
            //Eliminar usuario    
            case "BorrarUsuario":
                usuario = request.getParameter("user");
                passwd = request.getParameter("pass");
                
                usu = method.guarda(usuario, passwd);
                listaU.add(usu);
                
                request.setAttribute("user", usuario);
                request.setAttribute("pass", passwd);
                
                listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                request.setAttribute("explo", listaE);
                
                usuario = request.getParameter("usu");
                usuDAO.deleteUsuario(usuario);
                
                listaU.clear();
                listaU = usuDAO.getAllUsuarios();
                request.setAttribute("listado", listaU);
                
                url = "JSP/Usuarios/RUsuario.jsp";
                break;   
                
            //Cambiar rol usuario    
            case "RolUsuario":
                usuario = request.getParameter("user");
                passwd = request.getParameter("pass");
                
                usu = method.guarda(usuario, passwd);
                listaU.add(usu);
                
                request.setAttribute("user", usuario);
                request.setAttribute("pass", passwd);
                
                listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                request.setAttribute("explo", listaE);
                
                usuario = request.getParameter("usu");
                passwd = request.getParameter("passwd");
                
                usu = usuDAO.getUsuario(usuario, passwd);
                rol = usu.getRol();
                
                switch(rol){
                    case "Visitante":
                        usu.setRol("Cliente");
                        break;
                    case "Cliente":
                        usu.setRol("Admin");
                        break;
                    case "Admin":
                        usu.setRol("Visitante");
                        break;
                }
                
                listaU.add(usu);
                
                listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                request.setAttribute("explo", listaE);
                
                usuDAO.updateUsuario(usu);
                
                listaU.clear();
                listaU = usuDAO.getAllUsuarios();
                request.setAttribute("listado", listaU);
                
                url = "JSP/Usuarios/RUsuario.jsp";
                break; 
              
            //Crear explotacion    
            case "CreateExplotacion":
                usuario = request.getParameter("usuario");
                passwd = request.getParameter("passwd");
                
                usu = method.guarda(usuario, passwd);
                listaU.add(usu);
                
                request.setAttribute("user", usuario);
                request.setAttribute("pass", passwd);
                
                listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                request.setAttribute("explo", listaE);
                
                listaU = usuDAO.getAllUsuarios();
                request.setAttribute("listado", listaU);
                
                url = "JSP/Explotaciones/CExplo.jsp";
                break;
                
                case "CrearExplotacion":
                    usuario = request.getParameter("user");
                    passwd = request.getParameter("pass");

                    usu = method.guarda(usuario, passwd);
                    listaU.add(usu);
                    
                    request.setAttribute("user", listaU);
                    
                    rega = request.getParameter("rega").toUpperCase();
                    provincia = request.getParameter("provincia");
                    municipio = request.getParameter("municipio");
                    nombre = request.getParameter("nombre");
                    usuario = request.getParameter("usuario2");
                    explo = new Explotaciones(rega, nombre, provincia, municipio, usuario);
                    exploDAO.setExplotacion(explo);

                    listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                    request.setAttribute("explo", listaE);

                    url = "JSP/Usuarios/inicioAdmin.jsp";
                    break;
                
            //Ver explotaciones 
            case "VerExplotacion":
                usuario = request.getParameter("usuario");
                passwd = request.getParameter("passwd");
                
                usu = method.guarda(usuario, passwd);
                
                request.setAttribute("user", usuario);
                request.setAttribute("pass", passwd);
                
                listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                request.setAttribute("explo", listaE);
                
                rol = usu.getRol();
                        
                if(rol.equals("Admin")){
                    listaE = exploDAO.getAllExplotaciones();
                    listaU = usuDAO.getAllUsuarios();
                    request.setAttribute("explotaciones", listaE);
                    request.setAttribute("usuar", listaU);
                    url = "JSP/Explotaciones/RExplo.jsp";
                } else if(rol.equals("Cliente")) {
                    listaE = exploDAO.getExplotacionUsu(usuario);
                    request.setAttribute("explotaciones", listaE);
                    url = "JSP/Explotaciones/RExploC.jsp";
                } else if(rol.equals("Visitante")) {
                    listaE = exploDAO.getAllExplotacionesValidadas();
                    listaU = usuDAO.getAllUsuarios();
                    request.setAttribute("explotaciones", listaE);
                    request.setAttribute("usuar", listaU);
                    url = "JSP/Explotaciones/RExplo.jsp";
                }
                
                break;
                
                
            //Modificar explotaciones   
            case "UpdateExplotacion":
                usuario = request.getParameter("usuario");
                passwd = request.getParameter("passwd");
                
                usu = method.guarda(usuario, passwd);
                listaU.add(usu);
                request.setAttribute("user", listaU);
                
                listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                request.setAttribute("explo", listaE);

                rega = request.getParameter("rega");
                
                if(rega.equals("")){
                    request.setAttribute("errorREGA", "Seleccione un REGA, por favor");
                    switch (usu.getRol()) {
                        case "Admin":
                            url = "JSP/Usuarios/inicioAdmin.jsp";
                            break;
                        case "Cliente":
                            url = "JSP/Usuarios/inicioCliente.jsp";
                            break;
                        default:
                            url = "JSP/Usuarios/inicioVisitante.jsp";
                            break;
                    }   
                } else {
                    listaE = exploDAO.getExplotacion(rega);
                    request.setAttribute("explotaciones", listaE);

                    listaU = usuDAO.getAllUsuarios();
                    request.setAttribute("listado", listaU);

                    url = "JSP/Explotaciones/UExplo.jsp";
                }
                break;
            
                 case "ModificarExplotacion":
                    usuario = request.getParameter("user");
                    passwd = request.getParameter("pass");

                    usu = method.guarda(usuario, passwd);
                    listaU.add(usu);
                    request.setAttribute("user", listaU);

                    rega = request.getParameter("rega");
                    provincia = request.getParameter("provincia");
                    municipio = request.getParameter("municipio");
                    nombre = request.getParameter("nombre");
                    usuario = request.getParameter("usuario2");
                    explo = new Explotaciones(rega, nombre, provincia, municipio, usuario);
                    
                    exploDAO.updateExplotacion(explo);
                    
                    listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                    request.setAttribute("explo", listaE);
                    
                    rol = usu.getRol();
                    
                    switch (rol) {
                        case "Admin":
                            url = "JSP/Usuarios/inicioAdmin.jsp";
                            break;
                        case "Cliente":
                            url = "JSP/Usuarios/inicioCliente.jsp";
                            break;
                        case "Visitante":
                            url = "JSP/Usuarios/inicioVisitante.jsp";
                            break;
                        default:
                            break;
                    }
                     break;

                
            //Eliminar explotaciones 
            case "EliminarExplotacion":
                usuario = request.getParameter("usuario");
                passwd = request.getParameter("passwd");

                usu = method.guarda(usuario, passwd);
                listaU.add(usu);
                request.setAttribute("user", listaU);

                listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                request.setAttribute("explo", listaE);
                
                rega = request.getParameter("rega");
                
                if(rega.equals("")){
                    request.setAttribute("errorREGA", "Seleccione un REGA, por favor");
                    switch (usu.getRol()) {
                        case "Admin":
                            url = "JSP/Usuarios/inicioAdmin.jsp";
                            break;
                        case "Cliente":
                            url = "JSP/Usuarios/inicioCliente.jsp";
                            break;
                        default:
                            url = "JSP/Usuarios/inicioVisitante.jsp";
                            break;
                    }   
                } else {
                    request.setAttribute("rega", rega);

                    url = "JSP/Explotaciones/DExplo.jsp";
                }
                break;
                
                case "SiElimnar":
                    usuario = request.getParameter("user");
                    passwd = request.getParameter("pass");

                    usu = method.guarda(usuario, passwd);
                    listaU.add(usu);
                    request.setAttribute("user", listaU);
                    
                    rega = request.getParameter("rega");
                    exploDAO.deleteExplotacion(rega);

                    listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                    request.setAttribute("explo", listaE);

                    url = "JSP/Usuarios/inicioAdmin.jsp";
                    break;
                    
                case "NoElimnar":
                    usuario = request.getParameter("user");
                    passwd = request.getParameter("pass");

                    usu = method.guarda(usuario, passwd);
                    listaU.add(usu);
                    request.setAttribute("user", listaU);

                    listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                    request.setAttribute("explo", listaE);

                    rega = request.getParameter("rega");

                    url = "JSP/Usuarios/inicioAdmin.jsp";
                    break;
            
            //Menu bovinos    
            case "VerBovinos":
                usuario = request.getParameter("usuario");
                passwd = request.getParameter("passwd");
                
                usu = method.guarda(usuario, passwd);
                listaU.add(usu);
                request.setAttribute("user", usuario);
                request.setAttribute("pass", passwd);
                
                listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                request.setAttribute("explo", listaE);
                
                rega = request.getParameter("rega");
                
                if(rega.equals("")){
                    request.setAttribute("errorREGA", "Seleccione un REGA, por favor");
                    request.setAttribute("user", listaU);
                    switch (usu.getRol()) {
                        case "Admin":
                            url = "JSP/Usuarios/inicioAdmin.jsp";
                            break;
                        case "Cliente":
                            url = "JSP/Usuarios/inicioCliente.jsp";
                            break;
                        default:
                            url = "JSP/Usuarios/inicioVisitante.jsp";
                            break;
                    }   
                } else {
                    request.setAttribute("rega", rega);

                    url = "JSP/Bovinos/MenuRBovino.jsp";
                }
                break;
                
                case "BuscarBovino":
                    usuario = request.getParameter("user");
                    passwd = request.getParameter("pass");

                    usu = method.guarda(usuario, passwd);
                    listaU.add(usu);
                    request.setAttribute("user", usuario);
                    request.setAttribute("pass", passwd);

                    listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                    request.setAttribute("explo", listaE);

                    rega = request.getParameter("rega");
                    request.setAttribute("rega", rega);
                    
                    dib = request.getParameter("dibBuscado").toUpperCase();
                    
                    url = "JSP/Bovinos/MenuRBovino.jsp";
                    
                    if(dib.equals("")){
                        request.setAttribute("error", "No ha introducido ningun DIB");
                    } else {
                        dia = rightNow.get(Calendar.DAY_OF_MONTH);
                            request.setAttribute("dA", dia);
                        mes = rightNow.get(Calendar.MONTH) + 1;
                            request.setAttribute("mA", mes);
                        anyo = rightNow.get(Calendar.YEAR);
                            request.setAttribute("aA", anyo);
                            
                        bovi = boviDAO.getBovino(dib);
                        request.setAttribute("bovino", bovi);
                        
                        listaBa = bjsDAO.getBajas(rega);
                        request.setAttribute("bajas", listaBa);
                        
                        listaDE = destiExploDAO.getDestinosExplotacion(rega);
                        request.setAttribute("desti", listaDE);
                        
                        url = "JSP/Bovinos/RBovinoBuscado.jsp";
                    }
                    break;
                
                case "ListadoBovinos":
                    usuario = request.getParameter("user");
                    passwd = request.getParameter("pass");

                    usu = method.guarda(usuario, passwd);
                    listaU.add(usu);
                    request.setAttribute("user", usuario);
                    request.setAttribute("pass", passwd);

                    listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                    request.setAttribute("explo", listaE);
                    
                    rega = request.getParameter("rega");
                    if(rega.equals("")){
                        request.setAttribute("errorREGA", "Seleccione un REGA, por favor");
                        request.setAttribute("user", listaU);
                        switch (usu.getRol()) {
                            case "Admin":
                                url = "JSP/Usuarios/inicioAdmin.jsp";
                                break;
                            case "Cliente":
                                url = "JSP/Usuarios/inicioCliente.jsp";
                                break;
                            default:
                                url = "JSP/Usuarios/inicioVisitante.jsp";
                                break;
                        }   
                    } else {
                        request.setAttribute("rega", rega);

                        dia = rightNow.get(Calendar.DAY_OF_MONTH);
                            request.setAttribute("dA", dia);
                        mes = rightNow.get(Calendar.MONTH) + 1;
                            request.setAttribute("mA", mes);
                        anyo = rightNow.get(Calendar.YEAR);
                            request.setAttribute("aA", anyo);

                        listaBo = boviDAO.getBovinos(rega);
                        request.setAttribute("bovinos", listaBo);

                        listaBa = bjsDAO.getBajas(rega);
                        request.setAttribute("bajas", listaBa);

                        listaDE = destiExploDAO.getDestinosExplotacion(rega);
                        request.setAttribute("desti", listaDE);

                        url = "JSP/Bovinos/RBovino.jsp";
                    }
                    break;
                
                case "ListadoTerneros":
                    usuario = request.getParameter("usuario");
                    passwd = request.getParameter("passwd");

                    usu = method.guarda(usuario, passwd);
                    listaU.add(usu);
                    request.setAttribute("user", usuario);
                    request.setAttribute("pass", passwd);

                    listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                    request.setAttribute("explo", listaE);

                    rega = request.getParameter("rega");
                    request.setAttribute("rega", rega);
                    
                    dia = rightNow.get(Calendar.DAY_OF_MONTH);
                        request.setAttribute("dA", dia);
                    mes = rightNow.get(Calendar.MONTH) + 1;
                        request.setAttribute("mA", mes);
                    anyo = rightNow.get(Calendar.YEAR);
                        request.setAttribute("aA", anyo);

                    listaBo = boviDAO.getBovinosT(rega);
                    request.setAttribute("bovinos", listaBo);
                    
                    listaBa = bjsDAO.getBajas(rega);
                    request.setAttribute("bajas", listaBa);
                        
                    listaDE = destiExploDAO.getDestinosExplotacion(rega);
                    request.setAttribute("desti", listaDE);

                    url = "JSP/Bovinos/RBovino.jsp";
                    break;    
                    
                    case "CreateBovino":
                        usuario = request.getParameter("user");
                        passwd = request.getParameter("pass");

                        usu = method.guarda(usuario, passwd);
                        listaU.add(usu);
                        request.setAttribute("user", usuario);
                        request.setAttribute("pass", passwd);

                        listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                        request.setAttribute("explo", listaE);

                        rega = request.getParameter("rega");
                        dib = request.getParameter("DIB");

                        request.setAttribute("rega", rega);
                        request.setAttribute("DIB", dib);

                        url = "JSP/Bovinos/CBovino.jsp";
                        break;

                        case "CrearBovino":
                            usuario = request.getParameter("user");
                            passwd = request.getParameter("pass");

                            usu = method.guarda(usuario, passwd);
                            listaU.add(usu);
                            request.setAttribute("user", usuario);
                            request.setAttribute("pass", passwd);

                            listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                            request.setAttribute("explo", listaE);

                            rega = request.getParameter("rega");
                            dib = request.getParameter("DIB").toUpperCase();
                            nacimientoS = request.getParameter("nacimiento");
                            paisOrigen = request.getParameter("paisOrigen");
                            raza = request.getParameter("raza");
                            sexo = request.getParameter("sexo");
                            dibMadre = request.getParameter("dibMadre");
                            dia = rightNow.get(Calendar.DAY_OF_MONTH);
                            mes = rightNow.get(Calendar.MONTH) + 1;
                            anyo = rightNow.get(Calendar.YEAR);
                            fechaAltaS = anyo + "-" + mes + "-" + dia;
                            ternero = request.getParameter("Ternero");
                            exploNaci = request.getParameter("exploNaci");

                            bovi = new Bovinos(dib, rega, paisOrigen, raza, sexo, dibMadre, ternero, nacimientoS, fechaAltaS, exploNaci);

                            boviDAO.setBovinos(bovi);

                            listaBo = boviDAO.getBovinos(rega);
                            request.setAttribute("bovinos", listaBo);
                            request.setAttribute("rega", rega);

                            listaBo = boviDAO.getBovinos(rega);
                            request.setAttribute("bovinos", listaBo);

                            listaBa = bjsDAO.getBajas(rega);
                            request.setAttribute("bajas", listaBa);
                        
                            listaDE = destiExploDAO.getDestinosExplotacion(rega);
                            request.setAttribute("desti", listaDE);

                            url = "JSP/Bovinos/RBovino.jsp";
                            break;

                    case "UpdateBovino":
                        usuario = request.getParameter("user");
                        passwd = request.getParameter("pass");

                        usu = method.guarda(usuario, passwd);
                        listaU.add(usu);
                        request.setAttribute("user", usuario);
                        request.setAttribute("pass", passwd);

                        listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                        request.setAttribute("explo", listaE);

                        dib = request.getParameter("DIB");

                        bovi = boviDAO.getBovino(dib);
                        request.setAttribute("bovino", bovi);

                        url = "JSP/Bovinos/UBovino.jsp";
                        break;

                        case "ModificarBovino":
                            usuario = request.getParameter("user");
                            passwd = request.getParameter("pass");

                            usu = method.guarda(usuario, passwd);
                            listaU.add(usu);
                            request.setAttribute("user", usuario);
                            request.setAttribute("pass", passwd);

                            listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                            request.setAttribute("explo", listaE);

                            rega = request.getParameter("rega");
                            dib = request.getParameter("DIB");
                            nacimientoS = request.getParameter("nacimiento");
                            paisOrigen = request.getParameter("paisOrigen");
                            raza = request.getParameter("raza");
                            sexo = request.getParameter("sexo");
                            dibMadre = request.getParameter("dibMadre");
                            dia = rightNow.get(Calendar.DAY_OF_MONTH);
                            mes = rightNow.get(Calendar.MONTH) + 1;
                            anyo = rightNow.get(Calendar.YEAR);
                            fechaAltaS = anyo + "-" + mes + "-" + dia;
                            ternero = request.getParameter("Ternero");
                            exploNaci = request.getParameter("exploNaci");

                            bovi = new Bovinos(dib, rega, paisOrigen, raza, sexo, dibMadre, ternero, nacimientoS, fechaAltaS, exploNaci);

                            boviDAO.updateBovinos(bovi);

                            listaBo = boviDAO.getBovinos(rega);
                            request.setAttribute("bovinos", listaBo);

                            rega = request.getParameter("rega");
                            request.setAttribute("rega", rega);

                            listaBa = bjsDAO.getBajas(rega);
                            request.setAttribute("bajas", listaBa);
                        
                            listaDE = destiExploDAO.getDestinosExplotacion(rega);
                            request.setAttribute("desti", listaDE);

                            url = "JSP/Bovinos/RBovino.jsp";
                            break;

                    case "DeleteBovino":
                        usuario = request.getParameter("user");
                        passwd = request.getParameter("pass");

                        usu = method.guarda(usuario, passwd);
                        listaU.add(usu);
                        request.setAttribute("user", usuario);
                        request.setAttribute("pass", passwd);

                        listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                        request.setAttribute("explo", listaE);
                        
                        rega = request.getParameter("rega");
                        request.setAttribute("rega", rega);
                        
                        dib = request.getParameter("DIB");
                        request.setAttribute("DIB", dib);

                        url = "JSP/Bovinos/DBovino.jsp";
                        break;

                        case "SiElimnarB":
                            usuario = request.getParameter("user");
                            passwd = request.getParameter("pass");

                            usu = method.guarda(usuario, passwd);
                            listaU.add(usu);
                            request.setAttribute("user", usuario);
                            request.setAttribute("pass", passwd);

                            dib = request.getParameter("dib");
                            boviDAO.deleteBovinos(dib);

                            listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                            request.setAttribute("explo", listaE);

                            rega = request.getParameter("rega");
                            request.setAttribute("rega", rega);

                            listaBo = boviDAO.getBovinos(rega);
                            request.setAttribute("bovinos", listaBo);

                            listaBa = bjsDAO.getBajas(rega);
                            request.setAttribute("bajas", listaBa);

                            listaDE = destiExploDAO.getDestinosExplotacion(rega);
                            request.setAttribute("desti", listaDE);

                            url = "JSP/Bovinos/RBovino.jsp";
                            break;
                            
                        case "NoElimnarB":
                            usuario = request.getParameter("user");
                            passwd = request.getParameter("pass");

                            usu = method.guarda(usuario, passwd);
                            listaU.add(usu);
                            request.setAttribute("user", usuario);
                            request.setAttribute("pass", passwd);

                            listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                            request.setAttribute("explo", listaE);

                            rega = request.getParameter("rega");
                            request.setAttribute("rega", rega);

                            listaBo = boviDAO.getBovinos(rega);
                            request.setAttribute("bovinos", listaBo);

                            listaBa = bjsDAO.getBajas(rega);
                            request.setAttribute("bajas", listaBa);
                        
                            listaDE = destiExploDAO.getDestinosExplotacion(rega);
                            request.setAttribute("desti", listaDE);

                            url = "JSP/Bovinos/RBovino.jsp";
                            break;
                    
                    case "BajaBovino":
                        usuario = request.getParameter("user");
                        passwd = request.getParameter("pass");

                        usu = method.guarda(usuario, passwd);
                        listaU.add(usu);
                        request.setAttribute("user", usuario);
                        request.setAttribute("pass", passwd);

                        dib = request.getParameter("dib");
                        boviDAO.getBovinos(dib);
                        
                        rega = request.getParameter("rega");
                        request.setAttribute("rega", rega);

                        listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                        request.setAttribute("explo", listaE);

                        dib = request.getParameter("DIB");
                        request.setAttribute("dib", dib);
                        
                        url = "JSP/Bovinos/Baja/BajaBovino.jsp";
                        break;

                        case "BjsBovino":
                            usuario = request.getParameter("user");
                            passwd = request.getParameter("pass");

                            usu = method.guarda(usuario, passwd);
                            listaU.add(usu);
                            request.setAttribute("user", usuario);
                            request.setAttribute("pass", passwd);

                            dib = request.getParameter("dib");
                            boviDAO.getBovinos(dib);
                            
                            rega = request.getParameter("rega");
                            request.setAttribute("rega", rega);

                            listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                            request.setAttribute("explo", listaE);

                            dia = rightNow.get(Calendar.DAY_OF_MONTH);
                            mes = rightNow.get(Calendar.MONTH) + 1;
                            anyo = rightNow.get(Calendar.YEAR);
                            fechaBajaS = anyo + "-" + mes + "-" + dia;

                            causa = request.getParameter("causa");
                            destino = request.getParameter("destino");

                            bjs = new Bajas(dib, fechaBajaS, causa, destino);

                            bjsDAO.setBajas(bjs);
                            
                            listaBo = boviDAO.getBovinos(rega);
                            request.setAttribute("bovinos", listaBo);

                            listaBa = bjsDAO.getBajas(rega);
                            request.setAttribute("bajas", listaBa);
                        
                            listaDE = destiExploDAO.getDestinosExplotacion(rega);
                            request.setAttribute("desti", listaDE);
                            
                            url = "JSP/Bovinos/RBovino.jsp";
                            
                            break;

                    case "ReposicionBovino":
                        usuario = request.getParameter("user");
                        passwd = request.getParameter("pass");

                        usu = method.guarda(usuario, passwd);
                        listaU.add(usu);
                        request.setAttribute("user", listaU);
                        
                        request.setAttribute("user", usuario);
                        request.setAttribute("pass", passwd);

                        dib = request.getParameter("DIB");
                        boviDAO.getBovinos(dib);
                        
                        rega = request.getParameter("rega");
                        request.setAttribute("rega", rega);

                        listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                        request.setAttribute("explo", listaE);
                            
                        bovi = boviDAO.getBovino(dib);
                        listaBo.add(bovi);
                        request.setAttribute("bovinos", listaBo);
                            
                        destiExplo = new DestinosExplotaciones(dib, "Reposicion");
                        destiExploDAO.setDestinosExplotacion(destiExplo);
                            
                        bjs = bjsDAO.getBaja(dib);
                        listaBa.add(bjs);
                        request.setAttribute("bajas", listaBa);
                        
                        listaBo = boviDAO.getBovinos(rega);
                        request.setAttribute("bovinos", listaBo);
                            
                        listaBa = bjsDAO.getBajas(rega);
                        request.setAttribute("bajas", listaBa);
                        
                        listaDE = destiExploDAO.getDestinosExplotacion(rega);
                        request.setAttribute("desti", listaDE);
                        
                        url = "JSP/Bovinos/RBovino.jsp";
                            
                        break;

                    case "CebaderoBovino":
                        usuario = request.getParameter("user");
                        passwd = request.getParameter("pass");

                        usu = method.guarda(usuario, passwd);
                        listaU.add(usu);
                        request.setAttribute("user", listaU);

                        request.setAttribute("user", usuario);
                        request.setAttribute("pass", passwd);
                        
                        dib = request.getParameter("DIB");
                        boviDAO.getBovinos(dib);
                        
                        rega = request.getParameter("rega");
                        request.setAttribute("rega", rega);

                        listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                        request.setAttribute("explo", listaE);
                            
                        bovi = boviDAO.getBovino(dib);
                        listaBo.add(bovi);
                        request.setAttribute("bovinos", listaBo);
                            
                        destiExplo = new DestinosExplotaciones(dib, "Cebadero");
                        destiExploDAO.setDestinosExplotacion(destiExplo);
                        
                        bjs = bjsDAO.getBaja(dib);
                        listaBa.add(bjs);
                        request.setAttribute("bajas", listaBa);
                        
                        listaBo = boviDAO.getBovinos(rega);
                        request.setAttribute("bovinos", listaBo);
                            
                        listaBa = bjsDAO.getBajas(rega);
                        request.setAttribute("bajas", listaBa);
                        
                        listaDE = destiExploDAO.getDestinosExplotacion(rega);
                        request.setAttribute("desti", listaDE);
                        
                        url = "JSP/Bovinos/RBovino.jsp";
                            
                        break;
                     
            //Ver baja
            case "VerBajas":
                usuario = request.getParameter("usuario");
                passwd = request.getParameter("passwd");
                
                usu = method.guarda(usuario, passwd);
                listaU.add(usu);
                request.setAttribute("user", usuario);
                request.setAttribute("pass", passwd);
                
                listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                request.setAttribute("explo", listaE);
                            
                rega = request.getParameter("rega");
                
                if(rega.equals("")){
                    request.setAttribute("errorREGA", "Seleccione un REGA, por favor");
                    request.setAttribute("user", listaU);
                    switch (usu.getRol()) {
                        case "Admin":
                            url = "JSP/Usuarios/inicioAdmin.jsp";
                            break;
                        case "Cliente":
                            url = "JSP/Usuarios/inicioCliente.jsp";
                            break;
                        default:
                            url = "JSP/Usuarios/inicioVisitante.jsp";
                            break;
                    }   
                } else {
                    request.setAttribute("rega", rega);

                    listaBo = boviDAO.getBovinos(rega);
                    request.setAttribute("bovinos", listaBo);

                    listaBa = bjsDAO.getBajas(rega);
                    request.setAttribute("bajas", listaBa);

                    url = "JSP/Bovinos/Baja/RBaja.jsp";
                }
                break;
            
                case "UBajas":
                    usuario = request.getParameter("user");
                    passwd = request.getParameter("pass");

                    usu = method.guarda(usuario, passwd);
                    listaU.add(usu);
                    request.setAttribute("user", usuario);
                    request.setAttribute("pass", passwd);

                    listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                    request.setAttribute("explo", listaE);
                    
                    rega = request.getParameter("rega");
                    request.setAttribute("rega", rega);
                    
                    dib = request.getParameter("DIB");
                    
                    bovi = boviDAO.getBovino(dib);
                    request.setAttribute("bovino", bovi);
                    
                    bjs = bjsDAO.getBaja(dib);
                    
                    request.setAttribute("baja", bjs);                            

                    url = "JSP/Bovinos/Baja/UBaja.jsp";
                    break;
                    
                    case "ModificarBajas":
                        usuario = request.getParameter("user");
                        passwd = request.getParameter("pass");

                        usu = method.guarda(usuario, passwd);
                        listaU.add(usu);
                        request.setAttribute("user", usuario);
                        request.setAttribute("pass", passwd);

                        listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                        request.setAttribute("explo", listaE);
                    
                            rega = request.getParameter("rega");
                            dib = request.getParameter("DIB");
                            nacimientoS = request.getParameter("nacimiento");
                            paisOrigen = request.getParameter("paisOrigen");
                            raza = request.getParameter("raza");
                            sexo = request.getParameter("sexo");
                            dibMadre = request.getParameter("dibMadre");
                            dia = rightNow.get(Calendar.DAY_OF_MONTH);
                            mes = rightNow.get(Calendar.MONTH) + 1;
                            anyo = rightNow.get(Calendar.YEAR);
                            fechaAltaS = anyo + "-" + mes + "-" + dia;
                            ternero = request.getParameter("Ternero");
                            causa = request.getParameter("causa");
                            destino = request.getParameter("destino");
                            exploNaci = request.getParameter("exploNaci");

                        bovi = new Bovinos(dib, rega, paisOrigen, raza, sexo, dibMadre, ternero, nacimientoS, fechaAltaS, exploNaci);
                        
                        bjs = bjsDAO.getBaja(dib);
                        fechaBajaS = bjs.getFechaBaja();
                        
                        bjs = new Bajas(dib, fechaBajaS, causa, destino);

                        boviDAO.updateBovinos(bovi);
                        bjsDAO.updateBajas(bjs);
                        
                        request.setAttribute("rega", rega);
                        dib = request.getParameter("DIB");
                    
                        listaBo = boviDAO.getBovinos(rega);
                        request.setAttribute("bovinos", listaBo);
                            
                        listaBa = bjsDAO.getBajas(rega);
                        request.setAttribute("bajas", listaBa);
                        
                        listaDE = destiExploDAO.getDestinosExplotacion(rega);
                        request.setAttribute("desti", listaDE);
                        
                        url = "JSP/Bovinos/RBovino.jsp";
                        break;

                case "DBajas":
                    usuario = request.getParameter("user");
                    passwd = request.getParameter("pass");

                    usu = method.guarda(usuario, passwd);
                    listaU.add(usu);
                    request.setAttribute("user", usuario);
                    request.setAttribute("pass", passwd);

                    listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                    request.setAttribute("explo", listaE);

                    dib = request.getParameter("DIB");
                    request.setAttribute("dib", dib);
                    
                    rega = request.getParameter("rega");
                    request.setAttribute("rega", rega);

                    alta = request.getParameter("alta");
                    request.setAttribute("alta", alta);
                    
                    url = "JSP/Bovinos/Baja/DBaja.jsp";
                    break;

                    case "DeleteBajas":
                        usuario = request.getParameter("user");
                        passwd = request.getParameter("pass");

                        usu = method.guarda(usuario, passwd);
                        listaU.add(usu);
                        request.setAttribute("user", usuario);
                        request.setAttribute("pass", passwd);

                        listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                        request.setAttribute("explo", listaE);

                        rega = request.getParameter("rega");
                        request.setAttribute("rega", rega);
                        
                        dib = request.getParameter("dib");
                    
                        bjsDAO.deleteBajas(dib);
                        
                        listaBa = bjsDAO.getBajas(rega);
                        request.setAttribute("bajas", listaBa);
                        
                        alta = request.getParameter("alta");
                        
                        if(alta.equals("no")){
                            boviDAO.deleteBovinos(dib);
                        }
                        
                        listaBo = boviDAO.getBovinos(rega);
                        request.setAttribute("bovinos", listaBo);
                            
                        listaBa = bjsDAO.getBajas(rega);
                        request.setAttribute("bajas", listaBa);
                        
                        listaDE = destiExploDAO.getDestinosExplotacion(rega);
                        request.setAttribute("desti", listaDE);
                        
                        url = "JSP/Bovinos/RBovino.jsp";
                        break;
                        
            //Ver reposiciones   
            case "VerReposicion":
                usuario = request.getParameter("usuario");
                passwd = request.getParameter("passwd");
                
                usu = method.guarda(usuario, passwd);
                listaU.add(usu);
                request.setAttribute("user", usuario);
                request.setAttribute("pass", passwd);
                
                listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                request.setAttribute("explo", listaE);
                
                rega = request.getParameter("rega");
                
                if(rega.equals("")){
                    request.setAttribute("errorREGA", "Seleccione un REGA, por favor");
                    request.setAttribute("user", listaU);
                    switch (usu.getRol()) {
                        case "Admin":
                            url = "JSP/Usuarios/inicioAdmin.jsp";
                            break;
                        case "Cliente":
                            url = "JSP/Usuarios/inicioCliente.jsp";
                            break;
                        default:
                            url = "JSP/Usuarios/inicioVisitante.jsp";
                            break;
                    }   
                } else {
                    request.setAttribute("rega", rega);

                    listaBo = boviDAO.getBovinos(rega);
                    request.setAttribute("bovinos", listaBo);

                    listaBa = bjsDAO.getBajas(rega);
                    request.setAttribute("bajas", listaBa);

                    listaDE = destiExploDAO.getDestinosReposiciones(rega);
                    request.setAttribute("desti", listaDE);

                    dia = rightNow.get(Calendar.DAY_OF_MONTH);
                        request.setAttribute("dA", dia);
                    mes = rightNow.get(Calendar.MONTH) + 1;
                        request.setAttribute("mA", mes);
                    anyo = rightNow.get(Calendar.YEAR);
                        request.setAttribute("aA", anyo);

                    request.setAttribute("destino", "(Reposicion)");

                    url = "JSP/Bovinos/DestinoExplotaciones/DestinoExplo.jsp";
                }
                break;
            
            //Ver cebadero
            case "VerCebadero":
                usuario = request.getParameter("usuario");
                passwd = request.getParameter("passwd");
                
                usu = method.guarda(usuario, passwd);
                listaU.add(usu);
                request.setAttribute("user", usuario);
                request.setAttribute("pass", passwd);
                
                listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                request.setAttribute("explo", listaE);
                
                rega = request.getParameter("rega");
                
                if(rega.equals("")){
                    request.setAttribute("errorREGA", "Seleccione un REGA, por favor");
                    request.setAttribute("user", listaU);
                    switch (usu.getRol()) {
                        case "Admin":
                            url = "JSP/Usuarios/inicioAdmin.jsp";
                            break;
                        case "Cliente":
                            url = "JSP/Usuarios/inicioCliente.jsp";
                            break;
                        default:
                            url = "JSP/Usuarios/inicioVisitante.jsp";
                            break;
                    }   
                } else {
                    request.setAttribute("rega", rega);

                    listaBo = boviDAO.getBovinos(rega);
                    request.setAttribute("bovinos", listaBo);

                    listaBa = bjsDAO.getBajas(rega);
                    request.setAttribute("bajas", listaBa);

                    listaDE = destiExploDAO.getDestinosCebaderos(rega);
                    request.setAttribute("desti", listaDE);

                    dia = rightNow.get(Calendar.DAY_OF_MONTH);
                        request.setAttribute("dA", dia);
                    mes = rightNow.get(Calendar.MONTH) + 1;
                        request.setAttribute("mA", mes);
                    anyo = rightNow.get(Calendar.YEAR);
                        request.setAttribute("aA", anyo);

                    request.setAttribute("destino", "(Cebadero)");

                    url = "JSP/Bovinos/DestinoExplotaciones/DestinoExplo.jsp";
                }
                break;
                
                case "DeleteDestino":
                    usuario = request.getParameter("user");
                    passwd = request.getParameter("pass");

                    usu = method.guarda(usuario, passwd);
                    listaU.add(usu);
                    request.setAttribute("user", usuario);
                    request.setAttribute("pass", passwd);

                    listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                    request.setAttribute("explo", listaE);

                    dib = request.getParameter("DIB");
                    request.setAttribute("dib", dib);
                    
                    rega = request.getParameter("rega");
                    request.setAttribute("rega", rega);

                    request.setAttribute("alta", "sinAlta");
                    
                    url = "JSP/Bovinos/DestinoExplotaciones/DDestino.jsp";
                    break;
                
                case "DeleteDestinoYBaja":
                    usuario = request.getParameter("user");
                    passwd = request.getParameter("pass");

                    usu = method.guarda(usuario, passwd);
                    listaU.add(usu);
                    request.setAttribute("user", usuario);
                    request.setAttribute("pass", passwd);

                    listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                    request.setAttribute("explo", listaE);

                    dib = request.getParameter("DIB");
                    request.setAttribute("dib", dib);
                    
                    rega = request.getParameter("rega");
                    request.setAttribute("rega", rega);
                    
                    request.setAttribute("alta", "conAlta");
                    
                    url = "JSP/Bovinos/DestinoExplotaciones/DDestino.jsp";
                    break;
                
                    case "DDestino":
                        usuario = request.getParameter("user");
                        passwd = request.getParameter("pass");

                        usu = method.guarda(usuario, passwd);
                        listaU.add(usu);
                        request.setAttribute("user", usuario);
                        request.setAttribute("pass", passwd);

                        listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                        request.setAttribute("explo", listaE);

                        dib = request.getParameter("dib");
                        request.setAttribute("dib", dib);

                        rega = request.getParameter("rega");
                        request.setAttribute("rega", rega);
                        
                        alta = request.getParameter("alta");
                        
                        if(alta.equals("conAlta")){
                            bjsDAO.deleteBajas(dib);
                        }
                        destiExploDAO.deleteDestinosExplotacio(dib);
                        boviDAO.deleteBovinos(dib);
                        
                        listaBo = boviDAO.getBovinos(rega);
                        request.setAttribute("bovinos", listaBo);
                            
                        listaBa = bjsDAO.getBajas(rega);
                        request.setAttribute("bajas", listaBa);
                        
                        listaDE = destiExploDAO.getDestinosExplotacion(rega);
                        request.setAttribute("desti", listaDE);
                        
                        url = "JSP/Bovinos/RBovino.jsp";
                        break;
                
                case "SacarDe":
                    usuario = request.getParameter("user");
                    passwd = request.getParameter("pass");

                    usu = method.guarda(usuario, passwd);
                    listaU.add(usu);
                    request.setAttribute("user", usuario);
                    request.setAttribute("pass", passwd);

                    listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                    request.setAttribute("explo", listaE);

                    dib = request.getParameter("DIB");
                    request.setAttribute("dib", dib);

                    rega = request.getParameter("rega");
                    request.setAttribute("rega", rega);
                    
                    destiExplo = destiExploDAO.getDestinoExplotacion(dib);
                    destinoExplo = destiExplo.getDestinoExplo();
                    request.setAttribute("destinoExplo", destinoExplo);
                    
                    url = "JSP/Bovinos/DestinoExplotaciones/SacarDestino.jsp";
                    break;
                        
                    case "ConfirmarSacarDe":
                        usuario = request.getParameter("user");
                        passwd = request.getParameter("pass");

                        usu = method.guarda(usuario, passwd);
                        listaU.add(usu);
                        request.setAttribute("user", usuario);
                        request.setAttribute("pass", passwd);

                        listaE = method.listaExplo(usu.getRol(), usu.getUsuarios());
                        request.setAttribute("explo", listaE);

                        dib = request.getParameter("dib");
                        request.setAttribute("dib", dib);

                        rega = request.getParameter("rega");
                        request.setAttribute("rega", rega);

                        destiExploDAO.deleteDestinosExplotacio(dib);
                        
                        listaBo = boviDAO.getBovinos(rega);
                        request.setAttribute("bovinos", listaBo);
                            
                        listaBa = bjsDAO.getBajas(rega);
                        request.setAttribute("bajas", listaBa);
                        
                        listaDE = destiExploDAO.getDestinosExplotacion(rega);
                        request.setAttribute("desti", listaDE);

                        url = "JSP/Bovinos/RBovino.jsp";
                        break;
                
        }
        
        request.getRequestDispatcher(url).forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(ControladorDirecciones.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(ControladorDirecciones.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
