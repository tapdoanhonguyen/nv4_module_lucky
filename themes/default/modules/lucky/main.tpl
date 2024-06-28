<!-- BEGIN: main -->
<style type="text/css">
	#cloud {

		width: 350px; height: 120px;



		background: #f2f9fe;

		background: linear-gradient(top, #f2f9fe 5%, #d6f0fd 100%);

		background: -webkit-linear-gradient(top, #f2f9fe 5%, #d6f0fd 100%);

		background: -moz-linear-gradient(top, #f2f9fe 5%, #d6f0fd 100%);

		background: -ms-linear-gradient(top, #f2f9fe 5%, #d6f0fd 100%);

		background: -o-linear-gradient(top, #f2f9fe 5%, #d6f0fd 100%);



		border-radius: 100px;

		-webkit-border-radius: 100px;

		-moz-border-radius: 100px;



		position: relative;

		margin: 120px auto 20px;
		z-index: 2;
		position: absolute;
		right: 10px;

	}



	#cloud:after, #cloud:before {

		content: '';

		position: absolute;

		background: #f2f9fe;

		z-index: 1

	}



	#cloud:after {

		width: 100px; height: 100px;

		top: -50px; left: 50px;



		border-radius: 100px;

		-webkit-border-radius: 100px;

		-moz-border-radius: 100px;

	}



	#cloud:before {

		width: 180px; height: 180px;

		top: -90px; right: 50px;



		border-radius: 200px;

		-webkit-border-radius: 200px;

		-moz-border-radius: 200px;

	}



	.shadow {

		width: 350px;

		position: absolute; bottom: -10px;

		background: #000;

		z-index: 1;



		box-shadow: 0 0 25px 8px rgba(0, 0, 0, 0.4);

		-moz-box-shadow: 0 0 25px 8px rgba(0, 0, 0, 0.4);

		-webkit-box-shadow: 0 0 25px 8px rgba(0, 0, 0, 0.4);



		border-radius: 50%;

		-moz-border-radius: 50%;

		-webkit-border-radius: 50%;

	}
	.remaining{
		z-index: 10;
		position: relative;
		text-align: center;
		font-size: 20px
	}
	.lucky_name{
		font-size: 35px;
		color: orange;
		text-shadow: -1px -1px white, 1px 1px #333;
		margin-bottom: 50px;
	}
	.zoom_auto{
		zoom: 120%;
	}
	.box_trung_giai{
		background: #ffffffeb;
		min-height: 500px;
		border-radius: 10px;
		box-shadow: 5px 0px 40px #00000036;
		padding: 20px;
	}
	.lucky_name_register{
		font-size: 20px;
		color: #EE1A1A;
		text-shadow: -1px -1px white, 1px 1px #333;
		margin-bottom: 50px;
		z-index: 101;
		position: relative;
		text-align: center;
	}
	.lucky_name_register > button{
		border: none;
		box-shadow: 5px 6px 13px #00000036;
		background: #fff;
		border-radius: 10px;
		padding: 10px;
	}
	.lucky_name_register > button:hover{
		background: #ffedc5;
	}
	.modal-title {
		text-align: center;
		font-size: 18px;
	}
	@media only screen and (max-width: 768px) {
		#cloud{
			top: 0px;
		}
		.main_lucky {
			padding: 250px 0px;
			zoom: 60%;
		}
		.box_trung_giai{
			padding: 0px;
		}
	}
</style>

