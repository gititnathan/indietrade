<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title>mp3업로드 할 것들</title>
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
			<th colspan="2">앨범등록하기</th>
		</tr>
		<tr>
			<th bgcolor="yellow" size="50">앨 범 이 름</th>
			<td><input type="text" name="albumName" class="box"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" size="50">가 수 이 름</th>
			<td><input type="text" name="artistName" class="box"></td>
		</tr>
		
		<tr>
			<th bgcolor="yellow" width="20%">뮤비 링크</th>
			<td><input type="text" name="mvlink" class="box" size="50"></td>
		</tr>
		<tr bgcolor="yellow">
			<td colspan="2" align="center">
				<input type="submit" value="업로드">
				<input type="reset" value="다시작성">
				<input type="button" value="목록보기" 	onclick="window.location='board_list'">
			</td>	
		</tr>
	</table>
	</form>
</div>
</body>
</html>