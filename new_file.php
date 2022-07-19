<?php 
require ('fpdf.php');
$pdf=new FPDF();
$pdf->AddPage();
$pdf->SetFont('Arial','B', 16);
$pdf->Cell(80,10,'hello world');
$pdf->Output('myfile.PDF','I'); 
?>