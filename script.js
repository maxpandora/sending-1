

        window.onload = function now() {
        var button = document.getElementById("hidebutton");
        button.style.display = "none";
        }

        function checknow(){ 
        var button = document.getElementById("hidebutton");
        var checkboxes = document.querySelectorAll('[id="' + hidecheckbox + '"]');
        var test = checkboxes.checked = true;
               
        if(test){ 
            console.log("show");

            button.style.display = "block";
        }else{ 
            console.log("hide");
            button.style.display = "none";
        }

    }
    


 