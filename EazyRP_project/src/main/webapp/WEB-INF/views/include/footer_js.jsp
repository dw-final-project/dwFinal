<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>

<script>

	function goPage(murl, mcode){

		sessionStorage.setItem("mcode", mcode);
		
		let modMcode = mcode.substring(0,3) + "0000";


		location.href = murl + "?mcode=" + modMcode;
	};
	
</script>