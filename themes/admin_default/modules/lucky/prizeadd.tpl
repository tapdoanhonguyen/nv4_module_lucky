<!-- BEGIN: main -->
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
            <div class="col-xs-24 col-sm-24 col-md-12 col-lg-12">
                <p>
                    Tên giải thưởng
                </p>
                <p>
                    <input type="text" name="title" value="{ROW.title}" class="form-control" placeholder="Nhập tên giải thưởng" required="">
                </p>
            </div>
            <div class="col-xs-24 col-sm-24 col-md-12 col-lg-12">
                <p>
                    Trị giá
                </p>
                <p>
                    <input type="text" name="money" value="{ROW.money}" class="form-control" placeholder="Nhập trị giá giải thưởng" required="">
                </p>
            </div>
            <div class="col-xs-24 col-sm-24 col-md-12 col-lg-12">
                <p>
                    Tỉ lệ trúng thưởng
                </p>
                <p>
                    <input type="number" step="0.01" name="percent" class="form-control" placeholder="Nhập tỉ lệ trúng thưởng (%)" onkeypress="return event.charCode != 45" required="" value="{ROW.percent}">
                </p>
            </div>
            <div class="col-xs-24 col-sm-24 col-md-24 col-lg-24">
                <p>
                    Hình ảnh giải thưởng
                </p>
                <p>
                    <input class="w300 form-control pull-left" type="text" name="image" id="image" value="{ROW.image}" style="margin-right: 5px"/>
                    <input type="button" value="Browse server" name="selectimg" class="btn btn-info"/>
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