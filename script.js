window.onload = function now() {
    checknow();

}



    function checknow(){ 
        var button = document.getElementById("hidebutton");
        const checkboxes = document.querySelectorAll('tr input[type="checkbox"]');
        const allChecked = !Array.from(checkboxes).some(cb => cb.checked == true);
               
        if(!allChecked){ 
            console.log("show");
            button.style.display = "block";
        }else{ 
            console.log("hide");
            button.style.display = "none";
        }
    
    }