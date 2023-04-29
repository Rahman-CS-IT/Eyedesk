let state = false;

function passwordToggle(){
    if(state){
        document.getElementById("password").setAttribute("type", "password");
        document.getElementById("eye").classList.remove('fa-eye-slash');
        document.getElementById("eye").style.color = "#696969";
        state = false;
    }else{
        document.getElementById("password").setAttribute("type", "text");
        document.getElementById("eye").classList.add('fa-eye-slash');
        document.getElementById("eye").style.color = "#1757C2";
        state = true;
    }
}
