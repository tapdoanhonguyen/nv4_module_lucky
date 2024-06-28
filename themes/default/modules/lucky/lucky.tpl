<!-- BEGIN: main -->
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/language/jquery.ui.datepicker-{NV_LANG_INTERFACE}.js"></script>
<link type="text/css" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/select2.min.js"></script>
<link href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/select2.min.css" type="text/css" rel="stylesheet" />
<style type="text/css">
  .header {
    background-color: #327a81;
    color: white;
    font-size: 1.5em;
    padding: 1rem;
    text-align: center;
    text-transform: uppercase;
  }

  img {
    border-radius: 50%;
    height: 60px;
    width: 60px;
  }

  .table-users {
    border: 1px solid #327a81;
    border-radius: 10px;
    box-shadow: 3px 3px 0 rgba(0, 0, 0, 0.1);
    max-width: calc(100% - 2em);
    margin: 1em auto;
    overflow: hidden;
    width: 800px;
  }

  table {
    width: 100%;
  }
  table td, table th {
    color: #2b686e;
    padding: 10px;
  }
  table td {
    text-align: center;
    vertical-align: middle;
  }
  table td:last-child {
    font-size: 0.95em;
    line-height: 1.4;
    text-align: left;
  }
  table th {
    background-color: #daeff1;
    font-weight: 300;
  }
  table tr:nth-child(2n) {
    background-color: white;
  }
  table tr:nth-child(2n+1) {
    background-color: #edf7f8;
  }

  @media screen and (max-width: 700px) {
    table, tr, td {
      display: block;
    }

    td:first-child {
      position: absolute;
      top: 50%;
      transform: translateY(-50%);
      width: 100px;
    }
    td:not(:first-child) {
      clear: both;
      margin-left: 100px;
      padding: 4px 20px 4px 90px;
      position: relative;
      text-align: left;
    }
    td:not(:first-child):before {
      color: #91ced4;
      content: "";
      display: block;
      left: 0;
      position: absolute;
    }
    td:nth-child(2):before {
      content: "Name:";
    }
    td:nth-child(3):before {
      content: "Email:";
    }
    td:nth-child(4):before {
      content: "Phone:";
    }
    td:nth-child(5):before {
      content: "Comments:";
    }

    tr {
      padding: 10px 0;
      position: relative;
    }
    tr:first-child {
      display: none;
    }
  }
  @media screen and (max-width: 500px) {
    .header {
      background-color: transparent;
      color: white;
      font-size: 2em;
      font-weight: 700;
      padding: 0;
      text-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
    }

    img {
      border: 3px solid;
      border-color: #daeff1;
      height: 100px;
      margin: 0.5rem 0;
      width: 100px;
    }

    td:first-child {
      background-color: #c8e7ea;
      border-bottom: 1px solid #91ced4;
      border-radius: 10px 10px 0 0;
      position: relative;
      top: 0;
      transform: translateY(0);
      width: 100%;
    }
    td:not(:first-child) {
      margin: 0;
      padding: 5px 1em;
      width: 100%;
    }
    td:not(:first-child):before {
      font-size: 0.8em;
      padding-top: 0.3em;
      position: relative;
    }
    td:last-child {
      padding-bottom: 1rem !important;
    }

    tr {
      background-color: white !important;
      border: 1px solid #6cbec6;
      border-radius: 10px;
      box-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
      margin: 0.5rem 0;
      padding: 0;
    }

    .table-users {
      border: none;
      box-shadow: none;
      overflow: visible;
    }
  }
</style>
<!-- BEGIN: view -->
<div class="well">
  <form action="{NV_BASE_ADMINURL}index.php" method="get">
    <input type="hidden" name="{NV_LANG_VARIABLE}"  value="{NV_LANG_DATA}" />
    <input type="hidden" name="{NV_NAME_VARIABLE}"  value="{MODULE_NAME}" />
    <input type="hidden" name="{NV_OP_VARIABLE}"  value="{OP}" />
    <div class="row">
      <div class="col-xs-24 col-sm-12  col-md-12  col-lg-8">
        <div class="form-group">
          <div class="input-group" style="width:100%">
            <span class="input-group-addon w100">
              Tìm kiếm nhanh
            </span>
            <select class="form-control link_flast" id="sea_flast" name="sea_flast">
              <option value="0">
                -- Chọn thời gian --
              </option>
              <option value="1" {SELECT1}>Ngày hôm nay</option>
              <option value="2" {SELECT2}>Ngày hôm qua</option>
              <option value="3" {SELECT3}>Tuần này</option>
              <option value="4" {SELECT4}>Tuần trước</option>
              <option value="5" {SELECT5}>Tháng này</option>
              <option value="6" {SELECT6}>Tháng trước</option>
              <option value="7" {SELECT7}>Năm này</option>
              <option value="8" {SELECT8}>Năm trước</option>
              <option value="9" {SELECT9}>Toàn thời gian
              </option>
            </select>
          </div>
        </div>
      </div>

      <div class="col-xs-24 col-sm-24 col-md-8 col-lg-8">
        <div class="form-group">
          <div class="input-group" style="width:100%">
            <span class="input-group-addon w100">
              hoặc {LANG.ngay_tu}
            </span>
            <input id="ngaytu" type="text" maxlength="255" class="form-control disabled" value="{ngay_tu}"
            name="ngay_tu" placeholder="Chọn ngày từ" readonly="">
          </div>
        </div>

      </div>

      <div class="col-xs-24 col-sm-24 col-md-8 col-lg-8">
        <div class="form-group">
          <div class="input-group" style="width:100%">
            <span class="input-group-addon w100">
              {LANG.ngay_den}
            </span>
            <input id="ngayden" type="text" maxlength="255" class="form-control disabled" value="{ngay_den}"
            name="ngay_den" placeholder="Chọn ngày đến" readonly="">
          </div>
        </div>
      </div>
      <div class="col-xs-24 col-sm-24 col-md-8 col-lg-8">
        <div class="form-group">
          <input class="form-control" type="text" value="{Q}" name="q" maxlength="255" placeholder="Nhập sdt, email hoặc tên" />
        </div>
      </div>
      <div class="col-xs-24 col-sm-24 col-md-8 col-lg-8">
        <div class="form-group">
          <select id="id_lucky" name="id_lucky" class="form-control">
            <!-- BEGIN: id_lucky -->
            <option value="{id_lucky.id}">{id_lucky.name}</option>
            <!-- END: id_lucky -->
          </select>
        </div>
      </div>
      <div class="col-xs-24 col-sm-24 col-md-24 col-lg-24">
        <div class="form-group">
          <input class="btn btn-primary" type="submit" value="Tìm kiếm" />
        </div>
      </div>
    </div>
  </form>
