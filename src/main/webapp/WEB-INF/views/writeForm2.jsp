<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title>mp3���ε� �� �͵�</title>
	<style>
        #order_container {position:absolute;left:0px;text-align:right;margin:5px;}
    </style>
    <script type="text/javascript">
</script>
 

</head>	
<body>
<div align="center">
	<form  id="fileUpload" name="fileUpload"  action="indie_write" method="post" 
	enctype= "multipart/form-data">
	<table border="1" width="500">
		<tr bgcolor="yellow">
			<th colspan="2">�ٹ�����ϱ�</th>
		</tr>
		<tr>
			<th bgcolor="yellow" size="50">�� �� �� ��</th>
			<td><input type="text" name="albumName" class="box"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" size="50">�� �� �� ��</th>
			<td><input type="text" name="artistName" class="box"></td>
		</tr>
		
		<tr>
			<th bgcolor="yellow" width="20%">�º� ��ũ</th>
			<td><input type="text" name="mvlink" class="box" size="50"></td>
		</tr>
		<tr bgcolor="yellow">
			<td colspan="2" align="center">
				<input type="submit" value="���ε�">
				<input type="reset" value="�ٽ��ۼ�">
				<input type="button" value="��Ϻ���" 	onclick="window.location='board_list'">
			</td>	
		</tr>
	</table>
	</form>
</div>
</body>
</html>