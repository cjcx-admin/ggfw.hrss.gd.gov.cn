



<ul id="navi-list">
</ul>
<script type="text/javascript">
	function menuInit(){
		var $ul = $('#navi-list');
		$ul.append('<div class="list_title"><span><b>功能列表</b></span></div>');
		if($ul){
			for(var i=0;i<menu.length;i++){
				var o = menu[i];
				$ul.append('<a href="javascript:;" ><li id="'+'Item_'+o.code+'" class="menuItem menuItem_'+o.code+'">'+o.name+'</li></a>');
				var $li = $ul.find('li:eq('+i+')');
				$li.data('rscode',o.code);
				$li.data('uri',ctx+o.uri);
				$li.click(function(){
					$ul.find('li a').removeClass("menu-font-active");
					$(this).find('a').addClass("menu-font-active");
					var rscode = $(this).data('rscode');
					var uri = $(this).data('uri');
					if(uri&&uri!=''){
						startLoad(mydialog);
						/*						try {
							frame_logo.load('/gwyks/exam/source/logo/logon.do');
						} catch (e) {
							// TODO: handle exception
						}
						 $.ajax({cache:false});  */
						$('body').data('targetCode',new Date().getTime());
						$('.index-content:eq(0)').load(uri+'?nvt='+new Date().getTime(),function(response,status,xhr){
							if(status == 'timeout' || status == 'success' || status == 'error'){
								endLoad(mydialog);
							}
							if(status == 'timeout'){
								alert('加载页面超时！');
							}else if(status == 'error'){
								alert('加载页面出错！');
							}
						});
					}
				});
			}
		}
	}
	$(document).ready(function(){
		menuInit();
	});
</script>
