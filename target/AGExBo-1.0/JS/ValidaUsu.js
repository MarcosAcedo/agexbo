/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validacion() {
    var dni = document.getElementById("dni").value;    
    var form = document.getElementById("formulario");
    
    
    if (valiDni(dni)){
        form.onsubmit = "validacion(); return false";
        form.submit();
    }
    
    function valiDni(dni) {
        /*NIF*/
        var validado = true;

            var numero = dni.substr(0, dni.length-1);
            var letr = dni.substr(dni.length-1, 1);
            numero = numero % 23;
            var letra='TRWAGMYFPDXBNJZSQVHLCKET';
            letra = letra.substr(numero, 1);
            if (letra !== letr) {
                $("#error").empty();
                $("#error").append("Error en la letra del DNI deberia ser: " + letra);
                validado = false;
        
        }
        return validado;
    }
}