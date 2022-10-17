<?php

/*
This Project is based on https://tanzil.net/ 
Tanzil.net provide all Quran Pak in sql format
______________________________________________
You are allowed to use this Quran Pak with Urdu Translation api project anywhere.
You can create application website or anything you want feel free to use this project without 
any credit and no worries of copyright. Jazakallah


*/


require "con.php";
echo json_encode(main());

function main()
{

    if (!isset($_GET['q'])) {
        $final = array("status" => "failed", "message" => "Please specifiy the Query", "data" => null);

        return $final;
    }

    $type = $_GET['q'];

    switch ($type) {

        case 'aya':
            return getAyaFromQuran();
            break;

        case 'page':
            return getperPage();
            break;

        case 'random':
            return getRandomAya();
            break;
        case 'sura':
            return getSura();
            break;
    }
}


function getAyaFromQuran()
{
    $artext = '';
    $arindex = '';
    $arsura = '';
    $araya = '';

    $urtext = '';
    $urindex = '';
    $ursura = '';
    $uraya = '';


    global $conn;
    if (!isset($_GET['aya'])) {
        $final = array("status" => "failed", "message" => "Please specifiy the aya no", "aya" => null);

        return $final;
    }
    $aya = $_GET['aya'];



    $query = "SELECT * FROM `quran_text` WHERE `index` = " . $aya;
    $result = mysqli_query($conn, $query);
    $arabic = array();
    $urdu = array();
    if (mysqli_num_rows($result) >= 1) {
        while ($value = mysqli_fetch_assoc($result)) {


            $arindex =   $value['index'];
            $arsura =   $value['sura'];
            $araya =   $value['aya'];
            $artext =   $value['text'];

            $arr = array($arindex => array("index" => $arindex, "sura" => $arsura, "aya" => $araya, "text" => $artext));
            array_push($arabic, $arr);
        }
    } else {
        $final = array("status" => "failed", "message" => "aya not found", "aya" => null);

        return $final;
    }

    $query = "SELECT * FROM `ur_qadri` WHERE `index` = " . $aya;
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) >= 1) {
        while ($value = mysqli_fetch_assoc($result)) {


            $urindex =   $value['index'];
            $ursura =   $value['sura'];
            $uraya =   $value['aya'];
            $urtext =   $value['text'];

            $arr = array($urindex => array("index" => $urindex, "sura" => $ursura, "aya" => $uraya, "text" => $urtext));
            array_push($urdu, $arr);
        }
    }


    $final = array("status" => "Success", "message" => "aya found", "aya" => array("arabic" => $arabic, "urdu" => $urdu));

    return $final;
}


