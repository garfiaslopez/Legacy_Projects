<?php

/* Values received via ajax */
	$id = $_POST['id'];
	$title = $_POST['title'];
	$start = $_POST['start'];
	$end = $_POST['end'];
	$description= $_POST['description'];
	$url = $_POST['url'];
	// connection to the database
	try {

	 	$bdd = new PDO('mysql:host=localhost;dbname=Nocturne', 'fermunozroot', 'a8779402294F');
	 
	 } catch(Exception $e) {

		exit('Unable to connect to database.');

	}
	 // update the records
	$sql = "UPDATE evenement SET title='$title', description='$description', url='$url', start='$start', end='$end' WHERE id='$id'";
	
	$q = $bdd->prepare($sql);
	
	$q->execute(array($title,$description,$url,$start,$end,$id));

?>