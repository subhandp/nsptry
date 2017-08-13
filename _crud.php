<?php 

class CRUD{

	private $host = 'localhost';
	private $user = 'root';
	private $pass = '';
	private $db = 'nsp';
	private $con;

	public function __construct(){

		$this->con = mysqli_connect($this->host,$this->user,$this->pass,$this->db);
	}
        

	public function insert($table, $rows){

		$row = null; $value = null; $query = "INSERT INTO $table";

		 foreach ($rows as $key => $nilai){
		      $row  	.=",".$key;
		      $value  	.=", '".$nilai."'";
	     }
		              
	    $query .="(".substr($row,1).")";
	    $query .="VALUES(".substr($value,1).")";
	    $this->con->query($query) or die($this->con->error);
	    return $this->con->affected_rows;
	}

	public function get($table, $where = false, $hitung = false, $queryx = false){
		$query = "SELECT * FROM $table ";

		if ($where) {
			$query.= "WHERE $where";
		}
		if ($queryx) {
			return $query;
		}
		$hasil = $this->con->query($query) or die($this->con->error);


		if ($hitung) {
			return $hasil->num_rows;
		}else{
			return $hasil->fetch_all(MYSQLI_ASSOC);
		}
		
	} 


	public function update($table, $kolom, $where){
		$query = "UPDATE $table SET ";
		$update = null;

		foreach ($kolom as $key => $value) {

			$update .= ",".$key."= '".$value."' ";
		}

		$query.=substr($update, 1)." WHERE $where";
		$this->con->query($query) or die($this->con->error);
		return $this->con->affected_rows;
	}

	public function delete($table, $where){
		$query = "DELETE FROM $table WHERE $where";
		$this->con->query($query) or die($this->con->error);
		return $this->con->affected_rows;
	}


}


 ?>