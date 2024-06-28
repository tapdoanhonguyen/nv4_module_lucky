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
        <input type="hidden" name="id" value="{ROW.id}" id="id" />
        <div class="row">
            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                <p>
                    Tên chương trình quay thưởng
                </p>
                <p>
                    <input type="text" name="title" class="form-control" placeholder="Nhập tên giải thưởng" required="" value="{ROW.name}" readonly="">
                </p>
            </div>
            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                <p>
                   Thời gian bắt đầu
               </p>
               <p>
                <input type="text" name="time_begin" class="form-control" placeholder="Thời gian bắt đầu" required="" id="time_begin" value="{ROW.time_begin}" readonly="">
            </p>
        </div>
        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
            <p>
                Thời gian kết thúc
            </p>
            <p>
                <input type="text" name="time_end" class="form-control" placeholder="Thời gian kết thúc" required="" id="time_end" value="{ROW.time_end}" readonly="">
            </p>
        </div>
        <div class="col-xs-24 col-sm-24 col-md-24 col-lg-24">
            <h2>
                Thêm giải thưởng vào chưởng trình quay thưởng
            </h2>
        </div>
        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
            <p>
                Chọn giải thưởng
            </p>
            <p>
                <select name="prize" id="prize" class="form-control">

                </select>
            </p>
        </div>
        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
            <p>
                Số lượng giải thưởng trong chương trình quay thưởng
            </p>
            <p>
             <input type="number" name="number" class="form-control" id="number" placeholder="Số lượng giải thưởng trong chương trình quay thưởng">
         </p>
     </div>
     <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8" style="padding-top: 26px;">
         <button type="button" class="btn btn-primary" onclick="them_giai_thuong()">
            Thêm giải thưởng
        </button>
    </div>
</div>
<!-- BEGIN: prize -->
<div class="col-xs-24 col-sm-24 col-md-24 col-lg-24">
 <h2>
     Giải thưởng đã thêm
 </h2>
 <div class="table-responsive">
    <table class="table table-striped table-bordered table-hover">
        <thead>
            <tr>
                <th class="w100">{LANG.number}</th>
                <th>Tên giải thưởng</th>
                <th>Hình ảnh giải thưởng</th>
                <th>Tỉ lệ trúng giải thưởng</th>
                <th>Số lượng giải thưởng</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <!-- BEGIN: loop -->
            <tr>
                <td>
                   {DATA.info_prize.number} 
               </td>
               <td> 
                   {DATA.info_prize.title}
               </td>
               <td> 
                   <a href="{DATA.info_prize.image}" title="{DATA.info_prize.title}">
                       <img src="{DATA.info_prize.image}" title="{DATA.info_prize.title}" alt="{DATA.info_prize.title}" height="70">
                   </a>
               </td>
               <td> 
                 {DATA.info_prize.percent} %
             </td>
             <td> 
                 {DATA.number}
             </td>
             <td> 
                 <button type="button" class="btn btn-primary" onclick="delete_prize({DATA.id});">
                     Xóa 
                 </button>
             </td>
         </tr>
         <!-- END: loop -->
     </tbody>
 </table>
</div>

</div>
<!-- END: prize -->

<div class="form-group" style="text-align: center">

</div>
</form>
</div>
</div>
<script type="text/javascript">
    function delete_prize(id){

        $.ajax({
            type : 'POST',
            url: script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '={OP}&mod=xoa_giai_thuong&id=' + id,
            contentType: false,
            processData: false,
            success : function(res){
                res2=JSON.parse(res);
                if(res2.status=="OK"){
                    location.reload();
                }else{
                    alert('Lỗi'); 
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });

    }
    function them_giai_thuong(){
        var prize = $('#prize').val();
        var number = $('#number').val();
        var id = $('#id').val()
        if(prize && number){
            $.ajax({
                type : 'POST',
                url: script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' +           nv_fc_variable + '={OP}&mod=them_giai_thuong&prize=' + prize + '&number=' + number + '&id=' + id,
                contentType: false,
                processData: false,
                success : function(res){
                    res2=JSON.parse(res);
                    if(res2.status=="OK"){
                        location.reload();

                    }else{
                        alert('Lỗi'); 
                    }
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        }else{
            alert('Vui lòng chọn giải thưởng và số lượng giải thưởng!')
        }
        
    }
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
</script>
<!-- END: main -->