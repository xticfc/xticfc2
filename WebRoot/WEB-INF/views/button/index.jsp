<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>xticfc</title>
<script type="text/javascript">
	$(function() {
		$( "input[type=button], a, button" )
	      .button()
	      .click(function( event ) {
	        event.preventDefault();
	      });
		
		$( "#check" ).button();
	    $( "#format" ).buttonset();
	    
	    $( "#iconbutton" ).button({
	        icons: {
	          primary: "ui-icon-locked"
	        },
	        text: false
	      }).next().button({
	        icons: {
	          primary: "ui-icon-locked"
	        }
	      }).next().button({
	        icons: {
	          primary: "ui-icon-gear",
	          secondary: "ui-icon-triangle-1-s"
	        }
	      }).next().button({
	        icons: {
	          primary: "ui-icon-gear",
	          secondary: "ui-icon-triangle-1-s"
	        },
	        text: false
	      });
	    
	    $( "#radio" ).buttonset();
	    
	    $( "#rerun" )
	      .button()
	      .click(function() {
	        alert( "Running the last action" );
	      })
	      .next()
	        .button({
	          text: false,
	          icons: {
	            primary: "ui-icon-triangle-1-s"
	          }
	        })
	        .click(function() {
	          var menu = $( this ).parent().next().show().position({
	            my: "left top",
	            at: "left bottom",
	            of: this
	          });
	          $( document ).one( "click", function() {
	            menu.hide();
	          });
	          return false;
	        })
	        .parent()
	          .buttonset()
	          .next()
	            .hide()
	            .menu();
	    
	    $( "#beginning" ).button({
	        text: false,
	        icons: {
	          primary: "ui-icon-seek-start"
	        }
	      });
	      $( "#rewind" ).button({
	        text: false,
	        icons: {
	          primary: "ui-icon-seek-prev"
	        }
	      });
	      $( "#play" ).button({
	        text: false,
	        icons: {
	          primary: "ui-icon-play"
	        }
	      })
	      .click(function() {
	        var options;
	        if ( $( this ).text() === "play" ) {
	          options = {
	            label: "pause",
	            icons: {
	              primary: "ui-icon-pause"
	            }
	          };
	        } else {
	          options = {
	            label: "play",
	            icons: {
	              primary: "ui-icon-play"
	            }
	          };
	        }
	        $( this ).button( "option", options );
	      });
	      $( "#stop" ).button({
	        text: false,
	        icons: {
	          primary: "ui-icon-stop"
	        }
	      })
	      .click(function() {
	        $( "#play" ).button( "option", {
	          label: "play",
	          icons: {
	            primary: "ui-icon-play"
	          }
	        });
	      });
	      $( "#forward" ).button({
	        text: false,
	        icons: {
	          primary: "ui-icon-seek-next"
	        }
	      });
	      $( "#end" ).button({
	        text: false,
	        icons: {
	          primary: "ui-icon-seek-end"
	        }
	      });
	      $( "#shuffle" ).button();
	      $( "#repeat" ).buttonset();
	});
	
</script>
</head>

<body>
<div id="c_main">
<!-- c_top start-->
<table width="800" align="center">
	<tr>
		<td>
			<button>按钮1</button>
			<input type="button" value="按钮长长长长长长2"/>
			<a href="#">链接按钮</a>
		</td>
	</tr>
	<tr>
		<td>
			<input type="checkbox" id="check" /><label for="check">Toggle</label>
			<div id="format">
			  <input type="checkbox" id="check1" /><label for="check1">B</label>
			  <input type="checkbox" id="check2" /><label for="check2">I</label>
			  <input type="checkbox" id="check3" /><label for="check3">U</label>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<button id="iconbutton">Button with icon only</button>
			<button>Button with icon on the left</button>
			<button>Button with two icons</button>
			<button>Button with two icons and no text</button>
		</td>
	</tr>
	
	<tr>
		<td>
			<input type="radio" id="radio1" name="radio" /><label for="radio1">Choice 1</label>
		    <input type="radio" id="radio2" name="radio" checked="checked" /><label for="radio2">Choice 2</label>
		    <input type="radio" id="radio3" name="radio" /><label for="radio3">Choice 3</label>
		</td>
	</tr>
	
	<tr>
		<td>
			<div>
			<div>
			    <button id="rerun">Run last action</button>
			    <button id="select">Select an action</button>
			  </div>
			  <ul>
			    <li><a href="#">Open...</a></li>
			    <li><a href="#">Save</a></li>
			    <li><a href="#">Delete</a></li>
			  </ul>
			 </div>
		</td>
	</tr>
	
	<tr>
		<td>
			<div id="toolbar" class="ui-widget-header ui-corner-all">
			  <button id="beginning">go to beginning</button>
			  <button id="rewind">rewind</button>
			  <button id="play">play</button>
			  <button id="stop">stop</button>
			  <button id="forward">fast forward</button>
			  <button id="end">go to end</button>
			 
			  <input type="checkbox" id="shuffle" /><label for="shuffle">Shuffle</label>
			 
			  <span id="repeat">
			    <input type="radio" id="repeat0" name="repeat" checked="checked" /><label for="repeat0">No Repeat</label>
			    <input type="radio" id="repeat1" name="repeat" /><label for="repeat1">Once</label>
			    <input type="radio" id="repeatall" name="repeat" /><label for="repeatall">All</label>
			  </span>
			</div>
		</td>
	</tr>
</table>
</div>
</body>
</html>