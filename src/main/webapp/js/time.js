/**
 * 
 */
window.onload=function startTime(){
	var today = new Date();
	var h = today.getHours();
	var m = today.getMinutes();
	var s = today.getSeconds();
	m = checkTime(m);
	s = checkTime(s);
	var year=today.getFullYear();//年 
	var month=today.getMonth()+1;//月
	var date=today.getDate()//日
	//获取星期
	var week="";
	var nunOfWeek=today.getDay();
	switch(nunOfWeek){
	    case 0:week="星期日";break;
	    case 1:week="星期一";break;
	    case 2:week="星期二";break;
	    case 3:week="星期三";break;
	    case 4:week="星期四";break;
	    case 5:week="星期五";break;
	    case 6:week="星期六";break;
	}
	document.getElementById('time').innerHTML =year+"-"+month+"-"+date+" "+h+":"+m+":"+s+"  "+""+week;
	    t = setTimeout(function(){
	    	startTime();
	    },500);
}
	function checkTime(i){
	    if(i<10){
	    	i="0"+i;
	    }
	    return i;
	}
		    

		    