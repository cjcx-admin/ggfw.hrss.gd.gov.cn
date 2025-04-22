




<style type="text/css">
	.index-wu{
		color:white !important;
		float:left;
		padding-right: 100px;
		font-size: 20px;
	}
	.index-wu:hover{
		color:white !important;
	}
</style>
<h1>广东省公务员考试录用管理系统（考生报名）</h1>
<div class="min_menu">
	<!-- 
		<div>
		<a href="javascript:;" onclick="EditPwd();"> <span
			class="glyphicon glyphicon-lock min-icon-color"></span> <font>修改密码</font>
		</a>
	</div>
	<div>
		<a href="javascript:;"> <span
			class="glyphicon glyphicon-envelope min-icon-color"></span> <font>修改邮箱</font>
		</a>
	</div>
	<div>
		<a href="javascript:;" onclick="openET();"> <span
			class="glyphicon glyphicon-phone min-icon-color"></span> <font>修改手机</font>
		</a>
	</div>
	 -->
	<!-- 
	<div>
		<a href="javascript:;" onclick="openHelp();"> <span
			class="glyphicon glyphicon-question-sign min-icon-color"></span> <font>帮助</font>
		</a>
	</div>
	 -->
	
	<div>
		<a href="https://ggfw.hrss.gd.gov.cn/yamface/face.html" target="_blank"> <span
			class="glyphicon glyphicon-user min-icon-color"></span> <font>用户管理</font>
		</a>
	</div>
	<div>
		<a href="javascript:;" onclick="signOut();"> <span
			class="glyphicon glyphicon-off min-icon-color"></span> <font>退出登录</font>
		</a>
	</div>
</div>

<div class="top_welcom">
	<a title="无障碍通道" href="javascript:;" onclick="ShowDetail()" class="index-wu" accesskey="g" onmousedown="ShowDetail()" target="_self">进入无障碍通道</a>
	<span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<span id="loginText">吴京哲</span>,欢迎进入报名系统！
</div>
<script type="text/javascript">
	function EditPwd(){
		page_modal('pageModal',{title:'密码修改',height:280,width:400,url:'/gwyks/exam/user/pwd/tovs.do'});
	}
	function openET(){
		page_modal('pageModal',{title:'密码修改',height:280,width:400,url:'/gwyks/exam/user/et/to.do'});
	}
	function signOut(){
		var basePath='http://ggfw.hrss.gd.gov.cn/gwyks/';
		var ctx = '/gwyks';
		console.log('ctx='+ctx);
		if(basePath.indexOf('hrss.gd')>-1){
			ctx = ctx.replaceAll(":8443","");
			basePath = basePath.replaceAll(":8443","");
			location.href=ctx+'/dologout?ret_url='+encodeURIComponent(encodeURIComponent(basePath));
		}else{
			ctx = ctx.replaceAll(":8443","");
			basePath = basePath.replaceAll(":8443","");
			location.href=ctx+'/index.do';
		}
	}
	function ShowDetail() {
		var ctx = '/gwyks';
		if (window.top.document.getElementById("rrbay_wzatool")) {
			return false;
		}
		var url = "?url=" + document.location.href;
		window.scrollTo(0, 0);
		console.log("1111:"+ctx)
		location.href= ctx+"/resource/canyou/index.html"+url;
	}
</script>