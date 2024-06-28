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
                    Chọn người may mắn
                    <span class="red">(*)</span>
                </p>
                <p>
                    <select name="user_lucky" id="user_lucky" class="form-control" required="" {disabled}>
                       <!-- BEGIN: user_lucky -->
                       <option value="{user_lucky.userid}" selected="">{user_lucky.first_name} {user_lucky.last_name}</option>
                       <!-- END: user_lucky -->
                   </select>
               </p>
           </div>
           <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
            <p>
                Chọn giải thưởng
                <span class="red">(*)</span>
            </p>
            <p>
                <select name="prize" id="prize" class="form-control" required="">
                    <!-- BEGIN: prize -->
                    <option value="{prize.id}" selected="">{prize.title}</option>
                    <!-- END: prize -->
                </select>
            </p>
        </div>
         <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
            <p>
                Chọn chương trình quay thưởng
                <span class="red">(*)</span>
            </p>
            <p>
                <select name="lucky" id="lucky" class="form-control" required="">
                    <!-- BEGIN: lucky -->
                    <option value="{lucky.id}" selected="">{lucky.name}</option>
                    <!-- END: lucky -->
                </select>
            </p>
        </div>
        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
            <p>
                Số lượt trúng thưởng
                <span class="red">(*)</span>
            </p>
            <p>
                <input type="number" name="number" class="form-control" placeholder="Số lượt trúng thưởng" required="" value="{ROW.number}">
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
    $('#user_lucky').select2({
        placeholder:"Chọn người may mắn", 
        ajax: {
            url: script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '={OP}&mod=user_lucky',
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
            var type = "file";
            nv_open_browse(script_name + "?" + nv_name_variable + "=upload&popup=1&area=" + area + "&alt=" + alt + "&path=" + path + "&type=" + type, "NVImg", 850, 420, "resizable=no,scrollbars=no,toolbar=no,location=no,status=no");
            return false;
        });
    });
    $('#prize').select2({
        placeholder:"Chọn giải thưởng", 
        ajax: {
            url: script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '={OP}&mod=prize',
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
    $('#lucky').select2({
        placeholder:"Chọn chương trình quay thưởng", 
        ajax: {
            url: script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '={OP}&mod=lucky',
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
</script>
<!-- END: main -->