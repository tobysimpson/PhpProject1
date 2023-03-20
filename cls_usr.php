<?php

require_once "cls_db.php";

class cls_usr {

    public static function check() {
        $usr_id = filter_input(INPUT_COOKIE, "usr_id", FILTER_SANITIZE_NUMBER_INT);
        $db = new cls_db();
//        $qry = $db->conn->prepare("SELECT usr_id FROM usr_info WHERE usr_id = ?;");
        $qry = $db->conn->prepare("UPDATE usr_info SET usr_updated = LOCALTIMESTAMP() WHERE usr_id = ?;");
        $qry->bind_param("i", $usr_id);
        $qry->execute();
        $res = $qry->get_result();
        //manage cookie
        if ($res->num_rows == 1) {
            setcookie("usr_id", $usr_id, time() + (365 * 86400), "/"); // 86400 = 1 day
        } else {
            setcookie("usr_id", "", time() - 3600); //unset
            $usr_id = NULL;
        }
        return $usr_id;
    }

    public static function insert($usr_name) {
        $db = new cls_db();
        $qry = $db->conn->prepare("INSERT INTO usr_info (usr_name) VALUES (?);");
        $qry->bind_param("s", substr($usr_name, 0, 20));
        $qry->execute();
        $usr_id = mysqli_insert_id($db->conn);
        setcookie("usr_id", $usr_id, time() + (365 * 86400), "/"); // 86400 = 1 day
    }

    public static function update($usr_id, $usr_name) {
        $db = new cls_db();
        $qry = $db->conn->prepare("UPDATE usr_info SET usr_updated = LOCALTIMESTAMP(), usr_name = ? WHERE usr_id = ?;");
        $qry->bind_param("si", substr($usr_name, 0, 20), $usr_id);
        $qry->execute();
        setcookie("usr_id", $usr_id, time() + (365 * 86400), "/"); // 86400 = 1 day
    }

}
