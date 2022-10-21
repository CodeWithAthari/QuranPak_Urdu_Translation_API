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
$versions =array("ur_qadri","ur_maududi");
echo json_encode(main());

function main()
{

    if (!isset($_GET['v'])) {
        $final = array("status" => "failed", "message" => "Please specifiy the Version", "data" => null);

        return $final;
    }
global $versions;

if(!isset($_GET['errors']) ||!$_GET['errors'] == false ){
    if(!in_array($_GET['v'],$versions)){
        $final = array("status" => "failed", "message" => "Unknown Version set error to true for any version or Specify the version e.g ur_maududi", "data" => null);

        return $final;
    }

}
else{
    $_GET['v'] = $versions[1];
}

  

    if (!isset($_GET['q'])) {
        $final = array("status" => "failed", "message" => "Please specifiy the Query", "data" => null);

        return $final;
    }

    $type = $_GET['q'];

    switch ($type) {

        case 'get_aya':
            return getAyaFromQuran();
            /*
           PARAMETERS:
            aya_no --- Which Aya you want...
           */
            break;

        case 'get_page':
            return getperPage();
            /*
           PARAMETERS:
            page_no --- Which Page you want...
            Each page contains 10 ayas.. You can customize it in code
           */
            break;

        case 'get_random':
            return getRandomAya();
            /*
           PARAMETERS:
           No Params Requires
           */
            break;
        case 'get_sura':
            return getSura();
            /*
           PARAMETERS:
            sura_no --- Which Sura you want...
           */
            break;
        case 'get_sura_meta':
            return getAllSurahMeta();
            /*
           PARAMETERS:
           No Params Requires
           */
            break;
        case 'get_sura_meta_one':
            return getAllSurahMetaOne();
            /*
               PARAMETERS:
               No Params Requires
               */
            break;
        case 'get_aya_from_sura':
            return getAyaFromSura();
            /*
           PARAMETERS:
          sura_no -- In Which SURA you want to get aya
          aya_no --  From specific sura whcih aya you want
           */
            break;
    }
}

function getAllSurahMetaOne()
{


    global $conn;



    if (!isset($_GET['sura_no'])) {
        $final = array("status" => "failed", "message" => "Please specifiy the Sura no", "sura" => null);

        return $final;
    }
    $surano = $_GET['sura_no'];

    $query = "SELECT * FROM `suras_meta` WHERE `id` = " . $surano;
    $result = mysqli_query($conn, $query);
    $arrSurahs = array();
    if (mysqli_num_rows($result) >= 1) {
        while ($value = mysqli_fetch_assoc($result)) {

            $arr = array(
                "id" => $value['id'], "sindex" => $value["sindex"], "ayas" => $value["ayas"], "start" => $value["start"], "name" => $value["name"],
                "tname" => $value['tname'], "ename" => $value['ename'], "type" => $value['type'], "sorder" => $value['sorder'], "rukus" => $value['rukus']
            );

            array_push($arrSurahs, $arr);
        }
    } else {
        $final = array("status" => "failed", "message" => "Unknown Sura No", "sura" => null);

        return $final;
    }

    $final = array("status" => "Success", "message" => "Suras Meta Found", "Sura" => $arrSurahs);

    return $final;
}

function getAllSurahMeta()
{


    global $conn;


    $query = "SELECT * FROM `suras_meta`";
    $result = mysqli_query($conn, $query);
    $arrSurahs = array();
    if (mysqli_num_rows($result) >= 1) {
        while ($value = mysqli_fetch_assoc($result)) {

            $arr = array(
                "id" => $value['id'], "sindex" => $value["sindex"], "ayas" => $value["ayas"], "start" => $value["start"], "name" => $value["name"],
                "tname" => $value['tname'], "ename" => $value['ename'], "type" => $value['type'], "sorder" => $value['sorder'], "rukus" => $value['rukus']
            );

            array_push($arrSurahs, $arr);
        }
    }

    $final = array("status" => "Success", "message" => "Suras Meta Found", "Sura" => $arrSurahs);

    return $final;
}

