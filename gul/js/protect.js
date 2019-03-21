document.onkeydown=function(){
    var e = window.event||arguments[0];
    if(e.keyCode==123){
    	alert('唐方鹏博客主页提醒您!请尊重劳动成果！https://vpfak.github.io');
            return false;
    }else if((e.ctrlKey)&&(e.shiftKey)&&(e.keyCode==73)){
    	alert('唐方鹏博客主页提醒您!请尊重劳动成果！https://vpfak.github.io');
            return false;
    }else if((e.ctrlKey)&&(e.keyCode==85)){
            alert('唐方鹏博客主页提醒您!请尊重劳动成果！https://vpfak.github.io');
            return false;
    }else if((e.ctrlKey)&&(e.keyCode==83)){
           alert('唐方鹏博客主页提醒您!请尊重劳动成果！https://vpfak.github.io');
           return false;
    }
}
document.oncontextmenu=function(){
	alert('唐方鹏博客主页提醒您!请尊重劳动成果！https://vpfak.github.io');
    return false;
}