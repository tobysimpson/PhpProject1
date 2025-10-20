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
        if (strlen($xsl) > 0) {
            $prc = $dom->createProcessingInstruction('xml-stylesheet', 'type="text/xsl" href="' . $xsl . '"');
            $dom->appendChild($prc);
        }
        $root = $dom->createElement('root');
        $dom->appendChild($root);
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