<div class="container-fluid " style="background-image: url({info_lucky.image});background-repeat: no-repeat;background-size: cover;position: relative;">
	<div id = "cloud">
		<span class='shadow'></span>
		<!-- BEGIN: chua_dang_nhap1 -->
		<div class="lucky_name_register">
			<button type="button" onclick="goimd()">
				Đăng ký quay thưởng
			</button>
		</div>
		<!-- END: chua_dang_nhap1 -->
		<!-- BEGIN: da_dang_nhap1 -->
		<div class="remaining">
			Lượt quay còn lại: {remaining}
		</div>
		<!-- END: da_dang_nhap1 -->
	</div>
	<div class="col-xs-24 col-sm-24 col-md-24 col-lg-24 text-center lucky_name">

		{info_lucky.name}
	</div>
	<div class="col-xs-24 col-sm-24 col-md-24 col-lg-24 zoom_auto">
		<div class="wrapper typo" id="wrapper">
			<section id="luckywheel" class="hc-luckywheel">
				<div class="hc-luckywheel-container">
					<canvas class="hc-luckywheel-canvas" width="500px" height="500px"
					>
					Vòng Xoay May Mắn
					</canvas
					>
				</div>
				<a class="hc-luckywheel-btn" href="javascript:;">Xoay</a>
			</section>

		</div>
		
	</div>

	<div class="col-xs-24 col-sm-24 col-md-12 col-lg-12" style="padding: 10px;">
		<div class="col-xs-24 col-sm-24 col-md-24 col-lg-24 box_trung_giai">
			<h2 style="width: 100%;font-size: 20px;" class="text-center">
				Top 10 người trúng giải có giá trị
			</h2>
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
						display: grid;
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

					td:nth-child(1):before {
						content: "Giải thưởng:";
					}
					td:nth-child(2):before {
						content: "Hình ảnh:";
					}
					td:nth-child(3):before {
						content: "Trị giá giải thưởng:";
					}
					td:nth-child(4):before {
						content: "Người trúng giải:";
					}
					td:nth-child(5):before {
						content: "Số điện thoại:";
					}
					td:nth-child(6):before {
						content: "Thời gian trúng giải:";
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
						margin: 10px 0;
						padding: 0;
					}

					.table-users {
						border: none;
						box-shadow: none;
						overflow: visible;
					}
				}

			</style>


			<div class="table-users">
				<div class="header">Top 10 người đã trúng giải</div>
				<table cellspacing="0">
					<tr>
						<th>Giải thưởng</th>
						<th>Hình ảnh</th>
						<th>Trị giá</th>
						<th>Khách hàng</th>
						<th>Thời gian</th>
					</tr>

					<!-- BEGIN: history -->
					<tr>
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
							{HISTORY.info_user.first_name} {HISTORY.info_user.last_name}<br/>{HISTORY.info_user.phone}
						</td>
						
						<td>
							{HISTORY.time_add}
						</td>
					</tr>
					<!-- END: history -->

				</table>
			</div>
		</div>



	</div>
	<div class="col-xs-24 col-sm-24 col-md-12 col-lg-12" style="padding: 10px;">
		<div class="col-xs-24 col-sm-24 col-md-24 col-lg-24 box_trung_giai">
			<h2 style="width: 100%;font-size: 20px;" class="text-center">
				Danh sách trúng thưởng
			</h2>


			<div class="table-users">
				<div class="header">Trúng giải gần đây</div>
				<table cellspacing="0">
					<tr>
						<th>Giải thưởng</th>
						<th>Hình ảnh</th>
						<th>Trị giá</th>
						<th>Khách hàng</th>
						<th>Thời gian</th>
					</tr>

					<!-- BEGIN: history1 -->
					<tr>
						<td>
							{HISTORY1.info_prize.title}
						</td>
						<td>
							<img src="{HISTORY1.info_prize.image}" height="70px" alt="{HISTORY1.info_prize.title}" title="{HISTORY1.info_prize.title}">
						</td>
						<td>
							{HISTORY1.info_prize.money} đ
						</td>
						<td>
							{HISTORY1.info_user.first_name} {HISTORY1.info_user.last_name}<br/>{HISTORY1.info_user.phone}
						</td>
						
						<td>
							{HISTORY1.time_add}
						</td>
					</tr>
					<!-- END: history1 -->

				</table>
			</div>


		</div>

	</div>
</div>


<script type="text/javascript">
	function goimd(){
		$("#exampleModal").modal('show');
	}
</script>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Đăng ký thông tin quay thưởng</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-xs-24 col-sm-24 col-md-8 col-lg-8">
						<p>
							Họ và tên
							<span class="red">
								(*)
							</span>
						</p>
						<p>
							<input type="" name="ho_va_ten" id="ho_va_ten" class="form-control" placeholder="Họ và tên" value="{user_info.first_name} {user_info.last_name}">
						</p>
					</div>
					<div class="col-xs-24 col-sm-24 col-md-8 col-lg-8">
						<p>
							Số điện thoại
							<span class="red">
								(*)
							</span>
						</p>
						<p>
							<input type="" name="sdt" id="sdt" class="form-control" placeholder="Số điện thoại" value="{user_info.phone}">
						</p>
					</div>
					<div class="col-xs-24 col-sm-24 col-md-8 col-lg-8">
						<p>
							Email
							<span class="red">
								(*)
							</span>
						</p>
						<p>
							<input type="" name="email" id="email" class="form-control" placeholder="Email" value="{user_info.email}">
						</p>
					</div>
				</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
				<button type="button" class="btn btn-primary" onclick="save_session()">Lưu lại</button>
			</div>
		</div>
	</div>
</div>
</style>

<script src="{NV_BASE_SITEURL}themes/default/js/lucky.wel.js"></script>

