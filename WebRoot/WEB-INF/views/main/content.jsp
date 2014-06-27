<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>xticfc2</title>
</head>
<body>
<div class="center_con">
 <div class="butSet">
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="left">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>    
                    <select class="select1">
                        <option>按报表名称查询</option>
                    </select>
                    <input name="" type="radio" value="激活" />&nbsp;激活  &nbsp;&nbsp;&nbsp;
                    <input name="" type="radio" value="未激活" />&nbsp;未激活
                </td>
              </tr>
            </table>
        </td>
        <td align="right">
          <table width="100%" border="0" cellspacing="0" cellpadding="0" >
              <tr>
                <td align="right">    
                  <a href="#" class="bsty0"></a>
                </td>
              </tr>
            </table>
        </td>
      </tr>
  </table>
 </div>
 <div class="tabCon">
<table width="100%" class="table3" cellpadding="0"  cellspacing="0">
      <tr>
        <th>系统名称</th>
        <th>地址</th>
        <th>当前状态</th>
        <th>操作</th>
      </tr>
      <tr onmouseover="this.className='f_on'" class="f_off"  onmouseout="this.className='f_off'">
        <td>县级植保通</td>
        <td>北京市朝阳区松榆东里南路南新园2号 3层</td>
        <td>2012-2-16</td>
        <td>
           <table width="100%" border="0" cellspacing="0" class="table_t"  cellpadding="0">
              <tr>
                <td><div align="center"><img src="${ctx }/images/037.gif" width="9" height="9" />&nbsp;[<a href="#">修改</a>]</div></td>
                <td><div align="center"><img  src="${ctx }/images/delete.gif" width="9" height="9" />&nbsp;[<a href="#">删除</a>]</div></td>
              </tr>
           </table>
        </td>
    </tr>
</table>
</div>
</div>
</body>
</html>