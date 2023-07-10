<?php



$dom1 = new DOMDocument('1.0', 'utf-8');
$dom1->formatOutput = true;
//$dom1->loadXML("<root/>");
$root = $dom1->createElement('root');
$dom1->appendChild($root);
echo $dom1->saveXML();


$dom2 = new DOMDocument('1.0', 'utf-8');
$dom2->formatOutput = true;
//$dom1->loadXML("<root/>");
$root = $dom2->createElement('root');
$dom2->appendChild($root);
echo $dom2->saveXML();


//import
$node = $dom1->importNode($dom2->firstChild, true);
//append
$dom1->documentElement->appendChild($node);
echo $dom1->saveXML();
