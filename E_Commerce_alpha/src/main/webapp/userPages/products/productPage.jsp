<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
	<!-- Start Products  -->
    <div class="products-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="title-all text-center">
                        <h1>Fruits & Vegetables</h1>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet lacus enim.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="special-menu text-center">
                        <div class="button-group filter-button-group">
							<button data-filter=".best-filter" data-toggle="modal" data-target="#myModal">Filter</button>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- product details div -->
            <div id="productList"></div>
            
            
           
         </div>

            
            
            <!-- Modal -->
            <div id="myModal" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                        	<h4 style="font-size: 22px; font-weight: bold;">Filter Products</h4>
                            <button type="button" id="filterClose" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <form role="form" method="post" id="reused_form">
                                <div class="form-group">
                                    <label for="name"> Category:</label>
                                   <select class="form-control" id="filterCategory">
                                        <option value="">Select</option>
                                        <option value="1">Seasonal Fruits</option>
                                        <option value="2">Dry Fruits</option>
                                         <option value="1">Seasonal Fruits</option>
                                        <option value="2">Dry Fruits</option>
                                   </select>
                                </div>
                                 <div class="form-group">
                                    <label for="name">Sub Category:</label>
                                   <select class="form-control" id="filterSubCategory">
                                        <option value="">Select</option>
                                        <option value="1">Seasonal Fruits</option>
                                        <option value="2">Dry Fruits</option>
                                         <option value="1">Seasonal Fruits</option>
                                        <option value="2">Dry Fruits</option>
                                   </select>
                                </div>
                                 <div class="form-group">
                                    <label for="name">Brand:</label>
                                   <select class="form-control" id="filterBrand">
                                        <option value="">Select</option>
                                        <option value="1">Seasonal Fruits</option>
                                        <option value="2">Dry Fruits</option>
                                         <option value="1">Seasonal Fruits</option>
                                        <option value="2">Dry Fruits</option>
                                   </select>
                                </div>
                                
                                <div class="form-group">
                            	   <label for="name">Price Range:</label><br/><br/>
	                               <input id="filterPriceRange" type="text"/><br/>
						        </div>
                                <div class="button-group filter-button-group">
                           		      <button type="button" class="btn btn-lg  btn-block" id="btnContactUs" onclick="loadFilterMap()">Submit! &rarr;</button>
                                </div>
                               
                            </form>
                            <div id="success_message" style="width:100%; height:100%; display:none; "> <h3>Sent your message successfully!</h3> </div>
                            <div id="error_message" style="width:100%; height:100%; display:none; "> <h3>Error</h3> Sorry there was an error sending your form. </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
</body>

<script type="text/javascript">

var sliderTooltip;
var productPageLimit;
var productPageOffset;
var pageDraw;
var selectedProduct= new Object();

$(document).ready(function() {
	productPageLimit="8";
	productPageOffset="0";
	pageDraw="1";
	
	loadProducts();
	
	if($('#cart_list li').length==1){
		$("#NoProd").show();
		$(".total").hide();
	}
	
	$("#filterPriceRange").slider({ id: "slider12c",step: 1, min: 0, max: 1000, range: true, value: [10, 500] });
	//change tooltip format on initial load
	_changeTooltipFormat();
	
	//This is to add formatting for price range tooltip on slide 
	 $("#filterPriceRange").on("slide slideStop", function(slideEvt) {
		  $('#slider12c').attr('value',$("#filterPriceRange").data('slider').getValue());
		   //change tooltip value format 
		   _changeTooltipFormat();  
	}); 
	
	
});




//function to change the tooltip value to required format
function _changeTooltipFormat(){
	//debugger;
	var text=$(".tooltip-inner").html();
	$(".tooltip-inner").html('');
	var arr=text.split(':');
	if(arr.length>1){
		var finalOP='Rs.'+arr[0]+' to Rs.'+arr[1];
		$(".tooltip-inner").html(finalOP);
	}else{
		var arr2=text.split('to');
		var firstV=arr2[0].match(/\d/g).join("");
		var secondV=arr2[1].match(/\d/g).join("");
		var finalOP='Rs.'+firstV+' to Rs.'+secondV;
		$(".tooltip-inner").html(finalOP);
	}
}

