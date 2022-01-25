<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Edit</title>
</head>
<body>
	<h1></h1>
	<hr />


	<form method="post">
		<fieldset>
			<legend>수정하실 문구를 입력해주세요</legend>
			<table>
				<tr>
					<td><input type="text" name="editTitle" value=<%= item.about %>></td><br>
					<td><input type="text" name="editContent" value=<%= item.about %>></td>
				</tr>
			</table>
			<input type="submit" value="EDIT" />
		</fieldset>
	</form>


</body>
</html>