<!-- BEGIN: prize -->
<script>
	function save_session(){
		var ho_va_ten = $('#ho_va_ten').val();
		var sdt = $('#sdt').val();
		var email = $('#email').val();
		if(ho_va_ten && sdt && email){
			$.ajax({
				type : 'POST',
				url: nv_base_siteurl + 'index.php?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=main&mod=save_session&ho_va_ten=' + ho_va_ten + '&sdt=' + sdt + '&email=' + email,
				contentType: false,
				processData: false,
				success : function(res){
					res2=JSON.parse(res);
					if(res2.status=="OK"){
						alert(res2.text);
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
			alert('Vui lòng nhập đầy đủ thông tin');
		}
		
	}
	var isPercentage = true;
	var prizes = [

	<!-- BEGIN: loop -->
	{
		text: '{PRIZE.title}',
		img: '{PRIZE.image}',
                number: Number({PRIZE.number}), // 1%,
                percentpage: Number({PRIZE.percent}), // 1%
                id_prize: {PRIZE.id},
                id_lucky: {info_lucky.id}
            },

            <!-- END: loop -->

            ];
            document.addEventListener(
            	"DOMContentLoaded",
            	function() {
            		hcLuckywheel.init({
            			id: "luckywheel",
            			config: function(callback) {
            				callback &&
            				callback(prizes);
            			},
            			mode : "both",
            			getPrize: function(callback) {
            				var rand = randomIndex(prizes);
            				var chances = rand;
            				callback && callback([rand, chances]);
            			},
            			gotBack: function(data) {
            				if(data.text == null){
            					Swal.fire(
            						'Chương trình kết thúc',
            						'Đã hết phần thưởng',
            						'error'
            						).then(({value}) => {
                            //location.reload();
                        });
            					} else if (data.text == 'Chúc bạn may mắn lần sau'){
            						save_lucky(data,2);


            					} else{
            						save_lucky(data,1);


            					}
            				}
            			});
            	},
            	false
            	);
            function musicstart(){
            	var audio = new Audio('{audio}');
            	var audio1 = new Audio('{audio1}');
            	audio.play();
            	setTimeout(function(){ 
            		audio.pause();
            	}, 
            	6000);
            	setTimeout(function(){ 
            		audio1.play();
            	}, 
            	5000);


            }
            function randomIndex(prizes){
            	<!-- BEGIN: you_are_lucky -->
            	return {you_are_lucky};
            	<!-- END: you_are_lucky -->

            	if(isPercentage){
            		var counter = 1;
            		for (let i = 0; i < prizes.length; i++) {
            			if(prizes[i].number == 0){
            				counter++
            			}
            		}
            		if(counter == prizes.length){
            			return null
            		}
            		let rand = Math.random();
            		let prizeIndex = null;
            		
            		switch (true) {
            			<!-- BEGIN: loop1 --> case rand <  <!-- BEGIN: loop11 --> prizes[{i}].percentpage  <!-- END: loop11 --><!-- BEGIN: loop12 --> + prizes[{i}].percentpage <!-- END: loop12 --> <!-- BEGIN: loop13 --> + prizes[{i}].percentpage: <!-- END: loop13 -->:
            			prizeIndex = {INDEX} ;
            			break;
            			<!-- END: loop1 -->
            		}


            		if(prizes[prizeIndex].number != 0){
            			prizes[prizeIndex].number = prizes[prizeIndex].number - 1
            			return prizeIndex
            		}else{
            			return randomIndex(prizes)
            		}
            	}else{
            		var counter = 0;
            		for (let i = 0; i < prizes.length; i++) {
            			if(prizes[i].number == 0){
            				counter++
            			}
            		}
            		if(counter == prizes.length){
            			return null
            		}
            		var rand = (Math.random() * (prizes.length)) >>> 0;
            		if(prizes[rand].number != 0){
            			prizes[rand].number = prizes[rand].number - 1
            			return rand
            		}else{
            			return randomIndex(prizes)
            		}
            	}

            }
            function save_lucky(data,status){
            	$.ajax({
            		type : 'POST',
            		url: nv_base_siteurl + 'index.php?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '={OP}&mod=save_lucky&id_prize=' + data.id_prize + '&id_lucky=' + data.id_lucky + '&status=' + status,
            		contentType: false,
            		processData: false,
            		success : function(res){
            			res2=JSON.parse(res);
            			if(res2.status=="OK"){
            				if(status == 2){
            					Swal.fire(
            						'Bạn không trúng thưởng',
            						data.text,
            						'error'
            						).then(({value}) => {
            							location.reload();
            						});
            					}else if(status == 1){
            						Swal.fire(
            							'Đã trúng giải',
            							data.text,
            							'success'
            							).then(({value}) => {
            								send_email(data,status);
            							});
            						}
            					}else{
            						alert(Lỗi);
            					}
            				},
            				error: function(xhr, ajaxOptions, thrownError) {
            					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            				}
            			});
            }

            function send_email(data,status){
            	$.ajax({
            		type : 'POST',
            		url: nv_base_siteurl + 'index.php?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '={OP}&mod=send_email&id_prize=' + data.id_prize + '&id_lucky=' + data.id_lucky + '&status=' + status,
            		contentType: false,
            		processData: false,
            		success : function(res){
            			res2=JSON.parse(res);
            			if(res2.status=="OK"){
            				location.reload();
            			}else{
            				alert(Lỗi);
            			}
            		},
            		error: function(xhr, ajaxOptions, thrownError) {
            			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            		}
            	});
            }





            function check_session(){
            	$.ajax({
            		type : 'POST',
            		url: nv_base_siteurl + 'index.php?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=main&mod=check_user',
            		contentType: false,
            		processData: false,
            		success : function(res){
            			res2=JSON.parse(res);
            			console.log(res2)
            			if(res2.status=="OK"){
            				return 1;
            			}else if(res2.status == "KO"){
            				return 0;
            				$('#fill_infomation').on('shown.bs.modal', function () {
            					$('#ho_va_ten').trigger('focus')
            				})
            			}else{
            				return 2;
            				alert(Lỗi);
            			}
            		},
            		error: function(xhr, ajaxOptions, thrownError) {
            			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            		}
            	});
            }

        </script>

        <!-- END: prize -->






























        <script type="text/javascript">
        	(function() {
        		var $,
        		ele,
        		container,
        		canvas,
        		num,
        		prizes,
        		btn,
        		deg = 0,
        		fnGetPrize,
        		fnGotBack,
        		optsPrize;

        		var cssPrefix,
        		eventPrefix,
        		vendors = {
        			"": "",
        			Webkit: "webkit",
        			Moz: "",
        			O: "o",
        			ms: "ms"
        		},
        		testEle = document.createElement("p"),
        		cssSupport = {};

        		Object.keys(vendors).some(function(vendor) {
        			if (
        				testEle.style[vendor + (vendor ? "T" : "t") + "ransitionProperty"] !==
        				undefined
        				) {
        				cssPrefix = vendor ? "-" + vendor.toLowerCase() + "-" : "";
        			eventPrefix = vendors[vendor];
        			return true;
        		}
        	});

  /**
   * @param  {[type]} name [description]
   * @return {[type]}      [description]
   */
   function normalizeEvent(name) {
   	return eventPrefix ? eventPrefix + name : name.toLowerCase();
   }

  /**
   * @param  {[type]} name [description]
   * @return {[type]}      [description]
   */
   function normalizeCss(name) {
   	name = name.toLowerCase();
   	return cssPrefix ? cssPrefix + name : name;
   }

   cssSupport = {
   	cssPrefix: cssPrefix,
   	transform: normalizeCss("Transform"),
   	transitionEnd: normalizeEvent("TransitionEnd")
   };

   var transform = cssSupport.transform;
   var transitionEnd = cssSupport.transitionEnd;

  // alert(transform);
  // alert(transitionEnd);

  function init(opts) {
  	fnGetPrize = opts.getPrize;
  	fnGotBack = opts.gotBack;
  	opts.config(function(data) {
  		prizes = opts.prizes = data;
  		num = prizes.length;
  		draw(opts);
  	});
  	events();
  }

  /**
   * @param  {String} id
   * @return {Object} HTML element
   */
   $ = function(id) {
   	return document.getElementById(id);
   };

   function draw(opts) {
   	opts = opts || {};
   	if (!opts.id || num >>> 0 === 0) return;

   	var id = opts.id,
   	rotateDeg = 360 / num / 2 + 90,
   	ctx,
   	prizeItems = document.createElement("ul"),
   	turnNum = 1 / num,
   	html = [];

   	ele = $(id);
   	canvas = ele.querySelector(".hc-luckywheel-canvas");
   	container = ele.querySelector(".hc-luckywheel-container");
   	btn = ele.querySelector(".hc-luckywheel-btn");

   	if (!canvas.getContext) {
   		showMsg("Browser is not support");
   		return;
   	}

   	ctx = canvas.getContext("2d");

   	for (var i = 0; i < num; i++) {
   		ctx.save();
   		ctx.beginPath();
      ctx.translate(250, 250); // Center Point
      ctx.moveTo(0, 0);
      ctx.rotate((((360 / num) * i - rotateDeg) * Math.PI) / 180);
      ctx.arc(0, 0, 250, 0, (2 * Math.PI) / num, false); // Radius
      if (i % 2 == 0) {
      	ctx.fillStyle = "#ffb820";
      } else {
      	ctx.fillStyle = "#ffcb3f";
      }
      ctx.fill();
      ctx.lineWidth = 1;
      ctx.strokeStyle = "#e4370e";
      ctx.stroke();
      ctx.restore();
      var prizeList = opts.prizes;
      html.push('<li class="hc-luckywheel-item"> <span style="');
      html.push(transform + ": rotate(" + i * turnNum + 'turn)">');
      if (opts.mode == "both") {
      	html.push("<div id='curve'><div class='text_xoay'>" + prizeList[i].text + "</div></div>");
      	html.push('<img src="' + prizeList[i].img + '" />');
      } else if (prizeList[i].img) {
      	html.push('<img src="' + prizeList[i].img + '" />');
      } else {
      	html.push('<p id="curve">' + prizeList[i].text + "</p>");
      }
      html.push("</span> </li>");
      if (i + 1 === num) {
      	prizeItems.className = "hc-luckywheel-list";
      	container.appendChild(prizeItems);
      	prizeItems.innerHTML = html.join("");
      }
  }
}

  /**
   * @param  {String} msg [description]
   */
   function showMsg(msg) {
   	alert(msg);
   }

  /**
   * @param  {[type]} deg [description]
   * @return {[type]}     [description]
   */
   function runRotate(deg) {
    // runInit();
    // setTimeout(function() {
    	container.style[transform] = "rotate(" + deg + "deg)";
    // }, 10);
}

  /**
   * @return {[type]} [description]
   */
   function events() {
   	bind(btn, "click", function() {

   		<!-- BEGIN: het_luot_quay -->

   		alert('Bạn đã hết lượt quay!');

   		<!-- END: het_luot_quay -->
   		<!-- BEGIN: chua_dang_nhap -->

   		goimd();

   		<!-- END: chua_dang_nhap -->



   		<!-- BEGIN: da_dang_nhap -->
   		musicstart();
   		addClass(btn, "disabled");

   		fnGetPrize(function(data) {
   			if (data[0] == null && !data[1] == null) {
   				return;
   			}
   			optsPrize = {
   				prizeId: data[0],
   				chances: data[1]
   			};
   			deg = deg || 0;
   			deg = deg + (360 - (deg % 360)) + (360 * 10 - data[0] * (360 / num));
   			runRotate(deg);
   		});
   		bind(container, transitionEnd, eGot);
   		<!-- END: da_dang_nhap -->





   	});
   }

   function eGot() {
   	if (optsPrize.chances == null) {
   		return fnGotBack(null);
   	} else {
   		//removeClass(btn, "disabled");
   		return fnGotBack(prizes[optsPrize.prizeId]);
   	}
   }

  /**
   * Bind events to elements
   * @param {Object}    ele    HTML Object
   * @param {Event}     event  Event to detach
   * @param {Function}  fn     Callback function
   */
   function bind(ele, event, fn) {
   	if (typeof addEventListener === "function") {
   		ele.addEventListener(event, fn, false);
   	} else if (ele.attachEvent) {
   		ele.attachEvent("on" + event, fn);
   	}
   }

  /**
   * hasClass
   * @param {Object} ele   HTML Object
   * @param {String} cls   className
   * @return {Boolean}
   */
   function hasClass(ele, cls) {
   	if (!ele || !cls) return false;
   	if (ele.classList) {
   		return ele.classList.contains(cls);
   	} else {
   		return ele.className.match(new RegExp("(\\s|^)" + cls + "(\\s|$)"));
   	}
   }

  // addClass
  function addClass(ele, cls) {
  	if (ele.classList) {
  		ele.classList.add(cls);
  	} else {
  		if (!hasClass(ele, cls)) ele.className += "" + cls;
  	}
  }

  // removeClass
  function removeClass(ele, cls) {
  	if (ele.classList) {
  		ele.classList.remove(cls);
  	} else {
  		ele.className = ele.className.replace(
  			new RegExp(
  				"(^|\\b)" + className.split(" ").join("|") + "(\\b|$)",
  				"gi"
  				),
  			" "
  			);
  	}
  }

  var hcLuckywheel = {
  	init: function(opts) {
  		return init(opts);
  	}
  };

  window.hcLuckywheel === undefined && (window.hcLuckywheel = hcLuckywheel);

  if (typeof define == "function" && define.amd) {
  	define("HellCat-Luckywheel", [], function() {
  		return hcLuckywheel;
  	});
  }
})();
</script>






<!-- END: main -->