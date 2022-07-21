<?php
include('fpdf.php');
include('htm_table.php');

    $pdf=new PDF_HTML();
    $pdf->SetFont('Arial','',12);
    $pdf->AddPage();
    $pdf->WriteHTML($htmlTable);
    $pdf->Output();
?>