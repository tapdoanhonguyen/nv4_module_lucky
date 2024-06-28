<?php

/**
 * @Project NUKEVIET 4.x
 * @Author TMS Holdings <contact@thuongmaiso.vn>
 * @Copyright (C) 2017 TMS Holdings. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate 04/18/2017 09:47
 */

if (!defined('NV_MAINFILE')) {
    die('Stop!!!');
}



/**
 * nv_get_price()
 *
 * @param mixed $pro_id
 * @param mixed $currency_convert
 * @param mixed $number
 * @param mixed $per_pro
 * @return
 */
function nv_get_price($pro_id, $currency_convert, $number = 1, $per_pro = false, $module = '')
{
   
    global $db, $db_config, $site_mods, $module_data, $global_array_shops_cat, $pro_config, $money_config, $discounts_config;

    $return = array();
    $discount_percent = 0;
    $discount_unit = '';
    $discount = 0;

    $module_data = !empty($module) ? $site_mods[$module]['module_data'] : $module_data;
    $product = $db->query('SELECT listcatid, product_price, money_unit, price_config, saleprice, discount_id FROM ' . $db_config['prefix'] . '_' . $module_data . '_rows WHERE id = ' . $pro_id)->fetch();

    $price = $product['product_price'];

    if (!$per_pro) {
        $price = $price * $number;
    }

    $r = $money_config[$product['money_unit']]['round'];
    $decimals = nv_get_decimals($currency_convert);

    if ($r > 1) {
        $price = round($price / $r) * $r;
    } else {
        $price = round($price, $decimals);
    }

    if ($global_array_shops_cat[$product['listcatid']]['typeprice'] == 2) {
        $_price_config = unserialize($product['price_config']);
        if (!empty($_price_config)) {
            foreach ($_price_config as $_p) {
                if ($number <= $_p['number_to']) {
                    $price = $_p['price'] * (!$per_pro ? $number : 1);
                    break;
                }
            }
        }
    } elseif ($global_array_shops_cat[$product['listcatid']]['typeprice'] == 1) {
        if (isset($discounts_config[$product['discount_id']])) {
            $_config = $discounts_config[$product['discount_id']];
            if ($_config['begin_time'] < NV_CURRENTTIME and ($_config['end_time'] > NV_CURRENTTIME or empty($_config['end_time']))) {
                foreach ($_config['config'] as $_d) {
                    if ($_d['discount_from'] <= $number and $_d['discount_to'] >= $number) {
                        $discount_percent = $_d['discount_number'];
                        if ($_d['discount_unit'] == 'p') {
                            $discount_unit = '%';
                            $discount = ($price * ($discount_percent / 100));
                        } else {
                            $discount_unit = ' ' . $pro_config['money_unit'];
                            $discount = $discount_percent * $number;
                        }
                        break;
                    }
                }
            }
        }
    }elseif ($pro_config['saleprice_active'] && $global_array_shops_cat[$product['listcatid']]['typeprice'] == 0 && !empty($product['saleprice'])) {
        $discount = $product['product_price'] - $product['saleprice'];
        $discount_percent = ($discount * 100) / $product['product_price'];
    }

    $price = nv_currency_conversion($price, $product['money_unit'], $currency_convert);

    $return['price'] = $price; // Giá sản phẩm chưa format
    $return['price_format'] = nv_number_format($price, $decimals); // Giá sản phẩm đã format

    $return['discount'] = $discount; // Số tiền giảm giá sản phẩm chưa format
    $return['discount_format'] = nv_number_format($discount, $decimals); // Số tiền giảm giá sản phẩm đã format
    $return['discount_percent'] = $discount_unit == '%' ? $discount_percent : nv_number_format($discount_percent, $decimals); // Giảm giá theo phần trăm
    $return['discount_unit'] = $discount_unit; // Đơn vị giảm giá

    $return['sale'] = $price - $discount; // Giá bán thực tế của sản phẩm
    $return['sale_format'] = nv_number_format($return['sale'], $decimals); // Giá bán thực tế của sản phẩm đã format
    $return['unit'] = $money_config[$currency_convert]['symbol'];

    return $return;
}

/**
 * nv_currency_conversion()
 *
 * @param mixed $price
 * @param mixed $currency_curent
 * @param mixed $currency_convert
 * @return
 */
