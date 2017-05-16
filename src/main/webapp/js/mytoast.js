/**
 * Created by Beruto on 16/5/17.
 */
function mytoast(title, message) {
    $(document).ready(function () {


        toastr.success(title, message);
    });
}