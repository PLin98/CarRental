<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>修改密码</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${rincar }/resources/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="${rincar }/resources/css/public.css" media="all" />
</head>
<body class="childrenBody">
<form class="layui-form layui-row changePwd">
	<div class="layui-col-xs12 layui-col-sm6 layui-col-md6">
		<div class="layui-input-block layui-red pwdTips">请输入旧密码，新密码必须两次输入一致才能提交</div>
		<div class="layui-form-item">
			<label class="layui-form-label">用户名</label>
			<div class="layui-input-block">
				<input type="text" value="${sessionScope.user.loginname}" disabled class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">旧密码</label>
			<div class="layui-input-block">
				<input type="password" name="oldPwd" value="" placeholder="请输入旧密码" lay-verify="required|oldPwd" class="layui-input pwd">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">新密码</label>
			<div class="layui-input-block">
				<input type="password" name="newPwd" value="" placeholder="请输入新密码" lay-verify="required|newPwd" id="oldPwd" class="layui-input pwd">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">确认密码</label>
			<div class="layui-input-block">
				<input type="password" name="confirmPwd" value="" placeholder="请确认密码" lay-verify="required|confirmPwd" class="layui-input pwd">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="changePwd">立即修改</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</div>
</form>
<script type="text/javascript" src="${rincar }/resources/layui/layui.js"></script>
<!-- <script type="text/javascript" src="user.js"></script> -->
<script type="text/javascript">
var form, $;
layui.use(['form','layer','table','laytpl','laydate'],function(){
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        laydate = layui.laydate,
        laytpl = layui.laytpl,
        table = layui.table;
    form.render();
    //添加验证规则
    form.verify({
        oldPwd : function(value, item){
        	var message=''; 
  		  $.ajax({          
  			  url: "${rincar}/user/getOldPwd.action",       
  			  type: "post",                
  			  async: false,                   
  			  data: {          				
  				oldPwd:value                
  				  },                  
  			  dataType: "json",       
  			  success: function (data) {     
  				  if(data.msg!='1'){
  					  message = '旧密码输入错误，请重新输入！'
  				 		
  				  	} 
  				}   
  			});    
  		  return message;
  		 },
        newPwd : function(value, item){
            if(value.length < 6){
                return "密码长度不能小于6位";
            }
        },
        confirmPwd : function(value, item){
            if(!new RegExp($("#oldPwd").val()).test(value)){
                return "两次输入密码不一致，请重新输入！";
            }
        }
    });
    
  	//修改密码
    form.on("submit(changePwd)",function(data){
        var index = layer.msg('提交中，请稍候',{icon: 16,time:false,shade:0.8});
        $.ajax({  
			  url: "${rincar}/user/changePwd.action",       
			  type: "post",                
			  async: false,                   
			  data: data.field,                  
			  dataType: "json",       
			  success: function (data) {  
				  if(data.msg!='1'){ 
					  layer.close(index);
					  $(".pwd").val('');
					  layer.alert("修改成功",{icon: 1,time:2000});
					  window.parent.location.reload();
					  //window.location.href = "${rincar }/desk/toDeskManager.action"; 
				  	} else{
				  		layer.alert("修改失败");
				  	}
				}   
			}); 
        return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
    })
})

</script>
</body>
</html>