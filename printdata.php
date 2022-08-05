
  <?php
include('fpdf.php');
require('database.php');
$pdf = new FPDF();
$pdf->AddPage();
$pdf->SetFont('Arial', "B" , 16);

if(isset($_POST['submit']))
 $id=$_POST['id'];
{

        $all_id = $_POST['id'];
        $extract_id = implode(', ' , $all_id);
        $sql = "SELECT * FROM `pakket` WHERE `id` IN ($extract_id)";
        $rows = array();
        $result = $conn-> query($sql);


        while($row = mysqli_fetch_array($result)) {
        
            $rows[] = $row;
            
        }
        foreach ($rows as $row => $value) {
            $host = $value['host'];
            $ip = $value['ip'];

            $pdf->Cell(30, 25, "host: " .$host, 0, 1, );
            $pdf->Cell(30, 25, "ip: " . $ip, 0, 1, );


            
            
}
$pdf->Output();

    }

?>