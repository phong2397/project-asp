function checkbox(){
    var check = document.getElementById("checkregis");
    var memdiv = document.getElementById("mem-reg");
    if (check.checked == true) {
        memdiv.style.display = "block";
        
        document.getElementById("cardnum").disabled = false;
        document.getElementById("nameoncard").disabled = false;
        document.getElementById("sccode").disabled = false;
    } else {
        memdiv.style.display = "none";
           
        document.getElementById("cardnum").disabled = true;
        document.getElementById("nameoncard").disabled = true;
        document.getElementById("sccode").disabled = true;
    }
}