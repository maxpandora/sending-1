<?php
require('fpdf.php');
require('database.php');


$pdf = new FPDF();

$pdf->AddPage();
$id = $_GET['print'];

$sql = "SELECT * FROM pakket WHERE id='$id'";

$result = $conn->query($sql);

$pdf->SetFont('Arial', "B" , 16);

if ($row = $result->fetch_assoc()) {
$pdf->Cell(30, 25, 'Print player gegevens:', 0, 1, );
$pdf->Line(10, 30 , 200, 30);
$pdf->SetFont('Arial', "", 16);
$pdf->Cell(30, 10,'id', 0, 0, );
$pdf->Cell(30,  10, $row["id"],                0, 1, );
$pdf->Cell(30, 10,'host', 0, 0, );
$pdf->Cell(30, 10,  $row["host"], 0, 1, );
$pdf->Cell(30, 10,'ether', 0, 0, );
$pdf->Cell(30,  10,   $row["ether"],          0, 1, );
$pdf->Cell(30, 10,'ip', 0, 0, );
$pdf->Cell(30,  10,  $row["ip"],                0, 1, );
$pdf->Cell(30, 10,'gateway', 0, 0, );
$pdf->Cell(30,  10,  $row["gateway"],      0, 1, );
$pdf->Cell(30, 10,'netmask', 0, 0, );
$pdf->Cell(30,  10,   $row["netmask"],      0, 1, );
$pdf->Cell(30, 10,'dns', 0, 0, );
$pdf->Cell(30,  10,  $row["dns"],              0, 1, );
$pdf->Cell(30, 10,'netwerk', 0, 0, );
$pdf->Cell(30,  10,   $row["netwerk"],      0, 1, );
$pdf->Cell(30, 10,'datum', 0, 0, );
$pdf->Cell(30,  10,  $row["date"],           0, 1, );

}
$pdf->Output();
