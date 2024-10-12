//---------主角：轮播图函数-------------
function slideshow() {
  var slideshow=document.getElementById("slideshow");
  imgs=slideshow.getElementsByTagName("img"); //得到图片们
  //logos=slideshow.getElementsByClassName("activelogo");
  //console.log("imgs"+imgs);
  current=0; //current为当前活跃的图片编号

  function slideOff() {
    imgs[current].className=""; //图片淡出
    imgs[current+1].className="nonactivelogo"; //图片淡出
    //logos[current].className="";
	}
  function slideOn() {
    imgs[current].className="active"; //图片淡入
    imgs[current+1].className="activelogo"; //图片淡入
    //logos[current++].className="activelogo";
  }

  function changeSlide() { //切换图片的函数
    slideOff(); //图片淡出
    current = current+2; //自增2
    if(current>=6) current=0;
    slideOn(); //图片淡入
  }
  
  //每5s调用changeSlide函数进行图片轮播
  var slideon=setInterval(changeSlide,3000);  
}

slideshow();