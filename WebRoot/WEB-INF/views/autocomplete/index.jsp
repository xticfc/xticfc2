<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>xticfc</title>
<script type="text/javascript">
	$(function() {
		var availableTags = [
             "ActionScript",
             "AppleScript",
             "Asp",
             "BASIC",
             "C",
             "C++",
             "Clojure",
             "COBOL",
             "ColdFusion",
             "Erlang",
             "Fortran",
             "Groovy",
             "Haskell",
             "Java",
             "JavaScript",
             "Lisp",
             "Perl",
             "PHP",
             "Python",
             "Ruby",
             "Scala",
             "Scheme"
           ];
           $( "#tags" ).autocomplete({
             source: availableTags
           });
	});
	
</script>
</head>

<body>
<div id="c_main">
<!-- c_top start-->
<table width="800" align="center">
	<tr>
		<td>
			<div class="ui-widget">
			  <label for="tags">Tags: </label>
			  <input id="tags" />
			</div>
		</td>
	</tr>
</table>
</div>
</body>
</html>