function nv_currency_conversion($price, $currency_curent, $currency_convert)
{
    global $pro_config, $money_config, $discounts_config;

    if ($currency_curent == $pro_config['money_unit']) {
        $price = $price / $money_config[$currency_convert]['exchange'];
    } elseif ($currency_convert == $pro_config['money_unit']) {
        $price = $price * $money_config[$currency_curent]['exchange'];
    }

    return $price;
}

/**
 * nv_number_format()
 *
 * @param mixed $number
 * @param integer $decimals
 * @return
 */
function nv_number_format($number, $decimals = 0)
{
    global $money_config, $pro_config;

    $number_format = explode('||', $money_config[$pro_config['money_unit']]['number_format']);
    $str = number_format($number, $decimals, $number_format[0], $number_format[1]);

    return $str;
}

/**
 * nv_get_decimals()
 *
 * @param mixed $currency_convert
 * @return
 */
function nv_get_decimals($currency_convert)
{
    global $money_config;

    $r = $money_config[$currency_convert]['round'];
    $decimals = 0;

    if ($r <= 1) {
        $decimals = $money_config[$currency_convert]['decimals'];
    }
    return $decimals;
}

/**
 * nv_weight_conversion()
 *
 * @param mixed $weight
 * @param mixed $weight_unit_curent
 * @param mixed $weight_unit_convert
 * @param integer $number
 * @return
 */
function nv_weight_conversion($weight, $weight_unit_curent, $weight_unit_convert, $number = 1)
{
    global $pro_config, $weight_config;

    if ($weight > 0) {
        if ($weight_unit_curent == $pro_config['weight_unit']) {
            $weight = $weight / $weight_config[$weight_unit_convert]['exchange'];
        } elseif ($weight_unit_convert == $pro_config['weight_unit']) {
            $weight = $weight * $weight_config[$weight_unit_curent]['exchange'];
        }
        $weight = $weight * $number;

        $r = $weight_config[$weight_unit_convert]['round'];
        $decimals = 0;

        if ($r <= 1) {
            $decimals = $weight_config[$weight_unit_convert]['decimals'];
        }

        if ($r > 1) {
            $weight = round($weight / $r) * $r;
        } else {
            $weight = round($weight, $decimals);
        }
    }

    return $weight;
}

/**
 * nv_shipping_price()
 *
 * @param mixed $weight
 * @param mixed $weight_unit
 * @param mixed $location_id
 * @param mixed $carrier_id
 * @param mixed $config_id
 * @return
 */
function nv_shipping_price($weight, $weight_unit, $location_id, $shops_id, $carrier_id)
{
    global $db, $db_config, $module_data, $pro_config;

    $array_weight_config = array();
    $array_location_config = array();
    $price = array();

    $sql = 'SELECT config_id FROM ' . $db_config['prefix'] . '_' . $module_data . '_shops_carrier WHERE shops_id = ' . $shops_id . ' AND carrier_id = ' . $carrier_id;
    $result = $db->query($sql);
    list ($config_id) = $result->fetch(3);

    if ($config_id) {
        $sql = 'SELECT iid FROM ' . $db_config['prefix'] . '_' . $module_data . '_carrier_config_location WHERE cid = ' . $config_id . ' AND lid = ' . $location_id;
        $result = $db->query($sql);
        list ($iid) = $result->fetch(3);

        if ($iid) {
            // Weight config
            $sql = 'SELECT * FROM ' . $db_config['prefix'] . '_' . $module_data . '_carrier_config_weight WHERE iid = ' . $iid . ' ORDER BY weight';
            $result = $db->query($sql);
            while ($array_weight = $result->fetch()) {
                $array_weight_config[$array_weight['iid']][] = $array_weight;
            }
        }
    }

    if (!empty($array_weight_config)) {
        foreach ($array_weight_config as $weight_config) {
            foreach ($weight_config as $config) {
                $config['weight'] = nv_weight_conversion($config['weight'], $config['weight_unit'], $weight_unit);
                if ($weight <= $config['weight']) {
                    $price = nv_currency_conversion($config['carrier_price'], $config['carrier_price_unit'], $pro_config['money_unit']);
                    break;
                } else {
                    // Vuot muc gia cau hinh
                }
            }
        }
    }

    return $price;
}
