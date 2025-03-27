<?php

// Activer les erreurs pendant le développement

// Inclure l'autoload des classes

require_once '..\routes\api.php';


// Initialiser le routeur et traiter la requête
$uri = $_SERVER['REQUEST_URI'];
echo "Vous avez accédé à l'URL : $uri";
