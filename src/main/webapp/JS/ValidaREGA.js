/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function validacion() {
    var rega = document.getElementById("rega").value;    
    var form = document.getElementById("formulario");
    
    
    if (valiREGA(rega)){
        form.onsubmit = "validacion(); return false";
        form.submit();
    }
    
    function valiREGA(rega) {
        /*NIF*/
        var validado = true;
        if (rega === "" || rega.length === 0 || /^\s+$/.test(rega)) {
            document.getElementById('errorREGA').innerHTML='Seleccione un REGA';
            validado = false;
        }
        return validado;
    }
}