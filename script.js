window.onload = function now() {
    checknow();
}
function checknow(){ 
    var button = document.getElementById("hidebutton");
    const checkboxes = document.querySelectorAll('tr input[type="checkbox"]');
    const allChecked = !Array.from(checkboxes).some(cb => cb.checked == true);
           
    if(!allChecked){ 
        button.style.display = "block";
    }else{ 
        button.style.display = "none";
    }

}