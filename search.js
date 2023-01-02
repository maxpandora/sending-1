
// function tableclients() {
//     // Get the value of the input element
//     var inputValue = document.getElementById("SearchInput").value;
  
//     // Get all the rows of the table
//     var rows = document.querySelectorAll("table tbody tr");
  
//     // Loop through the rows
//     for (var i = 0; i < rows.length; i++) {
//       var nameCell = rows[i].cells[3]; // The first cell of the row contains the name
//       var name = nameCell.textContent; // Get the text content of the cell (the name)
  
//       if (name.toLowerCase().indexOf(inputValue.toLowerCase()) === -1) {
//         // If the name does not contain the input value, hide the row
//         rows[i].style.display = "none";
//       } else {
//         // Otherwise, show the row
//         rows[i].style.display = "";
//       }
//     }
//     // document.getElementById("resultCount").innerHTML = resultCount + " results found";    

// }

function tableclients() {
    // Get the value of the input element
    var inputValue = document.getElementById("SearchInput").value;
  
    // Get all the rows of the table
    var rows = document.querySelectorAll("table tbody tr");
  
    // Loop through the rows
    var resultCount = 0;
    for (var i = 0; i < rows.length; i++) {
      var nameCell = rows[i].cells[3]; // The first cell of the row contains the name
      var name = nameCell.textContent; // Get the text content of the cell (the name)
  
      if (name.toLowerCase().indexOf(inputValue.toLowerCase()) === -1) {
        // If the name does not contain the input value, hide the row
        rows[i].style.display = "none";
      } else {
        // Otherwise, show the row and increment the result count
        rows[i].style.display = "";
        resultCount++;
      }
    }
    document.getElementById("resultCount").innerHTML = resultCount + " Players gevonden meneer Tibben!";
}  