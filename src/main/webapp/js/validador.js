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

