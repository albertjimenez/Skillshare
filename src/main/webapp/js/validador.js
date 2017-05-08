/**
 * Created by Beruto on 22/3/17.
 */

function check() {
    var test = true;
    if (document.getElementById("user").value.trim() == '') {
        Materialize.toast('Usuario en blanco', 4000, 'rounded');
        test = false;
    }
    if (document.getElementById("password").value.trim() == '') {
        Materialize.toast('Contraseña en blanco', 4000, 'rounded');
        test = false;
    }
    return test;
}


function check_register() {

    if (document.getElementById("nif").value.trim() == '') {
        Materialize.toast('Nif en blanco', 4000, 'rounded');
        return false;
    }
    if (document.getElementById("password1").value.trim() == '') {
        Materialize.toast('Contraseña en blanco', 4000, 'rounded');
        return false;
    }
    // if (document.getElementById("passwordAgain").value.trim() == '') {
    //     Materialize.toast('Contraseña 2 en blanco', 4000, 'rounded');
    //     test = false;
    // }
    if (document.getElementById("name").value.trim() == '') {
        Materialize.toast('Nombre en blanco', 4000, 'rounded');
        return false;
    }
    if (document.getElementById("surname").value.trim() == '') {
        Materialize.toast('Apellidos en blanco', 4000, 'rounded');
        return false;
    }
    if (document.getElementById("email").value.trim() == '') {
        Materialize.toast('Email en blanco', 4000, 'rounded');
        return false;
    }
    var emailUji = document.getElementById("email").value.trim().toLowerCase();

    if (!emailUji.includes("@uji.es")) {
        Materialize.toast('Email no asociado a la UJI', 4000, 'rounded');
        return false;
    }

    if (document.getElementById("degree").value.trim() == '') {
        Materialize.toast('Titulación actual en blanco', 4000, 'rounded');
        return false;
    }
    // if (document.getElementById("course").value.trim() == '') {
    //     Materialize.toast('Curso en blanco', 4000, 'rounded');
    //     return false;
    // }
    // var course = parseInt(document.getElementById("course").value.trim());
    // if (isNaN(course)) {
    //     Materialize.toast('Curso inválido', 4000, 'rounded');
    //     return false;
    // }
    if (course <= 0 || course >= 6) {
        Materialize.toast('Curso excesivo, revisa el número', 4000, 'rounded');
        return false;
    }

    return true;

}

function white_spaces() {
    if (document.getElementById("name").value.indexOf(' ') > 0) {
        Materialize.toast('El nombre es solo una palabra no varias!', 4000, 'rounded');
        return false;
    }
    return true;
}

function checkProposal() {
    if (document.getElementById("description").value.trim() == '') {
        Materialize.toast('Descripción vacía', 4000, 'rounded');
        return false;
    }
    if (document.getElementById("initialDate").value.trim() == '') {
        Materialize.toast('Fecha inicial vacía', 4000, 'rounded');
        return false;
    }
    if (document.getElementById("finishDate").value.trim() == '') {
        Materialize.toast('Fecha final vacía', 4000, 'rounded');
        return false;
    }
    return true;
}

function checkBanned() {
    if (document.getElementById("nif").value.trim() == '') {
        Materialize.toast('NIF vacío', 4000, 'rounded');
        return false;
    }
    return true;
}

