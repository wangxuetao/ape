<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>
<c:set var="cp" scope="session" value="${pageContext.request.servletContext.contextPath}"/>

<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8" />
  <link rel="shortcut icon" href="${cp }/images/favicon.ico" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>大猿电子简历</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" type="text/css" href="${cp }/css/resume/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="${cp }/css/resume/style.css">
  <link rel="stylesheet" href="${cp }/css/resume/font-awesome.min.css">
</head>

<body>
  <div class="wrapper" id="wrapper">
    <header>
      <div class="banner row" id="banner">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 noPadd slides-container" style="height:100%">
          <div class="slide">
            <img src="${cp }/images/resume/header-bg1.jpg" width="1024" height="682">
          </div>
          <div class="slide">
            <img src="${cp }/images/resume/header-bg2.jpg" width="1024" height="682">
          </div>
          <div class="slide">
            <img src="${cp }/images/resume/header-bg3.jpg" width="1024" height="682">
          </div>
          <div class="slide">
            <img src="${cp }/images/resume/header-bg4.jpg" width="1024" height="682">
          </div>
        </div>
        <div class="bannerText container">
          <h1>我叫唐泽雄
                    </h1>
          <p>前端开发工程师，毕业于中山大学。两年多前端开发经验，乐于尝试新技术，学习能力强，热爱阅读英文资料
          </p>
          <a href="#aboutme" class="mbnt">关于我</a>
          <a href="index-en.html" class="mbnt">英文版</a>
        </div>
      </div>
      <div class="menu">
        <div class="navbar-wrapper">
          <div class="container">
            <div class="navwrapper">
              <div class="navbar navbar-inverse navbar-static-top">
                <div class="container">
                  <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">导航</a>
                  </div>
                  <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav nav-justified">
                      <li class="first menuItem homeLink active">
                        <a href="#wrapper">首页</a>
                      </li>
                      <li class="menuItem">
                        <a href="#aboutme">关于我</a>
                      </li>
                      <li class="menuItem">
                        <a href="#technical">技能</a>
                      </li>
                      <li class="menuItem">
                        <a href="#exprience">经历</a>
                      </li>
                      <li class="menuItem">
                        <a href="#reffernces">项目</a>
                      </li>
                      <li class="menuItem">
                        <a href="#contact">联系我</a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </header>
    <section class="aboutme" id="aboutme">
      <div class="container">
        <div class="row">
          <div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 aboutCont">
            <div class="heading clearfix">
              <h2>关于我</h2>
            </div>
            <div id="description">
              <p>
                我是来自深圳的前端开发工程师，2014年的中山大学软件工程本科毕业生，2014年4月份开始第一份前端开发工作，至今已经有两年多前端开发经验。
              </p>
              <p>
                有着坚实的前端开发基础，并且一直保持对新技术的学习热情。熟练使用HTML5、CSS3以及JavaScript(jQuery,Zepto)；对流行的前端开发框架，比如Bootstrap3和Foundation5都有实际开发项目；能熟练使用前端开发工具，比如Gulp.js、Seajs、WebPack和Less等等；学习了AngularJS和React，但更加喜欢轻巧、高性能、可组件化的MVVM框架Vue.js，并在实际的开发项目中使用；学习了Node.js(Express)、ECMAScript6，MongoDB等技术，希望在往后的开发项目中得到实践提升。这里是 <a href="https://github.com/cody1991/learn">自己的前端开发记录</a> 。后面也有新的前端开发实习生加入团队，锻炼了一定的管理能力。
              </p>
              <p>
                乐于分享，长期活跃在GitHub上，有不少开源的项目。有 <a href="http://cody1991.github.io/index.html">个人的技术博客</a> ，使用Jekyll搭建，分享一些前端开发经验和工具。 在前端开发社区发布过教程，比如 <a href="https://segmentfault.com/a/1190000006776243">一个简单的 vue.js 实践教程</a> ，希望自己的学习经验能带给别人帮助。 英语过了六级，对英文书籍和网站的阅读无太多障碍，翻译了 <a href="https://leanpub.com/vuejs">《The Majesty Of Vue.js》</a> 一书。
              </p>
              <p>爱读书，爱听歌，爱游泳，爱跑步，爱爬山。代码不是生活的全部。</p>
            </div>
            <a href="http://cody1991.github.io/index.html" class="btnDownload">前往我的技术博客</a>
            <a href="https://github.com/cody1991" class="btnDownload">前往我的GitHub</a>
          </div>
        </div>
      </div>
    </section>
    <section class="technical" id="technical">
      <div class="container">
        <div class="heading">
          <h2 id="technical_title">技能</h2>
          <p>前端开发需要一个持续和长期的学习，需要在各种领域都有充足的知识储备，需要对新技术的学习保持热情。前端开发工程师技术栈中最重要的就是原生JavaScript，《JavaScript高级编程》和《Javascript权威指南》都通读了几遍，最近重新拜读《JavaScript语言精粹》一书。</p>
        </div>
        <div class="row">
          <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 skillsArea">
            <div class=" col-xs-12 skills">
              <span class="chart skilBg" data-percent="85">
                                <span class="percent"></span>
              </span>
              <h4>HTML5</h4>
            </div>
          </div>
          <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 skillsArea">
            <div class=" col-xs-12 skills">
              <span class="chart skilBg" data-percent="85">
                                <span class="percent"></span>
              </span>
              <h4>CSS3</h4>
            </div>
          </div>
          <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 skillsArea">
            <div class=" col-xs-12 skills">
              <span class="chart skilBg" data-percent="80">
                                <span class="percent"></span>
              </span>
              <h4>JavasSript</h4>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 skillsArea">
            <div class=" col-xs-12 skills">
              <span class="chart skilBg" data-percent="85">
                                <span class="percent"></span>
              </span>
              <h4>jQuery</h4>
            </div>
          </div>
          <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 skillsArea">
            <div class=" col-xs-12 skills">
              <span class="chart skilBg" data-percent="80">
                                <span class="percent"></span>
              </span>
              <h4>Foundation 5</h4>
            </div>
          </div>
          <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 skillsArea">
            <div class=" col-xs-12 skills">
              <span class="chart skilBg" data-percent="90">
                                <span class="percent"></span>
              </span>
              <h4>Bootstrap 3</h4>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 skillsArea">
            <div class=" col-xs-12 skills">
              <span class="chart skilBg" data-percent="85">
                                <span class="percent"></span>
              </span>
              <h4>Vue.js</h4>
            </div>
          </div>
          <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 skillsArea">
            <div class=" col-xs-12 skills">
              <span class="chart skilBg" data-percent="90">
                                <span class="percent"></span>
              </span>
              <h4>Less</h4>
            </div>
          </div>
          <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 skillsArea">
            <div class=" col-xs-12 skills">
              <span class="chart skilBg" data-percent="80">
                                <span class="percent"></span>
              </span>
              <h4>EJS</h4>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 skillsArea">
            <div class=" col-xs-12 skills">
              <span class="chart skilBg" data-percent="85">
                                <span class="percent"></span>
              </span>
              <h4>Seajs</h4>
            </div>
          </div>
          <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 skillsArea">
            <div class=" col-xs-12 skills">
              <span class="chart skilBg" data-percent="85">
                                <span class="percent"></span>
              </span>
              <h4>Gulp.js</h4>
            </div>
          </div>
          <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 skillsArea">
            <div class=" col-xs-12 skills">
              <span class="chart skilBg" data-percent="85">
                                <span class="percent"></span>
              </span>
              <h4>WebPack</h4>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 skillsArea">
            <div class=" col-xs-12 skills">
              <span class="chart skilBg" data-percent="75">
                                <span class="percent"></span>
              </span>
              <h4>Node.js</h4>
            </div>
          </div>
          <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 skillsArea">
            <div class=" col-xs-12 skills">
              <span class="chart skilBg" data-percent="80">
                                <span class="percent"></span>
              </span>
              <h4>Express</h4>
            </div>
          </div>
          <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 skillsArea">
            <div class=" col-xs-12 skills">
              <span class="chart skilBg" data-percent="90">
                                <span class="percent"></span>
              </span>
              <h4>GitHub</h4>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 skillsArea">
            <div class=" col-xs-12 skills">
              <span class="chart skilBg" data-percent="75">
                                <span class="percent"></span>
              </span>
              <h4>ECMAScript 6</h4>
            </div>
          </div>
          <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 skillsArea">
            <div class=" col-xs-12 skills">
              <span class="chart skilBg" data-percent="85">
                                <span class="percent"></span>
              </span>
              <h4>CET-6</h4>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="exprience" id="exprience">
      <div class="container">
        <div class="heading">
          <h2>经历</h2>
          <p>2014年6月，毕业于中山大学，2014年4月开始了自己的前端开发工程师生涯。第一家的时候自己还是一个职场新人，主要是在实际项目中不断学习，提升自己的前端开发技能和经验。第二家的时候自己作为公司唯一的一个前端开发工程师，负责公司所有前端开发任务，其后有个前端开发实习生加入团队，在一边认真有质量地完成公司任务以为，带领实习生一起进行学习。</p>
        </div>
        <div class="row workDetails">
          <div class="col-xs-12 col-sm-3 col-md-2 col-lg-2">
            <div class="workYear">
              <span class="prevY">03,2017</span>
              <span class="afterY">至今</span>
            </div>
          </div>
          <div class="col-xs-12 col-sm-9 col-md-10 col-lg-10 rightArea">
            <div class="arrowpart"></div>
            <div class="exCon">
              <h4>腾讯科技（深圳）有限公司</h4>
              <h5>前端开发工程师</h5>
              <p>待续...</p>
            </div>
          </div>
        </div>
        <div class="row workDetails">
          <div class="col-xs-12 col-sm-3 col-md-2 col-lg-2">
            <div class="workYear">
              <span class="prevY">10,2016</span>
              <span class="afterY">4,2015</span>
            </div>
          </div>
          <div class="col-xs-12 col-sm-9 col-md-10 col-lg-10 rightArea">
            <div class="arrowpart"></div>
            <div class="exCon">
              <h4>深圳市暖柚科技有限公司</h4>
              <h5>前端开发工程师</h5>
              <p>这段时间是自己前端开发技能得到不少提高的阶段。自己是公司的第一个前端，公司的官网、日常的运营页面、管理后台的页面优化、APP内的webview页面、手机端的活动页面、视频直播页面、游戏等等都是自己一个人来完成。工作非常饱和，但是在闲暇时候抽空学了很多新的框架和库，对AngularJS和React有了一定的了解，而选择了轻巧、高性能、可组件化的Vue.js作为主攻的MVVM框架，开始涉及WebPack，ECMAScript6，Node.js(Express)等的学习，熟练使用npm、Bower、Gulp.js等工具,并且在自己的一个GitHub项目 <a href="https://github.com/cody1991/learn">learn</a> 中可以看到我长期保持着对最新技术的学习热度。</p>
            </div>
          </div>
        </div>
        <div class="row workDetails">
          <div class="col-xs-12 col-sm-3 col-md-2 col-lg-2">
            <div class="workYear">
              <span class="prevY">12,2014</span>
              <span class="afterY">04,2014</span>
            </div>
          </div>
          <div class="col-xs-12 col-sm-9 col-md-10 col-lg-10 rightArea">
            <div class="arrowpart"></div>
            <div class="exCon">
              <h4>精准分众传媒有限公司</h4>
              <h5>移动前端开发工程师</h5>
              <p>日常工作围绕移动前端页面的制作，开发公司的后台页面，官网以及一些PC端的活动和页面。业余时间，积极学习和掌握了非常多的技术，比如Jekyll、Less、Bootstrap3,Foundation 5,Framework 7。开始泡在GitHub上学习开源框架和分享自己的学习经验，对原生JavaScript的理解和认知也提升了不少。</p>
            </div>
          </div>
        </div>
        <div class="row workDetails">
          <div class="col-xs-12 col-sm-3 col-md-2 col-lg-2">
            <div class="workYear">
              <span class="prevY">06,2014</span>
              <span class="afterY">09,2010</span>
            </div>
          </div>
          <div class="col-xs-12 col-sm-9 col-md-10 col-lg-10 rightArea">
            <div class="arrowpart"></div>
            <div class="exCon">
              <h4>中山大学</h4>
              <h5>软件工程本科生</h5>
              <p>在四年的大学生活中我主要学习了比如操作系统，计算机网络，C/C++编程语言，数据结构，编译原理和软件工程导论等等。而在2013年10月开始自学前端开发，在毕业前自学并熟悉掌握了HTML，CSS和jQuery，并且也打下了不错的原生JavaScript基础。</p>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="reffernces" id="reffernces">
      <div class="container">
        <div class="heading">
          <h2>项目</h2>
          <p>下面包括了自己的开源项目，公司项目，推荐的网站等。</p>
        </div>
        <div class="row waterfall" data-col-min-width="300">
          <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 refBox">
            <div class="refBoxcon">
              <p>
                因为想要自己前端开发学习中的所得所想以及碰到的有用的前端开发工具分享出来，就通过GitHub Pages和Jekyll从零开始搭建出了自己的个人博客，包含了Vue.js教程、Gulp.js教程、Sublime Text、GitHub Pages搭建等等博客。
              </p>
              <h3>
                            <a href="http://cody1991.github.io/">个人博客</a>
                            </h3>
            </div>
          </div>
          <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 refBox">
            <div class="refBoxcon">
              <p>
                一直保持着前端开发技术的学习和记录笔记，在这个项目中可以看到诸如Vue.js、Vue v2、Vuex、AngularJS、Node.js、Express、ECMAScript 6、HTML 5 Canvas、Flex 布局、PHP、WebPack和Gulp.js等等的学习记录。
              </p>
              <h3>
                            <a href="https://github.com/cody1991/learn">个人前端开发学习记录</a>
                            </h3>
            </div>
          </div>
          <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 refBox">
            <div class="refBoxcon">
              <p>
                公司前端开发团队的GitHub Organizations，里面存放着日常开发中的Vue.js、Express、WebPack、Gulp.js等等的脚手架，以及前端开发模板和一份完整的公司前端开发规范，避免重复造轮子。
              </p>
              <h3>
                            <a href="https://github.com/bear-front-end">bear-front-end</a>
                            </h3>
            </div>
          </div>
          <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 refBox">
            <div class="refBoxcon">
              <p>
                自己写的一套Gulp.js模板，使用Gulp.js这个自动化构造工具增强我们的前端开发流程。
              </p>
              <h3>
                            <a href="https://github.com/cody1991/gulp-template">gulp-template</a>
                            </h3>
            </div>
          </div>
          <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 refBox">
            <div class="refBoxcon">
              <p>
                负责随遇直播APP产品分享出来的直播页面，主要使用了MediaElement.js、Socket.IO、iScroll 5、Swiper和CSS3动画等技术。兼容PC和移动端，用户可以观看直播，实时获取房间访客列表、用户评论列表和主播信息，也可以进行评论和点赞，与主播互动，观看回播视频。可以进入 <a href="http://api.impingo.me/miniSite/liveEndPage?sessionID=7b37cc506c536eea00&sessionToken=e1a15017c5&liveID=94336&userID=1495955&peerID=9728B66C7B326B407E48A61AE53B70DC">结束页面</a> ，选择观看热门直播。
              </p>
              <h3>
                            <a href="http://api.impingo.me/miniSite/livePage?liveID=9311d5a9d">回播页面</a>
                            </h3>
            </div>
          </div>
          <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 refBox">
            <div class="refBoxcon">
              <p>
                公司官网PC版本和 <a href="http://www.impingo.me/homepage/m/index.html">移动版本</a> 的构建。使用Gulp.js、CSS3动画和百度地图等技术。
              </p>
              <h3>
                            <a href="http://www.impingo.me/homepage/index.html">公司官网PC版本</a>
                            </h3>
            </div>
          </div>
          <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 refBox">
            <div class="refBoxcon">
              <p>
                负责公司随遇直播APP产品内的H5页面，负责公司随遇APP产品H5端的迷你版本，负责公司运营活动页面，比如 <a href="http://a.impingo.me/static/nice/nice14/index.html">主播生活日记系列</a> 、 <a href="http://wx.impingo.me/static/iceChallenge/index.html?source_iceChallenge">七夕湿身游戏</a>、 <a href="http://a.impingo.me/static/activity/singer/preselection.html">我是直播歌手投票页面</a>、 以及PV过百万的 元气校花H5活动 等等。主要日常使用的技术、库和框架有：Vue.js、vue-resource、vue-router、FastClick、Swiper、Animate.css、jQuery.lazyload和Lightbox等等。
              </p>
              <h3>
                            <a href="http://a.impingo.me/activity/showRecommendH5?isFamous=1&openId=o4s3LjjIznRpPupFFoXwem4RD9Hs">元气校花示例页面1</a>
                            <a href="http://a.impingo.me/activity/showRecommend32?isFamous=1&openId=o4s3LjjIznRpPupFFoXwem4RD9Hs#107">示例2</a>
                            </h3>
            </div>
          </div>
          <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 refBox">
            <div class="refBoxcon">
              <p>
                使用WebGL(three.js框架)编写的3D网页项目。
              </p>
              <h3>
                            <a href="https://github.com/cody1991/webgltang">WebGL项目</a>
                            </h3>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="contact" id="contact">
      <div class="container topCon">
        <div class="heading">
          <h2>联系我</h2>
        </div>
      </div>
    </section>
    <section class="contactDetails">
      <div class="container">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
          <h4>联系方式</h4>
          <p> <i class="icon icon-envelope"></i><a>476490767@qq.com</a></p>
          <p> <i class="icon icon-link"></i><a href="http://cody1991.github.io/index.html">http://cody1991.github.io/</a>
          </p>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 comments">
          <h4>评论</h4>
          <div class="ds-thread" data-thread-key="aboutme" data-title="aboutme" data-url="http://cody1991.github.io/aboutme/"></div>
          <!-- 多说评论框 end -->
          <!-- 多说公共JS代码 start (一个网页只需插入一次) -->
          <script type="text/javascript">
          var duoshuoQuery = {
            short_name: "aboutme"
          };
          (function() {
            var ds = document.createElement('script');
            ds.type = 'text/javascript';
            ds.async = true;
            ds.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') + '//static.duoshuo.com/embed.js';
            ds.charset = 'UTF-8';
            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(ds);
          })();

          </script>
        </div>
      </div>
    </section>
    <section class="footer" id="footer">
      <div class="container">
        <ul>
          <li><a href="https://github.com/cody1991"><i class="icon icon-github icon-2x"></i></a>
          </li>
        </ul>
        <span class="totop"><i class="icon icon-chevron-up"></i>
                </span>
      </div>
    </section>
  </div>
  <script src="${cp }/js/jquery.min.js"></script>
  <script src="${cp }/js/resume/bootstrap.js"></script>
  <script src="${cp }/js/resume/jquery.waterfall.js"></script>
  <script src="${cp }/js/resume/stickUp.js"></script>
  <script type="text/javascript">
  jQuery(function($) {
    $(document).ready(function() {
      //enabling stickUp on the '.navbar-wrapper' class

      $('.navbar-wrapper').stickUp({
        parts: {
          0: 'wrapper',
          1: 'aboutme',
          2: 'technical',
          3: 'exprience',
          4: 'reffernces',
          5: 'contact'
        },
        itemClass: 'menuItem',
        itemHover: 'active',
        topMargin: 'auto'
      });
    });
  });

  </script>
  <script src="${cp }/js/resume/jquery.easing.min.js"></script>
  <script src="${cp }/js/resume/custom.js"></script>
  <script src="${cp }/js/resume/jquery.easypiechart.js"></script>
</body>

</html>