</div>
<form action="{NV_BASE_ADMINURL}index.php?{NV_LANG_VARIABLE}={NV_LANG_DATA}&amp;{NV_NAME_VARIABLE}={MODULE_NAME}&amp;{NV_OP_VARIABLE}={OP}" method="post">
  <div class="col-xs-24 col-sm-24 col-md-24 col-lg-24" style="background: #ffffffeb;min-height: 500px;border-radius: 10px;box-shadow: 5px 0px 40px #00000036;padding: 20px;">
    <h2 style="width: 100%;font-size: 20px;" class="text-center">
      Danh sách trúng thưởng
    </h2>


    <div class="table-users">
      <div class="header">Những người đã trúng giải gần đây</div>
      <table cellspacing="0">
        <tr>
          <th class="w100 text-center">STT</th>
          <th>Giải thưởng</th>
          <th>Hình ảnh</th>
          <th>Trị giá giải thưởng</th>
          <th>Người trúng giải</th>
          <th>Số điện thoại</th>
          <th>Thời gian trúng giải</th>
        </tr>
        <!-- BEGIN: loop -->
        <tr>

          <td>
            {HISTORY.number} 
          </td>
          <td>
            {HISTORY.info_prize.title}
          </td>
          <td>
            <img src="{HISTORY.info_prize.image}" height="70px" alt="{HISTORY.info_prize.title}" title="{HISTORY.info_prize.title}">
          </td>
          <td>
            {HISTORY.info_prize.money} đ
          </td>
          <td>
            {HISTORY.info_user.first_name} {HISTORY.info_user.last_name}
          </td>
          <td>
            {HISTORY.info_user.phone}
          </td>
          <td>
            {HISTORY.time_add}
          </td>

        </tr>
        <!-- END: loop -->

      </table>
      <!-- BEGIN: generate_page -->
      <div class="text-center">
        <tfoot>
          <tr>
            <td class="text-center" colspan="7">{NV_GENERATE_PAGE}</td>
          </tr>
        </tfoot>
      </div>
      <!-- END: generate_page -->
    </div>


  </div>




</form>
<!-- END: view -->


<script type="text/javascript">
  $('#id_lucky').select2({
    placeholder:"Chọn chương trình", 
    ajax: {
      url: nv_base_siteurl + 'index.php?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '={OP}&mod=id_lucky',
      dataType: 'json',
      delay: 250,
      data: function (params) {
        var query = {
          q: params.term
        }
        return query;
      },
      processResults: function (data) {
        return {
          results: data
        };
      },
      cache: true
    }
  })

  $("#ngaytu").datepicker({
    dateFormat: "dd-mm-yy",
    changeMonth: true,
    changeYear: true,
    firstDay: 1,
    showOtherMonths: true,
  });
  $("#ngayden").datepicker({
    dateFormat: "dd-mm-yy",
    changeMonth: true,
    changeYear: true,
    firstDay: 1,
    showOtherMonths: true,
  });
  $('select[name=sea_flast]').change(function() {
    var time_from = "";
    var time_to = "";
    var time = $('select[name=sea_flast]').val();
    if (time == 1) {
      time_from = "{HOMNAY}"
      time_to = "{HOMNAY}"
    } else if (time == 2) {
      time_from = "{HOMQUA}"
      time_to = "{HOMQUA}"
    } else if (time == 3) {
      time_from = "{TUANNAY.from}"
      time_to = "{TUANNAY.to}"
    } else if (time == 4) {
      time_from = "{TUANTRUOC.from}"
      time_to = "{TUANTRUOC.to}"
    } else if (time == 5) {
      time_from = "{THANGNAY.from}"
      time_to = "{THANGNAY.to}"
    } else if (time == 6) {
      time_from = "{THANGTRUOC.from}"
      time_to = "{THANGTRUOC.to}"
    } else if (time == 7) {
      time_from = "{NAMNAY.from}"
      time_to = "{NAMNAY.to}"
    } else if (time == 8) {
      time_from = "{NAMTRUOC.from}"
      time_to = "{NAMTRUOC.to}"
    } else if (time == 9) {
      time_from = "Không chọn"
      time_to = "Không chọn"
    } else if (time == 0) {
      time_from = ""
      time_to = ""
    }
    $('#ngaytu').val(time_from);
    $('#ngayden').val(time_to); 
  })
  $("#tms_sea_id").click(function() {
    $("#tms_sea").toggle();
  });
</script>
<!-- END: main -->