<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<script type="text/javascript">
	function checkForm() {
		
		if (!document.newMember.id.value) {
			alert("���̵� �Է��ϼ���.");
			return false;
		}

		if (!document.newMember.password.value) {
			alert("��й�ȣ�� �Է��ϼ���.");
			return false;
		}

		if (document.newMember.password.value != document.newMember.password_confirm.value) {
			alert("��й�ȣ�� �����ϰ� �Է��ϼ���.");
			return false;
		}
		if (!document.newMember.name.value) {
			alert("�̸��� �Է��ϼ���.");
			return false;
		}
		if (!document.newMember.mail1.value) {
			alert("���� �ּҸ� �Է��ϼ���.");
			return false;
		}
		if (document.newMember.mail1.value.includes('@')) {
			alert("�̸��� ���̵������ '@'�� ���Ե� �� �����ϴ�.");
			return false;
		}
		if (!document.newMember.usertype.value) {
			alert("������ �������ּ���.");
			return false;
		}
	}
</script>
<title>ȸ�� ����</title>
</head>
<body>
	<jsp:include page="/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">ȸ�� ����</h1>
		</div>
	</div>
	<div class="container">
		<%@ include file="../dbconn.jsp"%>
		<p>*�� �ʼ� �׸��Դϴ�. </p>
		<form name="newMember" class="form-horizontal"  action="processAddMember_.jsp" method="post" onsubmit="return checkForm()">
			<div class="form-group  row">
				<label class="col-sm-2 ">���̵� *</label>
				<div class="col-sm-3">
					<input name="id" type="text" class="form-control" placeholder="id" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">��й�ȣ *</label>
				<div class="col-sm-3">
					<input name="password" type="text" class="form-control" placeholder="password" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">��й�ȣȮ�� *</label>
				<div class="col-sm-3">
					<input name="password_confirm" type="text" class="form-control" placeholder="password confirm" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">���� *</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" placeholder="name" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">����</label>
				<div class="col-sm-10">
					<input name="gender" type="radio" value="��" /> �� 
					<input name="gender" type="radio" value="��" /> ��
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">����</label>
				<div class="col-sm-4  ">
					<input type="text" name="birthyy" maxlength="4" placeholder="��(4��)" size="6"> 
					<select name="birthmm">
						<option value="">��</option>
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select> <input type="text" name="birthdd" maxlength="2" placeholder="��" size="4">
				</div>
			</div>
			<div class="form-group  row ">
				<label class="col-sm-2">�̸��� *</label>
				<div class="col-sm-10">
					<input type="text" name="mail1" maxlength="50">@ 
					<select name="mail2">
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gmail.com</option>
						<option>nate.com</option>
					</select>
				</div>				
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">��ȭ��ȣ</label>
				<div class="col-sm-3">
					<input name="phone" type="text" class="form-control" placeholder="phone" >

				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2 ">�ּ�</label>
				<div class="col-sm-5">
					<input name="address" type="text" class="form-control" placeholder="address">

				</div>
				<div class="form-group  row">
                <label class="col-sm-2 ">���� *</label>
                <div class="col-sm-5">
                    <input name="usertype" type="radio" value="1" /> ������ 
                    <input name="usertype" type="radio" value="2" /> �Ǹ���
                </div>
            	</div>
			</div>
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary " value="��� " > 
					<input type="reset" class="btn btn-primary " value="��� " onclick="reset()" >
				</div>
			</div>
		</form>
	</div>
</body>
</html>