/**
 * Created by arif on 9/1/16.
 */


jQuery(document).ready(initLogin);

function initLogin(){
    jQuery("#signInForm").submit( function (e) {
        e.preventDefault();
        jQuery.ajax({
            "type": "post",
            "url": "/home/sign_in_post",
            data : {username: $("#username").val(), password: $("#password").val()},
            success: function (response) {
                if(response.status == 0){
                    $("#signInError").removeClass("hidden alert-success").addClass("alert-danger").html("Username or password is incorrect.");
                }else{
                    $("#signInError").removeClass("hidden alert-danger").addClass("alert-success").html("Successfuly loged in.");
                        location.href = "/lecturer/dashboard"; 
                }
            }
        })
    })
}