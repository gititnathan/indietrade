<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title>mp3���ε� �� �͵�</title>
	<style>
        #order_container {position:absolute;left:0px;text-align:right;margin:5px;}
    </style>
    <script type="text/javascript">
<!--
    function handleFileSelect() 
    {
        var files = document.getElementById('up_files').files[0]; //���� ��ü
 
        var reader = new FileReader();
 
        //�������� ����        
        reader.onload = (function(theFile) 
        {
            return function(e) 
            {
                //�̹��� ��
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
			<th colspan="2">�ٹ�����ϱ�</th>
		</tr>
		<tr>
			<input type="hidden" name="artistnum" value="0" />
			<input type="hidden" name="albumnum" value="0" />
			<th bgcolor="yellow" size="50">�� �� �� ��</th>
			<td><input type="text" name="albumtitle" class="box"></td>
		</tr>
	
		<tr>
			<th bgcolor="yellow" width="20%">�ٹ� ���� �̹���</th>
			<td><input type="file" id="up_files" name="albumImage" onchange="handleFileSelect()"/><br>
			<div id="list"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">���� ����</th>
			<td><input type="file" name="musicFiles" onchange="handleFileSelect()" multiple></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">�帣</th>
			<td><input type="text" name="genre" class="box" size="50"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">�º� ��ũ</th>
			<td><input type="text" name="mvLink" class="box" size="50"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">���� �� �۰�</th>
			<td><textarea name="contributor" rows="13" cols="50" class="box"></textarea></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">�� �� �� ��</th>
			<td><textarea name="albumDesc" rows="13" cols="50" class="box"></textarea></td>
		</tr>
		<tr bgcolor="yellow">
			<td colspan="2" align="center">
				<input type="submit" value="���ε�">
				<input type="reset" value="�ٽ��ۼ�">
				<input type="button" value="��Ϻ���" 	onclick="window.location='album_list'">
			</td>	
		</tr>
	</table>
	</form>
</div>
</body>
</html>