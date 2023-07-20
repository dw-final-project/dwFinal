<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="content-wrapper">
<div style="float: right">
<table border="1px solid" style="margin-right: 40px;">
	<tr>
		<td width="300px" colspan="3" style="text-align: center;">${content.get(0) }</td>
	</tr>
	<tr height="100px">
		<td width="100px"></td>
		<td width="100px"></td>
		<td width="100px"></td>
	</tr>
	<tr>
		<td width="100px" style="text-align: center;">${content.get(1) }</td>
		<td width="100px" style="text-align: center;">${content.get(2) }</td>
		<td width="100px" style="text-align: center;">${content.get(3) }</td>
	</tr>
	<tr>
		<td width="100px" style="text-align: center;">${content.get(4) }</td>
		<td width="100px" style="text-align: center;">${content.get(5) }</td>
		<td width="100px" style="text-align: center;">${content.get(6) }</td>
	</tr>
</table>
</div>
<table border="1px solid" style="justify-content: center; align-content: center">
	<tr height="30px">
		<td width="800px" colspan="6" style="text-align: center;">${content.get(7) }</td>
	</tr>
	<tr height="30px">
		<td colspan="6" style="text-align: center;">${content.get(8) }</td>
	</tr>
	<tr height="30px">
		<td width="100px" style="text-align: center;">${content.get(9) }</td>
		<td width="100px" style="text-align: center;">${content.get(10) }</td>
		<td width="100px" style="text-align: center;">${content.get(11) }</td>
		<td width="100px" style="text-align: center;">${content.get(12) }</td>
		<td width="100px" style="text-align: center;">${content.get(13) }</td>
		<td width="300px" style="text-align: center;">${content.get(14) }</td>
	</tr>
	<tr height="30px">
		<td style="text-align: center;">${content.get(15) }</td>
		<td colspan="5" style="text-align: center;">${content.get(16) }</td>
	</tr>
	<tr height="30px">
		<td style="text-align: center;">${content.get(17) }</td>
		<td colspan="5" style="text-align: center;">${content.get(18) }</td>
	</tr>
	<tr height="30px">
		<td style="text-align: center;">${content.get(19) }</td>
		<td colspan="5" style="text-align: center;">${content.get(20) }</td>
	</tr>
	<tr height="30px">
		<td style="text-align: center;">${content.get(21) }</td>
		<td colspan="5" style="text-align: center;">${content.get(22) }</td>
	</tr>
	<tr height="30px">
		<td style="text-align: center;">${content.get(23) }</td>
		<td colspan="5" style="text-align: center;">${content.get(24) }</td>
	</tr>
	<tr height="30px">
		<td style="text-align: center;">${content.get(23) }</td>
		<td colspan="5" style="text-align: center;">${content.get(24) }</td>
	</tr>
	<tr height="30px">
		<td rowspan="10" style="text-align: center;">${content.get(25) }</td>
		<td style="text-align: center;">${content.get(26) }</td>
		<td style="text-align: center;">${content.get(27) }</td>
		<td style="text-align: center;">${content.get(28) }</td>
		<td colspan="2" style="text-align: center;">${content.get(29) }</td>
	</tr>
	<tr height="30px">
		<td style="text-align: center;">${content.get(30) }</td>
		<td style="text-align: center;">${content.get(31) }</td>
		<td style="text-align: center;">${content.get(32) }</td>
		<td rowspan="2" style="text-align: center;">${content.get(33) }</td>
		<td style="text-align: center;">${content.get(34) }</td>
	</tr>
	<tr height="30px">
		<td style="text-align: center;">${content.get(35) }</td>
		<td style="text-align: center;">${content.get(36) }</td>
		<td style="text-align: center;">${content.get(37) }</td>
		<td style="text-align: center;">${content.get(38) }</td>
	</tr>
	<tr height="30px">
		<td style="text-align: center;">${content.get(39) }</td>
		<td style="text-align: center;">${content.get(40) }</td>
		<td style="text-align: center;">${content.get(41) }</td>
		<td rowspan="2" style="text-align: center;">${content.get(42) }</td>
		<td style="text-align: center;">${content.get(43) }</td>
	</tr>
	<tr height="30px">
		<td style="text-align: center;">${content.get(44) }</td>
		<td style="text-align: center;">${content.get(45) }</td>
		<td style="text-align: center;">${content.get(46) }</td>
		<td style="text-align: center;">${content.get(47) }</td>
	</tr>
	<tr height="30px">
		<td style="text-align: center;">${content.get(48) }</td>
		<td style="text-align: center;">${content.get(49) }</td>
		<td style="text-align: center;">${content.get(50) }</td>
		<td rowspan="2" style="text-align: center;">${content.get(51) }</td>
		<td style="text-align: center;">${content.get(52) }</td>
	</tr>
	<tr height="30px">
		<td style="text-align: center;">${content.get(53) }</td>
		<td style="text-align: center;">${content.get(54) }</td>
		<td style="text-align: center;">${content.get(55) }</td>
		<td style="text-align: center;">${content.get(56) }</td>
	</tr>
	<tr height="30px">
		<td style="text-align: center;">${content.get(57) }</td>
		<td style="text-align: center;">${content.get(58) }</td>
		<td style="text-align: center;">${content.get(59) }</td>
		<td rowspan="2" style="text-align: center;">${content.get(60) }</td>
		<td style="text-align: center;">${content.get(61) }</td>
	</tr>
	<tr height="30px">
		<td style="text-align: center;">${content.get(62) }</td>
		<td style="text-align: center;">${content.get(63) }</td>
		<td style="text-align: center;">${content.get(64) }</td>
		<td style="text-align: center;">${content.get(65) }</td>
	</tr>
	<tr height="30px">
		<td style="text-align: center;">${content.get(66) }</td>
		<td style="text-align: center;">${content.get(67) }</td>
		<td style="text-align: center;">${content.get(68) }</td>
		<td style="text-align: center;">${content.get(69) }</td>
		<td style="text-align: center;">${content.get(70) }</td>
	</tr>
	<tr height="300px">
		<td colspan="6">${content.get(71) }</td>
	</tr>
</table>

</div>