function getperPage()
{
    $artext = '';
    $arindex = '';
    $arsura = '';
    $araya = '';

    $urtext = '';
    $urindex = '';
    $ursura = '';
    $uraya = '';
    if (!isset($_GET['page'])) {
        $final = array("status" => "failed", "message" => "Please specifiy the page no", "page_content" => null);

        return $final;
    }
    $page = $_GET['page'] * 10;
    $lowPage = $page - 10;


    if ($page > 625) {
        //    Limit code here
    }


    global $conn;


    $query = "SELECT * FROM `quran_text`WHERE `index` BETWEEN $lowPage and $page";

    $result = mysqli_query($conn, $query);
    $arabic = array();

    if (mysqli_num_rows($result) >= 1) {
        while ($value = mysqli_fetch_assoc($result)) {


            $arindex =   $value['index'];
            $arsura =   $value['sura'];
            $araya =   $value['aya'];
            $artext =   $value['text'];

            $arr = array($arindex => array("index" => $arindex, "sura" => $arsura, "aya" => $araya, "text" => $artext));
            array_push($arabic, $arr);
        }
    } else {
        $final = array("status" => "failed", "message" => "page not found", "page_content" => null);

        return $final;
    }





    $query = "SELECT * FROM `ur_qadri`WHERE `index` BETWEEN $lowPage and $page";

    $result = mysqli_query($conn, $query);
    $urdu = array();

    if (mysqli_num_rows($result) >= 1) {
        while ($value = mysqli_fetch_assoc($result)) {


            $urindex =   $value['index'];
            $ursura =   $value['sura'];
            $uraya =   $value['aya'];
            $urtext =   $value['text'];

            $arr = array($urindex => array("index" => $urindex, "sura" => $ursura, "aya" => $uraya, "text" => $urtext));
            array_push($urdu, $arr);
        }
    }

    $final = array("status" => "Success", "message" => "page found", "page_content" => array("arabic" => $arabic, "urdu" => $urdu));

    return $final;
}
// echo json_encode(getRandomaya());
function getRandomAya()
{
    $artext = '';
    $arindex = '';
    $arsura = '';
    $araya = '';

    $urtext = '';
    $urindex = '';
    $ursura = '';
    $uraya = '';

    $random = mt_rand(1, 6236);

    global $conn;


    $query = "SELECT * FROM `quran_text`WHERE `index` = " . $random;

    $result = mysqli_query($conn, $query);
    $arabic = array();

    if (mysqli_num_rows($result) >= 1) {
        while ($value = mysqli_fetch_assoc($result)) {


            $arindex =   $value['index'];
            $arsura =   $value['sura'];
            $araya =   $value['aya'];
            $artext =   $value['text'];

            $arr = array($arindex => array("index" => $arindex, "sura" => $arsura, "aya" => $araya, "text" => $artext));
            array_push($arabic, $arr);
        }
    } else {
        $final = array("status" => "failed", "message" => "aya not found", "aya" => null);

        return $final;
    }






    $query = "SELECT * FROM `ur_qadri`WHERE `index` = " . $random;

    $result = mysqli_query($conn, $query);
    $urdu = array();

    if (mysqli_num_rows($result) >= 1) {
        while ($value = mysqli_fetch_assoc($result)) {


            $urindex =   $value['index'];
            $ursura =   $value['sura'];
            $uraya =   $value['aya'];
            $urtext =   $value['text'];

            $arr = array($urindex => array("index" => $urindex, "sura" => $ursura, "aya" => $uraya, "text" => $urtext));
            array_push($urdu, $arr);
        }
    }

    $final = array("status" => "Success", "message" => "aya found", "aya" => array("arabic" => $arabic, "urdu" => $urdu));

    return $final;
}

// echo json_encode(getaya());
function getSura()
{
    global $conn;

    $artext = '';
    $arindex = '';
    $arsura = '';
    $araya = '';

    $urtext = '';
    $urindex = '';
    $ursura = '';
    $uraya = '';

    if (!isset($_GET['sura'])) {
        $final = array("status" => "failed", "message" => "Please specifiy the sura no", "sura" => null);

        return $final;
    }
    $sura = $_GET['sura'];

    $arabic = array();
    $urdu = array();

    $query = "SELECT * FROM `quran_text` WHERE `sura` = " . $sura;

    $result = mysqli_query($conn, $query);
    if (mysqli_num_rows($result) >= 1) {
        while ($value = mysqli_fetch_assoc($result)) {

            $arindex =   $value['index'];
            $arsura =   $value['sura'];
            $araya =   $value['aya'];
            $artext =   $value['text'];

            $arr = array($arindex => array("index" => $arindex, "sura" => $arsura, "aya" => $araya, "text" => $artext));
            array_push($arabic, $arr);
        }
    } else {
        $final = array("status" => "failed", "message" => "sura not found", "sura" => null);

        return $final;
    }

    $query = "SELECT * FROM `ur_qadri` WHERE `sura` = " . $sura;
    $result = mysqli_query($conn, $query);
    if (mysqli_num_rows($result) >= 1) {
        while ($value = mysqli_fetch_assoc($result)) {

            $urindex =   $value['index'];
            $ursura =   $value['sura'];
            $uraya =   $value['aya'];
            $urtext =   $value['text'];

            $arr = array($urindex => array("index" => $urindex, "sura" => $ursura, "aya" => $uraya, "text" => $urtext));
            array_push($urdu, $arr);
        }
    }

    $final = array("status" => "Success", "message" => "sura found", "sura" => array("arabic" => $arabic, "urdu" => $urdu));

    return $final;
}
