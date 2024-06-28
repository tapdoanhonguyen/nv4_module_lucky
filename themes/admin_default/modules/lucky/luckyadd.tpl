<!-- BEGIN: main -->
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/language/jquery.ui.datepicker-{NV_LANG_INTERFACE}.js"></script>
<link type="text/css" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/select2.min.js"></script>
<link href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/select2.min.css" type="text/css" rel="stylesheet" />


<!-- BEGIN: error -->
<div class="alert alert-warning">{ERROR}</div>
<!-- END: error -->
<div class="">
    <div class="">
       <form class="form-horizontal" action="" enctype="multipart/form-data" method="post" id="frm-submit">
        <input type="hidden" name="id" value="{ROW.id}"  />
        <div class="row">
            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                <p>
                    Tên chương trình quay thưởng
                </p>
                <p>
                    <input type="text" name="title" class="form-control" placeholder="Nhập tên giải thưởng" required="" value="{ROW.name}">
                </p>
            </div>
            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                <p>
                   Thời gian bắt đầu
               </p>
               <p>
                <input type="text" name="time_begin" class="form-control" placeholder="Thời gian bắt đầu" required="" id="time_begin" value="{ROW.time_begin}" autocomplete="off">
            </p>
        </div>
        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
            <p>
                Thời gian kết thúc
            </p>
            <p>
                <input type="text" name="time_end" class="form-control" placeholder="Thời gian kết thúc" required="" id="time_end" value="{ROW.time_end}" autocomplete="off">
            </p>
        </div>
         <div class="col-xs-24 col-sm-24 col-md-24 col-lg-24">
                <p>
                    Hình ảnh hiển thị ở vòng quay
                </p>
                <p>
                    <input class="w300 form-control pull-left" type="text" name="image" id="image" value="{ROW.image}" style="margin-right: 5px" placeholder="Chọn hình ảnh" required=""/>
                    <input type="button" value="Browse server" name="selectimg" class="btn btn-info"  />
                </p>
            </div>
    </div>

    <div class="form-group" style="text-align: center">
        <input class="btn btn-primary" name="submit" type="submit" id="submit_form" value="Lưu lại" />
    </div>
</form>
</div>
</div>
<script type="text/javascript">
    $("#time_begin,#time_end").datepicker({
        dateFormat: "dd-mm-yy",
        changeMonth: true,
        changeYear: true,
        firstDay: 1,
        showOtherMonths: true,
    });
    $(document).ready(function() {
        $("input[name=selectimg]").click(function() {
            var area = "image";
            var alt = "imagealt";
            var path = "{UPLOADS_DIR_USER}";
            var type = "image";
            nv_open_browse(script_name + "?" + nv_name_variable + "=upload&popup=1&area=" + area + "&alt=" + alt + "&path=" + path + "&type=" + type, "NVImg", 850, 420, "resizable=no,scrollbars=no,toolbar=no,location=no,status=no");
            return false;
        });
    });
</script>
<!-- END: main -->