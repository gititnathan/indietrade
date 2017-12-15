<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title>mp3업로드 할 것들</title>
	<style>
        #order_container {position:absolute;left:0px;text-align:right;margin:5px;}
    </style>
    <script type="text/javascript">
<!--
    function handleFileSelect() 
    {
        var files = document.getElementById('up_files').files[0]; //파일 객체
 
        var reader = new FileReader();
 
        //파일정보 수집        
        reader.onload = (function(theFile) 
        {
            return function(e) 
            {
                //이미지 뷰
                var img_view = ['<img src="', e.target.result, '" title="', escape(theFile.name), '"/>'].join('');                
                document.getElementById('list').innerHTML = img_view;
            };
 
        })(files);
            
        reader.readAsDataURL(files);    
    }
 
//-->
</script>
 <script src="js\jquery-3.2.1.min.js"></script>

</head>	
<body>
<div align="center">
	<form  id="fileUpload" name="fileUpload"  action="album_write" method="post" 
	onsubmit="return check()" enctype= "multipart/form-data">
	<table border="1" width="500">
		<tr bgcolor="yellow">
			<th colspan="2">앨범등록하기</th>
		</tr>
		<tr>
			<input type="hidden" name="artistnum" value="0" />
			<input type="hidden" name="albumnum" value="0" />
			<th bgcolor="yellow" size="50">앨 범 이 름</th>
			<td><input type="text" name="albumtitle" class="box"></td>
		</tr>
	
		<tr>
			<th bgcolor="yellow" width="20%">앨범 자켓 이미지</th>
			<td><input type="file" id="up_files" name="albumImage" onchange="handleFileSelect()"/><br>
			<div id="list"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">음악 파일</th>
			<td><input type="file" name="musicFiles" onchange="handleFileSelect()" multiple></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">장르</th>
			<td><input type="text" name="genre" class="box" size="50"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">뮤비 링크</th>
			<td><input type="text" name="mvLink" class="box" size="50"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">세션 및 작곡</th>
			<td><textarea name="contributor" rows="13" cols="50" class="box"></textarea></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">앨 범 소 개</th>
			<td><textarea name="albumDesc" rows="13" cols="50" class="box"></textarea></td>
		</tr>
		<tr bgcolor="yellow">
			<td colspan="2" align="center">
				<input type="submit" value="업로드">
				<input type="reset" value="다시작성">
				<input type="button" value="목록보기" 	onclick="window.location='album_list'">
			</td>	
		</tr>
	</table>
	</form>
</div>
</body>
</html>