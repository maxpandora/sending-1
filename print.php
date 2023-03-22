<?php
require('app/fpdf.php');
require('app/database.php');


$pdf = new FPDF();
$logo = "images/logo.png";
$pdf->AddPage();
$id = $_GET['print'];

$sql = "SELECT * FROM pakket WHERE id='$id'";

$result = $conn->query($sql);

$pdf->SetFont('Arial', "B" , 16);

if ($row = $result->fetch_assoc()) {
$pdf->Cell(10, 5, $pdf->Image($logo, $pdf->GetX(), 15, $pdf->GetY(), 7.78), 0, 1,  false );
$pdf->Cell(55, 10, 'SCREENIMPACT', 0, 1, 'R');
$pdf->Cell(30, 25, 'player specificatie:', 0, 1, );
$pdf->Line(10, 30 , 200, 30);
$pdf->SetFont('Arial', "", 14);
$pdf->Cell(50, 10,'Player nummer', 0, 0, );
$pdf->Cell(50,  10, $row["id"], 0, 1, );
$pdf->Cell(50, 10,'Hostname:', 0, 0, );
$pdf->Cell(30, 10,  $row["host"], 0, 1, );
$pdf->Cell(50, 10,'Ether/Mac-adres:', 0, 0, );
$pdf->Cell(30,  10,   $row["ether"],0, 1, );
$pdf->Cell(50, 10,'Ip-adres:', 0, 0, );
$pdf->Cell(30,  10,  $row["ip"], 0, 1, );
$pdf->Cell(50, 10,'Gateway:', 0, 0, );
$pdf->Cell(30,  10,  $row["gateway"],0, 1, );
$pdf->Cell(50, 10,'Netmask:', 0, 0, );
$pdf->Cell(30,  10,   $row["netmask"],0, 1, );
$pdf->Cell(50, 10,'DNS:', 0, 0, );
$pdf->Cell(30,  10,  $row["dns"],  0, 1, );
$pdf->Cell(50, 10,'Netwerk configuratie:', 0, 0, );
$pdf->Cell(30,  10,   $row["netwerk"],  0, 1, );
$pdf->Cell(50, 30,'Aangemaakt op:', 0, 0, );
$pdf->Cell(50,  30,  $row["date"],  0, 1, );

}
$pdf->Output();

