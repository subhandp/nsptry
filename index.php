<?php

class Nsp {
    // ATURAN Off:
    // 2 shift malam = libur 2 hari
    // 2-3 shift sore =  1 hari libur
    // ATURAN MIN BIDAN
    // Pagi     = min 3(S), min 4(J)
    // Siang    = min 2(S), min 4(J)
    // Malam    = min 1(S), min 3(J)
    private $host, $user, $pass, $dbName, $db, $hari;
    private $individu, $populasi, $linkungan, $evolusi, $bidan, $shift, $dutyOff;
    
    function __construct() {
        $this->hari = 30; $this->populasi = 2; $this->evolusi = 1;
        $this->host = 'localhost'; $this->user = 'root'; $this->pass = ''; $this->dbName = 'nsp';  
        $this->db = mysqli_connect($this->host,$this->user,$this->pass,$this->dbName);
        $this->shift = ['P/Pagi','S/Siang','M/Malam'];
        $this->Cuti = ['CT/Cuti Tahunan', 'CM/Cuti Melahirkan'];
        $this->init_bidan();
    }
    
    function init_bidan(){
        $this->bidan = [];
        $var = $this->db->query("SELECT nurse.nurse_id, nurse.nurse_name, nurse_officer.nurse_officer_kind FROM nurse JOIN nurse_officer ON nurse.nurse_officer_id = nurse_officer.nurse_officer_id")or die($this->db->error);
        $bidanDb = $var->fetch_all(MYSQLI_ASSOC);
        foreach ($bidanDb as $value) {
            $detail = ['id_bidan' => $value['nurse_id'], 'nama_bidan' => $value['nurse_name'], 'jenis_bidan' => $value['nurse_officer_kind']];
            array_push($this->bidan, $detail);
        }

    }
//    function fix_shift_off($individu){
//        $malam = 0;
//        foreach ($individu as $key1 => $value) {
//            foreach ($value as $key2 => $shift) {
//                if($shift == 'M'){
//                    $malam += 1;
//                    if($malam == 2){
//                        echo "[$key1][$key2] ";
//                        $individu[$key1][$key2]= 'O';
//                        $malam = 0;
//                    }
//                }
//                else{
//                    $malam = 0;
//                }
//            }
//        }
//        
//        return $individu;
//    }
    
    function generate_random_shift(){
        $bidanShift = [];
        //generate bidan ramdom shift full periode
        for ($index1 = 0; $index1 < $this->hari; $index1++) {
            $shift =  explode('/', $this->shift[mt_rand(0,2)])[0];
            array_push( $bidanShift, $shift);  
        } 
        
        return $bidanShift;
    }
    
    function populasi_awal(){
        //print_r($this->bidan);
        $this->linkungan = []; $this->individu = [];
        for ($index2 = 0; $index2 < $this->populasi; $index2++) {
            $this->individu = [];
            for ($index = 0; $index < count($this->bidan); $index++) {
                //init individu shift periode
                array_push($this->individu, $this->generate_random_shift()); 
            }
//            $this->individu = $this->fix_shift_off($this->individu);
            array_push($this->linkungan, $this->individu);
        }
        return $this->linkungan;
    }
    
    function print_individu($individu){
        foreach ($individu as $key => $value) {
            $day = 1;
            foreach ($value as $shift) {
                echo "($day)".$shift." ";
                if($day >= 7){
                    $day = 1;
                }
                else{
                    $day++;
                }
            }
            echo '['.$this->bidan[$key]['nama_bidan'].']';
            echo "\n\n";
        }
    }
    

}

$nsp = new Nsp();
$lingkungan = $nsp->populasi_awal();
foreach ($lingkungan as $value) {
    $nsp->print_individu($value);
    echo "\n\n-----------------------------------------------------\n\n";
}


$time = microtime(true) - $_SERVER["REQUEST_TIME_FLOAT"];
echo "\n\nProcess Time: $time";

?>