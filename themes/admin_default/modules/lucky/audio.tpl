<!-- BEGIN: main -->
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/language/jquery.ui.datepicker-{NV_LANG_INTERFACE}.js"></script>
<link type="text/css" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
<style type="text/css">
    .box_image_rate{
        padding: 5px;
        border-radius: 5px;
        background: #eeeeee;
        display: inherit;
    }
    .box_image_rate > a > img{
        margin: 3px;
        height: 50px;
        
    }
</style>
<!-- BEGIN: view -->
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title" style="float:left"><i class="fa fa-list"></i>Âm thanh quay thưởng</h3> 
        <div class="pull-right">
            <button title="Ẩn /Hiện tìm kiếm"id="tms_sea_id" data-toggle="tooltip" data-placement="top"class="btn btn-success btn-sm"><i class="fa fa-search" aria-hidden="true"></i></button> 
            <a title="Thêm chương trình" data-toggle="tooltip" data-placement="top"class="btn btn-success btn-sm" href="{LINK_ADD}"><i class="fa fa-plus" aria-hidden="true"></i></a> 
        </div>
        <div style="clear:both"></div>
    </div>
    <div class="well" id="tms_sea">
        <form id="formsearch" method="post">
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

                <div class="col-xs-24 col-sm-12  col-md-12  col-lg-6">
                    <div class="form-group">
                        <div class="input-group" style="width:100%">
                            <span class="input-group-addon w100">
                                hoặc {LANG.ngay_tu}
                            </span>
                            <input id="ngaytu" type="text" maxlength="255" class="form-control disabled" value="{ngay_tu}"
                            name="ngay_tu" placeholder="{LANG.ngay_tu}">
                        </div>
                    </div>

                </div>

                <div class="col-xs-24 col-sm-12  col-md-12  col-lg-6">
                    <div class="form-group">
                        <div class="input-group" style="width:100%">
                            <span class="input-group-addon w100">
                                {LANG.ngay_den}
                            </span>
                            <input id="ngayden" type="text" maxlength="255" class="form-control disabled" value="{ngay_den}"
                            name="ngay_den" placeholder="{LANG.ngay_den}">
                        </div>
                    </div>
                </div>
                <div class="col-xs-24 col-sm-12  col-md-4  col-lg-4">
                    <div class="form-group">
                        <input class="btn btn-primary" type="submit" value="Tìm kiếm" />
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<form action="{NV_BASE_ADMINURL}index.php?{NV_LANG_VARIABLE}={NV_LANG_DATA}&amp;{NV_NAME_VARIABLE}={MODULE_NAME}&amp;{NV_OP_VARIABLE}={OP}" method="post">
    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover">
            <thead>
                <tr>
                    <th class="w100">{LANG.number}</th>
                    <th>Tên âm thanh quay thưởng</th>
                    <th>File</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <!-- BEGIN: generate_page -->
            <tfoot>
                <tr>
                    <td class="text-center" colspan="9">{NV_GENERATE_PAGE}</td>
                </tr>
            </tfoot>
            <!-- END: generate_page -->
            <tbody>
                <!-- BEGIN: loop -->
                <tr>
                    <td>
                     {VIEW.number} 
                 </td>
                 <td> 
                     {VIEW.name}
                 </td>
                 <td>
                    <audio controls>
                      <source src="{VIEW.file}" type="audio/mpeg">
                        Your browser does not support the audio element.
                    </audio>
                    
                </td>
                <td>
                    <a href="{VIEW.edit}">Sửa</a>

                    <div>
                        <!-- BEGIN: da_chon -->
                        <span style="color: red;">
                            Đã chọn làm âm thanh mặc định
                        </span>
                        <!-- END: da_chon -->
                        <!-- BEGIN: chua_chon -->
                        <button type="button" class="" onclick="set_default({VIEW.id});">
                            Chọn làm âm thanh mặc định
                        </button>
                        <!-- END: chua_chon -->
                    </div>
                </td>

            </tr>
            <!-- END: loop -->
        </tbody>
    </table>
</div>
</form>
<!-- END: view -->
<script type="text/javascript">
    function set_default(id){
       $.ajax({
        type : 'POST',
        url: script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '={OP}&mod=set_default&id=' + id,
        contentType: false,
        processData: false,
        success : function(res){
            res2=JSON.parse(res);
            if(res2.status=="OK"){
             alert(res2.text);
             location.reload();
         }else{
            alert('Có lỗi xảy ra');
        }
    },
    error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
});
   }

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
   $("#ngaytu,#ngayden").datepicker({
    dateFormat: "dd-mm-yy",
    changeMonth: true,
    changeYear: true,
    firstDay: 1,
    showOtherMonths: true,
});


</script>
<!-- END: main -->