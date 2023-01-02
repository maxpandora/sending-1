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


function searchtable() {
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("SearchInput");
    filter = input.value.toLowerCase();
    table = document.getElementById("queuetable");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
      td = tr[i].getElementsByTagName("td")[2];
      if (td) {
        txtValue = td.textContent || td.innerText;
        if (txtValue.toLowerCase().indexOf(filter) > -1) {
          tr[i].style.display = "";
        } else {
          tr[i].style.display = "none";
        }
      }       
    }
  

}
