



<style type="text/css">
	.notice-list ul {
		min-height: 188px;
	}
	.notice-list label{
		display: inline-block;
		margin-bottom: 0px;
		font-weight: normal;
	}
</style>
<input type='hidden' value='' id="showExamScore"/>
<div class="cur_nav"><span>首页 > 查看公告</span></div>
<div class="index-navi">
	<div id="indexHelp" class="index_help">
		<a href="/gwyks/agreement.do?" target="_blank"> <font>报考须知</font>
		</a>
	</div> 
	<div id="indexBmlc" class="index_bmlc">
		<a href="javascript:;" onclick="openLc();"> <font>报名流程</font>
		</a>
	</div>
<!-- 	<div class="index_ksrk"> -->
<!-- 		<a href="javascript:;" onclick="openHelp();"> <font>各地区考生入口</font> -->
<!-- 		</a> -->
<!-- 	</div> -->
	<div class="index_help">
		<a href="javascript:;" onclick="openHelp();"> <font>帮助</font>
		</a>
	</div>
</div>
<div class="index-box">
	<div class="notice-title">
		<div class="title6_line">
			<span class="tubiao">考试公告</span>&nbsp;
		</div>
		<div class="more_box">
			<a href="/gwyks/anouns.do" target="_blank" class="ksrk_button">更多
			</a>
		</div>
	</div>
	<div class="notice-list">
		<ul>
			
 				<li><a href="javascript:;" onclick="openLinkWindow('https://www.gdzz.gov.cn/tzgg/content/post_22222.html','28233');">广东省2025年考试录用公务员公告</a><span>[2025-01-07]</span></li> 
 			
		</ul>
	</div>
</div>
<div class="index-box">
	<div class="notice-title">
		<div class="title6_line">
			<span class="tubiao1">省直考区通知</span>&nbsp;
		</div>
		<div class="more_box">
			<a href="/gwyks/notices.do?an=" target="_blank" class="ksrk_button">更多
			</a>
		</div>
		<div class=" ksrk_box">
			<a href="javascript:;" id="area_chioce" class="ksrk_button">选择考区
			</a>
		</div>
	</div>
	<div class="notice-list">
		<ul>
			
		</ul>
	</div>
</div>
<div style="text-align: left;margin: 15px auto;width:90%;margin-top: 20pt;">
	<font size="5" color="red">您已确定参加广东省2025年考试录用公务员笔试，请于2025年3月11日9︰00后登录报名系统下载并打印准考证</font>
</div>
<script type="text/javascript">
	function openLc(){
		page_modal('pageModal',{title:'报考流程',height:560,width:700,url:'/gwyks/lc.do'});
	}
	function openHelp(){
		page_modal('pageModal',{title:'帮助',height:560,width:700,url:'/gwyks/help.do'});
	}
	function openLinkWindow(url,id){
		/*alert(url);*/
		/* if(bab301!='16'){
		  	url = url.replace(/https/, "http"); 
		}
		window.open(url);    */
	  	$.ajax({
	  		url:'/gwyks/checkAnouce.do',
	  		data:{'id':id},
	  		method: 'post',
	  		success:function(res){
	  			let code = res.statusCode;
	  			if(code=='1'){
	  				window.open(url); 
	  			}else{
	  				url = url.replace(/https/, "http");
	  				window.open(url); 
	  			}
	  			
	  		},
	  		error:function(e){
	  			url = url.replace(/https/, "http");
  				window.open(url); 
	  		},
	  		dataType:'json'
	  	}); 

	}
	$(document).ready(function(){
		$('#area_chioce').click(function(){
			page_modal('pageModal',{title:'考区选择',height:450,width:820,url:'/gwyks/cms/chioceArea.do'});
		});
		// 假设 realauth 是从后端传递过来的
		var realauth = 'YL';

		// 判断 realauth 是否等于 'toga'
		if (realauth === 'toga') {
			// 隐藏这两个 div 元素
			document.getElementById('indexHelp').style.display = 'none';
			document.getElementById('indexBmlc').style.display = 'none';
		}
		var showExamScore = $('#showExamScore').val();
		if(showExamScore == 'show'){
			page_modal('pageModal_custom',{title:'温馨提示',showClose:'hide',height:410,width:750,url:'/gwyks/other/showExamScoreMessage.do'});
		}
	});
	endLoad(mydialog);
</script>