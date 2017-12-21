 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!------------------------------ START OF 관리자 로그인 모달 ------------------------------ -->
   <div class="overlay3"></div>
   <form id="form" action="/manager/loginCheck.do" method="post">
   <div class="autorize-popup3" style="z-index:9999;width:444px;height:255px;background:#fff;position:fixed;left:50%;top:-300px;margin-top:-128px;margin-left:-222px;">
      <div class="autorize-tabs3">
         <a href="#" class="autorize-tab-a current3" style="background:#141d1e; color:#fff;">로그인</a>

         <a href="#" class="autorize-close"></a>
         <div class="clear"></div>
      </div>

      <section class="autorize-tab-content">
         <div class="autorize-padding">
            <h6 class="autorize-lbl">'여기없대'를 방문해주셔서 감사합니다</h6>
            <input type="text" value="" placeholder="ID" name="mgrId" style="text-transform: none;" style="text-transform: none;">
            <input type="password" value="" placeholder="PASSWORD" name="mgrPwd" style="text-transform: none;" style="text-transform: none;">
            <footer class="autorize-bottom">
               <button type="submit" name="Submit" class="authorize-btn">로그인</button>

               <div class="clear"></div>
            </footer>
         </div>
      </section>
   		</div>
      </form>
<!------------------------------ END OF 관리자 로그인 모달 ------------------------------ -->	