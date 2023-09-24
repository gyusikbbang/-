<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Manager.ShopProductDataBean" %>
<%@ page import="Manager.ShopProductDBBean" %>
<%@ page import="Product.ProductDBBean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%!
    int pageSize = 8;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%
	String pageNum = request.getParameter("pageNum");

    if (pageNum == null) {
        pageNum = "1";
    }

    int currentPage =  Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize;
    int count = 0;
    int number = 0;

    List<ShopProductDataBean> productList = null; 
        
    ProductDBBean productProcess = ProductDBBean.getInstance();
    count = productProcess.discountSearchCount();
    
    if (count > 0) {
        productList = productProcess.discountSearchList(startRow, pageSize);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title></title>
    <meta name="keywords" content="shopping mall, jacket, men, women">
    <meta name="description" content="shop any where for women and men's ware">
    <meta name="robots" content="index, follow">

    <!-- open graph -->
    <meta property="og:title" content="Shopy shop any where" />
    <meta property="og:type" content="website" />
    <meta property="og:description" content="shop any where for women and men's ware" />
    <meta property="og:url" content="http://www.shopy.com" />
    <meta property="og:image" content="http://www.shopy.com/images/logo.png" />

    <!-- favicon -->
    <link rel="apple-touch-icon" sizes="57x57" href="images/favicon/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="images/favicon/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="images/favicon/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="images/favicon/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="images/favicon/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="images/favicon/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="images/favicon/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="images/favicon/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="images/favicon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192"  href="images/favicon/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="images/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="images/favicon/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon/favicon-16x16.png">
    <link rel="manifest" href="images/favicon/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="images/favicon/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">

    <!-- fontawesome -->
    <script src="js/all.min.js"></script>

    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script src="js/isotope.pkgd.min.js"></script>
    <script src="js/main.js"></script>

    <!-- bootstrap grid -->
    <link rel="stylesheet" href="css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="css/star-rating.min.css">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="css/main.css">
    <link href="../main/css/style.css" rel="stylesheet">
    <link href="../main/css/bottom.css" rel="stylesheet">
    <link href="../main/css/side.css" rel="stylesheet">
    <link href="./css/page.css" rel="stylesheet">
    <link href="../main/css/mic.css" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

 	<style>
		/*-- 얇은 형광펜 --*/
		.half_highlight {
		background: linear-gradient(to top, #ff5912 20%, transparent 40%);
		} 
    </style>
</head>
<body>
<jsp:include page="../main/top.jsp"/>
<img src="../imageFile/tag1.png" style="width: 100px; position: relative; top: 1485px;left: 105px; transform: rotate(15deg);">
<img src="../imageFile/380.png" style="width: 100px; position: relative;
top: 1083px;
left: 1373px;
transform: rotate(-30deg);">
<div class="banner">
    <img src="../imageFile/962489325.jpg" style="width: 100vw; height: 550px;">
</div>
    <div class="contents_section" style="background: #eee5e7;">
    <div class="mdPickBanner">
    	<h2>이벤트 특가</h2>
   	</div>
            <section class="mdProList">
                <!-- <h2 class="content_title"><span>Men's</span> Clothes</h2>
                <p class="content_desc">총 -- 개의 상품</p> -->
    <%
        if (count == 0) {
    %>
			    <div class="alert alert-danger" role="alert">
			        등록된 상품이 없습니다.
			    </div>   
		     
    <% }else {%>
				<ul class="mdProduct">
    <%  
    for (int i = 0; i <productList.size(); i++) {
        ShopProductDataBean product = (ShopProductDataBean)productList.get(i);
        int discountAmount = product.getPrice() - Math.round(((product.getPrice() * product.getDiscount_rate()) / 100));
    %>
                
                    <li class="detail">
                        <a href="../proInfo/proInfo.jsp?proCode=<%=product.getProCode()%>"><img src="/BomBom/imageFile/<%=product.getProImg1()%>"></a>       
                        <div class="text">
	                       	<div id="label"><%=product.getProLabel()%></div>
	                        <div id="name" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"><a href="../proInfo/proInfo.jsp?proCode=<%=product.getProCode()%>"><%=product.getProName()%></a></div>
	                        <div id="price"><span style="color:red;"><%=product.getDiscount_rate()%>%</span>&nbsp;<%=discountAmount%>원&nbsp;<br><span style="text-decoration: line-through;"><%=product.getPrice()%>원</span></div>
                        </div>
                    </li>
                
            <% } %>
    			</ul>	
    		<%}%>	
            </section>
    </div>
<%
if (count > 0) {
%>
<div class="pagination">
    <ul class="page">
<%
    int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
    int startPage = 1;
    int pageBlock = 5;

    if(currentPage % pageBlock != 0)
        startPage = (int)(currentPage/pageBlock)*pageBlock + 1;
    else
        startPage = ((int)(currentPage/pageBlock)-1)*pageBlock + 1;

    int endPage = startPage + pageBlock - 1;
    if (endPage > pageCount) endPage = pageCount;
%>
	<%
	if (startPage < pageBlock) {
	%>
	<a class="page-link-disable" href="#" onclick="fnProdSearch(<%=startPage%>);" aria-label="Previous">
	<span aria-hidden="true">&laquo;</span>
	</a>
	
	<%
	}else {
	    %>
	    <a class="page-link" href="#" onclick="fnProdSearch(<%= startPage - pageBlock %>);" aria-label="Previous">
	    <span aria-hidden="true">&laquo;</span>
	    </a>
	<% } %>

	<% 
	for (int i = startPage; i <= endPage; i++) { %>
	<a class="page-link" href="#" onclick="fnProdSearch(<%= i %>);"><%= i %></a>
	<%  } %>
	
	<%
	if (endPage >= pageCount){
	%>
	<a class="page-link-disable" href="#" onclick="fnProdSearch(<%= endPage %>);" aria-label="Next">
	    <span aria-hidden="true">&raquo;</span>
	    </a>
	
	<% }else{ %>
	<a class="page-link" href="#" onclick="fnProdSearch(<%= startPage + pageBlock %>);" aria-label="Next">
	    <span aria-hidden="true">&raquo;</span>
	    </a>
	
	<% } %>
    </ul>
    </div>
<%}%>

<jsp:include page="../main/bottom.jsp"/>
<script>
    document.querySelector('.btn1').addEventListener('click', function(){
    document.querySelector('.image_container').style.transform = 'translate(0)'; 
    })

    document.querySelector('.btn2').addEventListener('click', function(){
        document.querySelector('.image_container').style.transform = 'translate(-100vw)';  
    })

    document.querySelector('.btn3').addEventListener('click', function(){
        document.querySelector('.image_container').style.transform = 'translate(-200vw)';  
    })

    var i = 1;

    document.querySelector('.next').addEventListener('click', function(){
        if (i == 1) {
            document.querySelector('.image_container').style.transform = 'translate(-100vw)';
            i += 1;
        } 
        else if (i == 2){
            document.querySelector('.image_container').style.transform = 'translate(-200vw)'; 
            i += 1;
        }
    })

document.querySelector('.prev').addEventListener('click', function(){
    if (i == 2) {
        document.querySelector('.image_container').style.transform = 'translate(0)';
        i -= 1;
    } 
    else if (i == 3){
        document.querySelector('.image_container').style.transform = 'translate(-100vw)'; 
        i -= 1;
    }
})
var value_list;
    
	$(".checkbox-box .checkbox-btn").click(function() {
	  	if(!$(this).is(":checked")){
	  		$("#labelAll-chk").prop("checked", false);
	  	}
	  	
	    value_list = []
        // input 태그 중 name 값이 'test_checkbox'인 것중 상태가 checked인 것들에게 각각 value값을 가져와서 value_list 리스트에 push하여 화면에 alert으로 보여준다.
	    $("input[name='labelChk']:checked").each(function(){
	        var checked_value = $(this).val();
	        value_list.push(checked_value)
	    });
	    alert(value_list);	  	
	});

    
    
    
    
    /* var chkList = $("input[name=labelChk]");

    $("#labelAll-chk").click(function(){
       if($(this).is(":checked")){
          chkList.prop("checked", true);
       }else
          chkList.prop("checked", false);
    }); */
    
    
</script>
</body>
<link rel="stylesheet" href="../main/js/mic.js">
</html>