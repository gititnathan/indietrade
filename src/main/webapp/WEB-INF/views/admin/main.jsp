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
            <h4>�� ������</h4> <!-- �ֽ� ���� ��ϵǴ� ������� ���̺� �����ͼ� ���� �ֽ� 1,2,3 ������ -->
            <p>1 Million</p> 
          </div>
        </div>
        <div class="col-sm-3">
          <div class="well">
            <h4>�� ������</h4> <!-- �ֽ� ��ϵǴ� ������� ���̺� �����ͼ� 1,2,3 ���� ������ -->
            <p>100 Million</p> 
          </div>
        </div>
        <div class="col-sm-3">
          <div class="well">
            <h4>������ Ŭ����</h4> <!-- ������ Ŭ�� ���� ������� 1,2,3���� �ѷ��� -->
            <p>10 Million</p> 
          </div>
        </div>
        <div class="col-sm-3">
          <div class="well">
            <h4>�湮�� ��</h4> <!-- �ѹ湮������ ���� �湮��, ��¥���� �׷����� ��Ÿ���ְ�, ���̺����� 1,2,3������� ������ (����, ���̴���� �޾Ƽ� ������ ���ڳ�) -->
            <p>30%</p> 
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-6">
          <div class="well">
          ���� (�ֱ� ������ 3����� ���) <button type="button" class="btn pull-right">50</button> <!-- �ش� ������ �α׾ƿ� �������� �ٽ� �α����Ҷ����� ���� ������ ����� -->
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
           ���� (�ֱ� ��ϵ� 3������ ���) <button type="button" class="btn pull-right">200</button>
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
           ������ �� (Ŭ������ ���� ���� ž 3�� ������ ���) <button type="button" class="btn pull-right">20</button>
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
           �湮�� (�ֱ� ���� 3����� ������� ���) <button type="button" class="btn pull-right">1234</button>
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


