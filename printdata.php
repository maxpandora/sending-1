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
   $sql = "SELECT * FROM `pakket` WHERE `id` IN ($extract_id)";
   $rows = array();
   $result = $conn-> query($sql);
   $logo = "images/logo.png";

   $pdf->SetFont('Arial', "B" , 14);
   $pdf->Cell(8, 4, $pdf->Image($logo, $pdf->GetX(), 15, $pdf->GetY(), 8), 2, 1,  false );
   $pdf->Cell(30, 10, 'ENDING', 0, 1, 'R');
   $pdf->Line(10, 30 , 175, 30);

   $pdf->SetFont('Arial', "B" , 12);
   $pdf->Cell(30, 7,"", 0, 1);
   $pdf->Cell(30, 7,"", 0, 1);
   $pdf->Cell(30, 7,"", 0, 1);
   $pdf->Cell(40, 7,"id: ", 1, 0);
   $pdf->Cell(40, 7,"host: ", 1, 0);
   $pdf->Cell(35, 7, "ip: ", 1, 0);
   $pdf->Cell(42, 7, "ether: ", 1, 0);
   $pdf->Cell(19, 7, "netwerk: ", 1, 1);

   while($row = mysqli_fetch_array($result)) {
   
       $rows[] = $row;
       
   }

   $ids="";
   foreach ($rows as $row => $value) {

       $id      = $value['id'];
       $ids    .= $value['id'] . "-"; 
       $host    = $value['host'];
       $ip      = $value['ip'];
       $ether   = $value['ether'];
       $netmask = $value['netmask'];
       $ether   = $value['ether'];
       $netwerk = $value['netwerk'];
       

       $pdf->SetFont('Arial', "" , 11);
       $pdf->Cell(40, 7, $id, 1, 0 );
       $pdf->Cell(40, 7, $host, 1, 0 );
       $pdf->Cell(35, 7, $ip, 1, 0 );
       $pdf->Cell(42, 7, $ether, 1, 0 );
       $pdf->Cell(19, 7, $netwerk, 1, 1 );       
}
$ids = substr($ids,0,-1);
$pdf->Output('I', "Sending players $ids");

}

?>