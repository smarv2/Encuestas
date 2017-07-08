/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function fnEnviaEncuesta(){
    if(document.getElementById('NombreEncuesta').value != ''){
        document.getElementById('formEncuesta').submit();
    }else{
        alert('Por favor, capture el nombre de la Encuesta.');
    }
}

function fnEnviaPregunta() {
    if (document.getElementById('NombrePregunta').value != '') {
        if (document.getElementById('IdEncuesta').value == '0') {
            alert('Por favor, elija una Encuesta.');
        } else {
            document.getElementById('formEncuesta').submit();
        }
    } else {
        alert('Por favor, capture el nombre de la Pregunta.');
    }
}

function fnEnviaOpcion() {
    if (document.getElementById('NombreOpcion').value != '') {
        if (document.getElementById('IdPregunta').value == '0') {
            alert('Por favor, elija una Pregunta.');
        } else {
            document.getElementById('formEncuesta').submit();
        }
    } else {
        alert('Por favor, capture el nombre de la Opcion.');
    }
}

function fnGracias(){
    alert("Gracias.");
}

