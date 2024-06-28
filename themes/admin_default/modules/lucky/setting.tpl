<!-- BEGIN: main -->
<form class="form-inline" action="" method="post">
    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover">
            <caption>{LANG.search_per_page}</caption>
            <colgroup>
                <col class="w500" />
            </colgroup>
            <tbody>
                <tr>
                    <td>
                        <strong>Tiêu đề khi trúng thưởng</strong>
                    </td>
                    <td>
                        <input class="form-control" type="text" value="{DATA.title}" name="title" placeholder="Tiêu đề khi trúng thưởng" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="text-center">
        <input class="btn btn-primary" type="submit" value="{LANG.save}" name="Submit1" /><input type="hidden" value="1" name="savesetting">
    </div>
</form>

<script type="text/javascript">
    $('#download_active').change(function() {
        $('#download_groups').toggle();
    });
</script>
<!-- BEGIN: main -->