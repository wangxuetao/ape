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
  <title>电子简历-大猿软件程序员</title>
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
          <h1>${resume.user.realName }</h1>
          <p>${resume.userInfo.oneWord }</p>
          <a href="#aboutme" class="mbnt">关于我</a>
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
                        <a href="#aboutme">我</a>
                      </li>
                      <li class="menuItem">
                        <a href="#technical">技能</a>
                      </li>
                      <li class="menuItem">
                        <a href="#exprience">经历</a>
                      </li>
                      <li class="menuItem">
                        <a href="#contact">沟通</a>
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
              <h2>我</h2>
            </div>
            <div id="description">
				${resume.userInfo.aboutMe }
            </div>
            <a href="${resume.user.blogUrl }" class="btnDownload">前往我的技术博客</a>
            <a href="${resume.user.codeUrl }" class="btnDownload">前往我的代码库</a>
          </div>
        </div>
      </div>
    </section>
    <section class="technical" id="technical">
      <div class="container">
      
        <div class="heading">
          <h2 id="technical_title">技能</h2>
          <p>${resume.userInfo.skillDesc }</p>
        </div>
        <!-- 技能图谱 begin -->
        <!-- 技能图谱 end -->
        
      </div>
    </section>
    <section class="exprience" id="exprience">
      <div class="container">
        <div class="heading">
          <h2>经历</h2>
          <!-- 经历描述 begin -->
          <p></p>
          <!-- 经历描述 end -->
        </div>
        
        <c:forEach items="${resume.companys}" var="company">
	        <div class="row workDetails">
	          <div class="col-xs-12 col-sm-3 col-md-2 col-lg-2">
	            <div class="workYear">
	              <span class="prevY">${company.startTime }</span>
	              <span class="afterY">${company.endTime }</span>
	            </div>
	          </div>
	          <div class="col-xs-12 col-sm-9 col-md-10 col-lg-10 rightArea">
	            <div class="arrowpart"></div>
	            <div class="exCon">
	              <h4>${company.companyName }</h4>
	              <h5>${company.position }</h5>
	              <p>${company.postDesc }</p>
	            </div>
	          </div>
	        </div>
        </c:forEach>
        
        <div class="row workDetails">
          <div class="col-xs-12 col-sm-3 col-md-2 col-lg-2">
            <div class="workYear">
              <span class="prevY"></span>
              <span class="afterY">${resume.user.graduTime }</span>
            </div>
          </div>
          <div class="col-xs-12 col-sm-9 col-md-10 col-lg-10 rightArea">
            <div class="arrowpart"></div>
            <div class="exCon">
              <h4>${resume.user.schoolName }</h4>
              <h5>${resume.user.major}&nbsp;&nbsp;${ resume.user.degreeValue}</h5>
              <p></p>
            </div>
          </div>
        </div>
        
      </div>
    </section>
    
    <!-- 项目经验 begin -->
    <section class="reffernces" id="reffernces">
    </section>
    <!-- 项目经验 end -->
    
    <section class="contact" id="contact">
      <div class="container topCon">
        <div class="heading">
          <h2>沟通</h2>
        </div>
      </div>
   
    </section>
    <section class="contactDetails">
      <div class="container">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
          <p>联系方式暂且保密</p>
        </div>
        
        <!-- 评论 begin -->
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 comments">
          
        </div>
        <!-- 评论 end -->
        
      </div>
    </section>
    <section class="footer" id="footer">
      <div class="container">
        <ul>
          <li><a href="${resume.user.codeUrl }"><i class="icon icon-github icon-2x"></i></a>
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
  <script src="${cp }/js/resume/jquery.superslides.js"></script>
  <script src="${cp }/js/resume/jquery.easing.min.js"></script>
  <script src="${cp }/js/resume/custom.js"></script>
  <script src="${cp }/js/resume/jquery.easypiechart.js"></script>
</body>

</html>

