var dy = {};

dy.alert = function(message, title) {
	$.messager.alert(title || " ", message);
}

dy.show = function(s, h) {
	$('#' + s).show();
	$('#' + h).hide();
}

dy.refresh = function(url) {
	var targetUrl = url || "";
	if (targetUrl == "") {
		window.location.reload();
	} else {
		window.location.href = targetUrl;
	}
}

dy.javaScriptEncode = function(str){
     
    var hex=new Array('0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f');
        
    function changeTo16Hex(charCode){
        return "\\x" + charCode.charCodeAt(0).toString(16);
    }
    
    function encodeCharx(original) {
        
        var found = true;
        var thecharchar = original.charAt(0);
        var thechar = original.charCodeAt(0);
        switch(thecharchar) {
            case '\n': return "\\n"; break; //newline
            case '\r': return "\\r"; break; //Carriage return
            case '\'': return "\\'"; break;
            case '"': return "\\\""; break;
            case '\&': return "\\&"; break;
            case '\\': return "\\\\"; break;
            case '\t': return "\\t"; break;
            case '\b': return "\\b"; break;
            case '\f': return "\\f"; break;
            case '/': return "\\x2F"; break;
            case '<': return "\\x3C"; break;
            case '>': return "\\x3E"; break;
            default:
                found=false;
                break;
        }
        if(!found){
            if(thechar > 47 && thechar < 58){ //数字
                return original;
            }
            
            if(thechar > 64 && thechar < 91){ //大写字母
                return original;
            }

            if(thechar > 96 && thechar < 123){ //小写字母
                return original;
            }        
            
            if(thechar>127) { //大于127用unicode
                var c = thechar;
                var a4 = c%16;
                c = Math.floor(c/16); 
                var a3 = c%16;
                c = Math.floor(c/16);
                var a2 = c%16;
                c = Math.floor(c/16);
                var a1 = c%16;
                return "\\u"+hex[a1]+hex[a2]+hex[a3]+hex[a4]+"";        
            }
            else {
                return changeTo16Hex(original);
            }
            
        }
    }     
  
    var preescape = str;
    var escaped = "";
    var i=0;
    for(i=0; i < preescape.length; i++){
        escaped = escaped + encodeCharx(preescape.charAt(i));
    }
    return escaped;
};

dy.htmlEncode = function(str){
    var hex = new Array('0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f');
    var preescape = str;
    var escaped = "";
    for(var i = 0; i < preescape.length; i++){
        var p = preescape.charAt(i);
        escaped = escaped + escapeCharx(p);
    }
    
    return escaped;
                    
    function escapeCharx(original){
        var found=true;
        var thechar=original.charCodeAt(0);
        switch(thechar) {
            case 10: return "<br/>"; break; //newline
            case 32: return "&nbsp;"; break; //space
            case 34:return "&quot;"; break; //"
            case 38:return "&amp;"; break; //&
            case 39:return "&#x27;"; break; //'
            case 47:return "&#x2F;"; break; // /
            case 60:return "&lt;"; break; //<
            case 62:return "&gt;"; break; //>
            case 198:return "&AElig;"; break;
            case 193:return "&Aacute;"; break;
            case 194:return "&Acirc;"; break; 
            case 192:return "&Agrave;"; break; 
            case 197:return "&Aring;"; break; 
            case 195:return "&Atilde;"; break; 
            case 196:return "&Auml;"; break; 
            case 199:return "&Ccedil;"; break; 
            case 208:return "&ETH;"; break;
            case 201:return "&Eacute;"; break; 
            case 202:return "&Ecirc;"; break; 
            case 200:return "&Egrave;"; break; 
            case 203:return "&Euml;"; break;
            case 205:return "&Iacute;"; break;
            case 206:return "&Icirc;"; break; 
            case 204:return "&Igrave;"; break; 
            case 207:return "&Iuml;"; break;
            case 209:return "&Ntilde;"; break; 
            case 211:return "&Oacute;"; break;
            case 212:return "&Ocirc;"; break; 
            case 210:return "&Ograve;"; break; 
            case 216:return "&Oslash;"; break; 
            case 213:return "&Otilde;"; break; 
            case 214:return "&Ouml;"; break;
            case 222:return "&THORN;"; break; 
            case 218:return "&Uacute;"; break; 
            case 219:return "&Ucirc;"; break; 
            case 217:return "&Ugrave;"; break; 
            case 220:return "&Uuml;"; break; 
            case 221:return "&Yacute;"; break;
            case 225:return "&aacute;"; break; 
            case 226:return "&acirc;"; break; 
            case 230:return "&aelig;"; break; 
            case 224:return "&agrave;"; break; 
            case 229:return "&aring;"; break; 
            case 227:return "&atilde;"; break; 
            case 228:return "&auml;"; break; 
            case 231:return "&ccedil;"; break; 
            case 233:return "&eacute;"; break;
            case 234:return "&ecirc;"; break; 
            case 232:return "&egrave;"; break; 
            case 240:return "&eth;"; break; 
            case 235:return "&euml;"; break; 
            case 237:return "&iacute;"; break; 
            case 238:return "&icirc;"; break; 
            case 236:return "&igrave;"; break; 
            case 239:return "&iuml;"; break; 
            case 241:return "&ntilde;"; break; 
            case 243:return "&oacute;"; break;
            case 244:return "&ocirc;"; break; 
            case 242:return "&ograve;"; break; 
            case 248:return "&oslash;"; break; 
            case 245:return "&otilde;"; break;
            case 246:return "&ouml;"; break; 
            case 223:return "&szlig;"; break; 
            case 254:return "&thorn;"; break; 
            case 250:return "&uacute;"; break; 
            case 251:return "&ucirc;"; break; 
            case 249:return "&ugrave;"; break; 
            case 252:return "&uuml;"; break; 
            case 253:return "&yacute;"; break; 
            case 255:return "&yuml;"; break;
            case 162:return "&cent;"; break; 
            case '\r': break;
            default:
                found=false;
                break;
        }
        if(!found){
            if(thechar>127) {
                var c=thechar;
                var a4=c%16;
                c=Math.floor(c/16); 
                var a3=c%16;
                c=Math.floor(c/16);
                var a2=c%16;
                c=Math.floor(c/16);
                var a1=c%16;
                return "&#x"+hex[a1]+hex[a2]+hex[a3]+hex[a4]+";";        
            }
            else{
                return original;
            }
        }    
    }
};