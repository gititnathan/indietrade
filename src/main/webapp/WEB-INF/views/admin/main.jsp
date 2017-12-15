<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="euc-kr"/>

<c:import url="top.jsp" charEncoding="utf-8"/>


<div class="container" id="content"><p>  
    <div class="col-sm-12">
     
      <div class="row">
        <div class="col-sm-3">
          <div class="well">
            <h4>총 유저수</h4> <!-- 최신 가입 등록되는 순서대로 테이블 가져와서 가장 최신 1,2,3 보여줌 -->
            <p>1 Million</p> 
          </div>
        </div>
        <div class="col-sm-3">
          <div class="well">
            <h4>총 음원수</h4> <!-- 최신 등록되는 순서대로 테이블 가져와서 1,2,3 까지 보여줌 -->
            <p>100 Million</p> 
          </div>
        </div>
        <div class="col-sm-3">
          <div class="well">
            <h4>페이지 클릭수</h4> <!-- 페이지 클릭 높은 순서대로 1,2,3까지 뿌려줌 -->
            <p>10 Million</p> 
          </div>
        </div>
        <div class="col-sm-3">
          <div class="well">
            <h4>방문자 수</h4> <!-- 총방문수부터 오늘 방문수, 날짜별로 그래프로 나타내주고, 테이블에서는 1,2,3등까지만 보여줌 (성별, 나이대까지 받아서 가리면 좋겠네) -->
            <p>30%</p> 
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-6">
          <div class="well">
          유저 (최근 가입한 3명까지 출력) <button type="button" class="btn pull-right">50</button> <!-- 해당 관리자 로그아웃 순간부터 다시 로그인할때까지 새로 가입한 사람들 -->
           <table class="table">
    <thead>
      <tr>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Email</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
      <tr>
        <td>Mary</td>
        <td>Moe</td>
        <td>mary@example.com</td>
      </tr>
      <tr>
        <td>July</td>
        <td>Dooley</td>
        <td>july@example.com</td>
      </tr>
    </tbody>
  </table>
          </div>
        </div>
        <div class="col-sm-6">
          <div class="well">
           음원 (최근 등록된 3개까지 출력) <button type="button" class="btn pull-right">200</button>
            <table class="table">
    <thead>
      <tr>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Email</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
      <tr>
        <td>Mary</td>
        <td>Moe</td>
        <td>mary@example.com</td>
      </tr>
      <tr>
        <td>July</td>
        <td>Dooley</td>
        <td>july@example.com</td>
      </tr>
    </tbody>
  </table>
          </div>
        </div>
       
      </div>
      <div class="row">
        <div class="col-sm-6">
          <div class="well">
           페이지 뷰 (클릭수가 가장 많은 탑 3개 페이지 출력) <button type="button" class="btn pull-right">20</button>
            <table class="table">
    <thead>
      <tr>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Email</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
      <tr>
        <td>Mary</td>
        <td>Moe</td>
        <td>mary@example.com</td>
      </tr>
      <tr>
        <td>July</td>
        <td>Dooley</td>
        <td>july@example.com</td>
      </tr>
    </tbody>
  </table> 
          </div>
        </div>
        <div class="col-sm-6">
          <div class="well">
           방문자 (최근 들어온 3명까지 순서대로 출력) <button type="button" class="btn pull-right">1234</button>
            <table class="table">
    <thead>
      <tr>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Email</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
      <tr>
        <td>Mary</td>
        <td>Moe</td>
        <td>mary@example.com</td>
      </tr>
      <tr>
        <td>July</td>
        <td>Dooley</td>
        <td>july@example.com</td>
      </tr>
    </tbody>
  </table>
          </div>
        </div>
      </div>
    </div>
  </div>


<c:import url="bottom.jsp" charEncoding="utf-8"/>


