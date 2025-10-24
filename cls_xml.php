<?php

class cls_xml {
    /*
     * =========================
     * transforms
     * =========================
     */

    public static function file2dom($filename) {
        $dom = new DOMDocument;
        $dom->load($filename);
        return $dom;
    }

    public static function xsltrans($xml, $xsl) {
        $proc = new XSLTProcessor;
        $proc->registerPHPFunctions();
        $proc->importStyleSheet($xsl);
        return $proc->transformToXML($xml);
    }

    public static function procxsl($xml, $xsl) {
        $prc = $xml->createProcessingInstruction('xml-stylesheet', 'type="text/xsl" href="' . $xsl . '"');
        $xml->insertBefore($prc, $xml->documentElement);
        return $xml;
    }

    /*
     * =========================
     * recordsets
     * =========================
     */

    public static function res2tbl($dom, $root, $res) {
        $tbl = $root->appendChild($dom->createElement('tbl'));
        while ($row = $res->fetch_assoc()) {
            $node = $dom->createElement('row');
            foreach ($row as $key => $val) {
                $node->setAttribute($key, $val);
            }
            $tbl->appendChild($node);
        }
    }

    public static function arr2tbl($dom, $root, $arr) {
        $tbl = $root->appendChild($dom->createElement('tbl'));
        foreach ($arr as $row) {
            $node = $dom->createElement('row');
            foreach ($row as $key => $val) {
                $node->setAttribute($key, $val);
            }
            $tbl->appendChild($node);
        }
    }

    /*
     * =========================
     * query
     * =========================
     */

    public static function mul2dom($conn, $xsl = "") {
        $dom = new DOMDocument('1.0', 'utf-8');
        $dom->formatOutput = true;
        //root
        $root = $dom->createElement('root');
        $dom->appendChild($root);
        //xsl (after root)
        if (strlen($xsl) > 0) {
            self::procxsl($dom, $xsl);
        }
        //tables
        do {
            $res = $conn->store_result();
            if ($res) {
                cls_xml::res2tbl($dom, $root, $res);
                $res->free();
            }
        } while ($conn->next_result());
        return $dom;
    }

}
