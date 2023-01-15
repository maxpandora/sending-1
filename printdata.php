
  <?php
include('app/fpdf.php');
require('app/database.php');
$pdf = new FPDF();
$pdf->AddPage();

if(isset($_POST['submit']))
 $id=$_POST['id'];
{
   $all_id = $_POST['id'];
   $extract_id = implode(', ' , $all_id);
   $sql = "SELECT * FROM `product` WHERE `id` IN ($extract_id)";
   $rows = array();
   $result = $conn-> query($sql);
   $logo = "images/logo.png";

   $pdf->SetFont('Arial', "B" , 14);
   $pdf->Cell(8, 4, $pdf->Image($logo, $pdf->GetX(), 15, $pdf->GetY(), 8), 2, 1,  false );
   $pdf->Cell(30, 10, 'ENDING', 0, 1, 'R');
   $pdf->Line(10, 30 , 175, 30);
   $pdf->SetFont('Arial', "B" , 12);
   $pdf->Cell(30, 7,"", 0, 1, );
   $pdf->Cell(30, 7,"", 0, 1, );
   $pdf->Cell(30, 7,"", 0, 1, );
   $pdf->Cell(40, 7,"name: ", 1, 0, );
   $pdf->Cell(35, 7, "productype: ", 1, 0, );
   $pdf->Cell(30, 7, "gateway: ", 1, 0, );
   $pdf->Cell(42, 7, "description: ", 1, 0, );
   $pdf->Cell(19, 7, "netwerk: ", 1, 1, );
// test
   while($row = mysqli_fetch_array($result)) {
   
       $rows[] = $row;
       
   }
   foreach ($rows as $row => $value) {

       $name    = $value['name'];
       $productype      = $value['productype'];
       $description   = $value['description'];
       $gateway = $value['gateway'];
       $netmask = $value['netmask'];
       $description     = $value['description'];
       $netwerk = $value['netwerk'];
       

       $pdf->SetFont('Arial', "" , 11);
       $pdf->Cell(40, 7, $name, 1, 0 );
       $pdf->Cell(35, 7, $productype, 1, 0 );
       $pdf->Cell(30, 7, $gateway, 1, 0 );
       $pdf->Cell(42, 7, $description, 1, 0 );
       $pdf->Cell(19, 7, $netwerk, 1, 1 );       
}
$pdf->Output();

}

?>