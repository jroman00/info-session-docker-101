<?php

use Jroman00\App\Romantest;

require_once('../vendor/autoload.php');

date_default_timezone_set('America/New_York');

$romantest = new Romantest;

echo '<h1>Hello world!</h1>';
echo '<br>';
echo '<b>Current time</b>: ' . $romantest->getCurrentTime();
echo '<br>';