var totalPrice=0
function addToCart(productId,productName, productPrice, prodImageName){
	var productQuantity=$('#quantityText_'+productId).val();
	if ($("#productId_"+productId).length==0){
		var cartHtml='<li id="productId_'+productId+'">'+
	    '<a href="#" class="photo"><img src="${pageContext.request.contextPath}/resources/images/productImages/'+prodImageName+'.jpg" class="cart-thumb" alt="" /></a>'+
	    '<h6><a href="#">'+productName+'</a></h6>'+
	    '<p><span id="qty_'+productId+'">'+productQuantity+'</span> x <span class="price">'+productPrice+'</span></p>'+
		'</li>';
		 totalPrice=totalPrice+(productPrice*productQuantity);
		$('#cart_list li:last-child').before(cartHtml);
		selectedProduct[productId+""]=productQuantity+"";
	}else{
		totalPrice=totalPrice+(productPrice*productQuantity);
		productQuantity=parseInt($('#qty_'+productId).text())+parseInt($('#quantityText_'+productId).val());
		$("#qty_"+productId).html(productQuantity);
		selectedProduct[productId+""]=productQuantity+"";
	}
	
	$('#totalPrice').html(totalPrice);
	let length = $('#cart_list li').length-1; 
	$('#noOfProdAddedToCart').html(length);
	
	if(length==1){
		$("#NoProd").hide();
		$(".total").show();
	}
	
}



//This is the function to build product html
function buildProducts(productInfoList){
	
	var productHtml='<div class="row special-list">';
	for(var i=0;i<productInfoList.length;i++){		
		productHtml += '<div class="col-lg-3 col-md-6 special-grid best-seller">'+
							'<div class="products-single fix">'+
								'<div class="box-img-hover">'+
									'<div class="type-lb">'+
										'<p class="sale">Sale</p>'+
									'</div>'+
									'<img src="${pageContext.request.contextPath}/resources/images/productImages/'+productInfoList[i][3]+'.jpg" class="img-fluid" alt="Image">'+
									'<div class="mask-icon">'+
										'<ul>'+
											'<li><a href="#" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>'+
											'<li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>'+
											'<li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>'+
										'</ul>'+
										'<a class="cart" href="#" onclick="addToCart('+productInfoList[i][0]+',\''+productInfoList[i][1]+'\','+productInfoList[i][2]+', \''+productInfoList[i][3]+'\')">Add to Cart</a>'+
										'<div id="quntity">'+
											'<label id="qty">Qty:</label>'+
										    '<input type="number" class="quantityText" id="quantityText_'+productInfoList[i][0]+'" value="1" min="1" max="20"/>'+
										'</div>'+
									'</div>'+
								'</div>'+
								'<div class="why-text">'+
									'<h4>'+productInfoList[i][1]+'</h4>'+
									'<h5>'+productInfoList[i][2]+'</h5>'+
								'</div>'+
							'</div>'+
						'</div>';
		}
	    productHtml +=' <div class="col-lg-12 col-md-12" id="showMoreButton_'+pageDraw+'"><button class="showMoreBtn" onclick="showMoreProduct('+pageDraw+')"><i class="fa fa-chevron-circle-down"></i> Show More</button></div>';
	    productHtml +='</div>';
	   $('#productList').append(productHtml);
}


//This is the function to load get the product information
function loadProducts() {
	var dataArray = {};
	
	dataArray["offset"]= productPageOffset;
	dataArray["limit"]= productPageLimit;
	
	for (var key in filterMap) {
	    if (filterMap.hasOwnProperty(key)) {           
	        if(key=='category'){
	        	dataArray["productCategory"]= filterMap[key];
	        }else  if(key=='subCategory'){
	        	dataArray["productSubCategory"]= filterMap[key];
	        }else  if(key=='brand'){
	        	dataArray["productBrand"]= filterMap[key];
	        }else  if(key=='priceRange'){
	        	dataArray["priceRange"]= filterMap[key];
	        }
	    }
	}
	
	//Clearing filter map
	filterMap={};
	
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "loadProducts",
		data : JSON.stringify(dataArray),
		timeout : 100000,
		success : function(data) {
				 buildProducts(data.productList);
		},
		error : function(e) {
			console.log("ERROR: ", e);
		},
		done : function(e) {
			console.log("getTypeDetails DONE");
		}
	});

}


function loadFilterMap(){
	if(isValid($("#filterCategory").val())){
		filterMap["category"]=$("#filterCategory").val();
	}
	if(isValid($("#filterSubCategory").val())){
		filterMap["subCategory"]=$("#filterSubCategory").val();
	}
	if(isValid($("#filterBrand").val())){
		filterMap["brand"]=$("#filterBrand").val();
	}
	if(isValid($("#filterPriceRange").val())){
		filterMap["priceRange"]=$("#filterPriceRange").val();
	}
	
	loadProducts();
	
	$('#filterClose').click();
}

function showMoreProduct(draw){
	
	$('#showMoreButton_'+draw).addClass('hide');
	
	productPageLimit="8";
	productPageOffset=((parseInt(productPageLimit)*parseInt(draw))-1)+"";
	
	loadProducts();
	
	pageDraw=(parseInt(draw)+1)+"";
}

function loadCartDetailsPage(){
	var parameters = new Object();
	parameters["cartQtyMap"]=selectedProduct;
	
	var pagePath="/userPages/cartDetails/cartDetails.jsp";
	var appendId="contentDivMain";
	
	loadNewPage(pagePath,parameters,appendId);
	
	$('#closeCart').click();
}

</script>
</html>