function getAyaFromSura()
{

    // SELECT * FROM `quran_text` WHERE `sura` = 2 AND `aya` = 10
    $artext = '';
    $arindex = '';
    $arsura = '';
    $araya = '';

    $urtext = '';
    $urindex = '';
    $ursura = '';
    $uraya = '';


    $v = $_GET['v'];

    global $conn;


    if (!isset($_GET['sura_no'])) {
        $final = array("status" => "failed", "message" => "Please specifiy the Surah no", "aya" => null);

        return $final;
    }

    if (!isset($_GET['aya_no'])) {
        $final = array("status" => "failed", "message" => "Please specifiy the Aya no", "aya" => null);

        return $final;
    }




    $surahnumber = $_GET['sura_no'];

    $ayanumber = $_GET['aya_no'];


    $query = "SELECT * FROM `quran_text` WHERE `sura` = " . $surahnumber . " AND `aya` = " . $ayanumber;
    $result = mysqli_query($conn, $query);
    $arabic = array();
    $urdu = array();
    if (mysqli_num_rows($result) >= 1) {
        while ($value = mysqli_fetch_assoc($result)) {


            $arindex =   $value['index'];
            $arsura =   $value['sura'];
            $araya =   $value['aya'];
            $artext =   $value['text'];

            $arr = array("index" => $arindex, "sura" => $arsura, "aya" => $araya, "text" => $artext);
            array_push($arabic, $arr);
        }
    } else {
        $final = array("status" => "failed", "message" => "aya not found", "aya" => null);

        return $final;
    }

    $query = "SELECT * FROM `$v` WHERE `sura` = " . $surahnumber . " AND `aya` = " . $ayanumber;


    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) >= 1) {
        while ($value = mysqli_fetch_assoc($result)) {


            $urindex =   $value['index'];
            $ursura =   $value['sura'];
            $uraya =   $value['aya'];
            $urtext =   $value['text'];

            $arr = array("index" => $urindex, "sura" => $ursura, "aya" => $uraya, "text" => $urtext);
            array_push($urdu, $arr);
        }
    }


    $final = array("status" => "Success","version"=>$v, "message" => "aya found", "aya" => array("arabic" => $arabic, "urdu" => $urdu));

    return $final;
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

    $v = $_GET['v'];
    global $conn;
    if (!isset($_GET['aya_no'])) {
        $final = array("status" => "failed", "message" => "Please specifiy the aya no", "aya" => null);

        return $final;
    }
    $aya = $_GET['aya_no'];



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

    $query = "SELECT * FROM `$v` WHERE `index` = " . $aya;
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


    $final = array("status" => "Success","version"=>$v, "message" => "aya found", "aya" => array("arabic" => $arabic, "urdu" => $urdu));

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
    $v = $_GET['v'];
    if (!isset($_GET['page_no'])) {
        $final = array("status" => "failed", "message" => "Please specifiy the page no", "page_content" => null);

        return $final;
    }
    $page = $_GET['page_no'] * 10;
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





    $query = "SELECT * FROM `$v`WHERE `index` BETWEEN $lowPage and $page";

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

    $final = array("status" => "Success","version"=>$v, "message" => "page found", "page_content" => array("arabic" => $arabic, "urdu" => $urdu));

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
    $v = $_GET['v'];
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

            $arr = array("index" => $arindex, "sura" => $arsura, "aya" => $araya, "text" => $artext);
            array_push($arabic, $arr);
        }
    } else {
        $final = array("status" => "failed", "message" => "aya not found", "aya" => null);

        return $final;
    }






    $query = "SELECT * FROM `$v` WHERE `index` = " . $random;
    // echo $query;

    $result = mysqli_query($conn, $query);
    $urdu = array();

    if (mysqli_num_rows($result) >= 1) {
        while ($value = mysqli_fetch_assoc($result)) {


            $urindex =   $value['index'];
            $ursura =   $value['sura'];
            $uraya =   $value['aya'];
            $urtext =   $value['text'];

            $arr = array("index" => $urindex, "sura" => $ursura, "aya" => $uraya, "text" => $urtext);
            array_push($urdu, $arr);
        }
    }

    $final = array("status" => "Success","version"=>$v, "message" => "aya found", "aya" => array("arabic" => $arabic, "urdu" => $urdu));

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
    $v = $_GET['v'];
    if (!isset($_GET['sura_no'])) {
        $final = array("status" => "failed", "message" => "Please specifiy the sura no", "sura" => null);

        return $final;
    }
    $sura = $_GET['sura_no'];

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

            $arr = array("index" => $arindex, "sura" => $arsura, "aya" => $araya, "text" => $artext);
            array_push($arabic, $arr);
        }
    } else {
        $final = array("status" => "failed", "message" => "sura not found", "sura" => null);

        return $final;
    }

    $query = "SELECT * FROM `$v` WHERE `sura` = " . $sura;
    $result = mysqli_query($conn, $query);
    if (mysqli_num_rows($result) >= 1) {
        while ($value = mysqli_fetch_assoc($result)) {

            $urindex =   $value['index'];
            $ursura =   $value['sura'];
            $uraya =   $value['aya'];
            $urtext =   $value['text'];

            $arr = array("index" => $urindex, "sura" => $ursura, "aya" => $uraya, "text" => $urtext);
            array_push($urdu, $arr);
        }
    }

    $final = array("status" => "Success","version"=>$v, "message" => "sura found", "sura" => array("arabic" => $arabic, "urdu" => $urdu));

    return $final;
}
