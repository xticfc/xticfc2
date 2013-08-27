/**
	拼接字符串工具类,用法与java中的StringBuffer类似
	经测试,在大批量数据拼接时,在IE中比直接用s+= 'a'这种形式快大概30多倍
	在其它浏览器中差距不明显
*/
function StringBuffer(){
	this.__string__ = new Array();
}
StringBuffer.prototype.append = function(str){
	this.__string__.push(str);
	return this;
}
StringBuffer.prototype.toString = function(){
	return this.__string__.join("");
}