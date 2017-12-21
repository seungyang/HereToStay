<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 로그인폼 -->
	<div class="overlay2"></div>
		<form id="form" action="/owner/loginCheck.do" method="post" onsubmit="return submitForum(this);">
			<div class="autorize-popup2" style="z-index:9999;width:444px;height:255px;background:#fff;position:fixed;left:50%;top:-300px;margin-top:-128px;margin-left:-222px;">
				<div class="autorize-tabs2">
					<a href="#" class="autorize-tab-a current2" style="background:#141d1e; color:#fff;">로그인</a>
					<a href="#" class="autorize-close"></a>
					<div class="clear"></div>
				</div>
				<section class="autorize-tab-content">
					<div class="autorize-padding">
						<h6 class="autorize-lbl">'여기없대'를 방문해주셔서 감사합니다</h6>
						<input type="text" value="" placeholder="ID" name="ownId" id="logId" style="text-transform: none;">
						<input type="password" value="" placeholder="PASSWORD" name="ownPwd" id="logPwd" style="text-transform: none;">
							<button type="submit" class="authorize-btn" id="ownlogin" style="margin-right:10px;">로그인</button>
							<div></div>
							<button type="button" class="authorize-btn" id="ownRegis">회원가입</button>
							<div class="clear"></div>
					</div>
				</section>
			</div>
		</form>
		<!-- //로그인폼 -->
	<!-- scripts login 공백체크 -->
	<script src="/js/owner/jquery-2.1.3.min.js"></script>
	<script type="text/javascript"> 
		$(document).ready(function(){
			$('#ownRegis').click(function() {
				location.href="/owner/Register.do";
			});
		});
 
			function submitForum(formEl) {
				var errorMessage = null;
				var objFocus = null;
				if (formEl.logId.value.length == 0) {
					errorMessage = "아이디를 입력해주세요";
					objFocus = formEl.logId;
				} else if (formEl.logPwd.value.length == 0) {
					errorMessage = "비밀번호를 입력해 주세요";
					objFocus = formEl.logPwd;
				}
				if (errorMessage != null) {
					alert(errorMessage);
					objFocus.focus();
					return false;
				}
				return true;
			}
	</script>