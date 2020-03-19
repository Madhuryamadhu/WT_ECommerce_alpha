<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">

#slider12a .slider-track-high, #slider12c .slider-track-high {
	background: #b0aeae !important;
}

#slider12b .slider-track-low, #slider12c .slider-track-low {
	background: #b0aeae !important;
}

#slider12c .slider-selection {
	background: #b0b435 !important;
}

.slider-handle{
  background-image: linear-gradient(to bottom,#000000 0,#70726e 100%);
}
.tooltip-main,.tooltip-min,.tooltip-max{
	opacity: 100 !important;
}

</style>
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
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <form role="form" method="post" id="reused_form">
                                <div class="form-group">
                                    <label for="name"> Category:</label>
                                   <select class="form-control">
                                        <option value="">Select</option>
                                        <option value="1">Seasonal Fruits</option>
                                        <option value="2">Dry Fruits</option>
                                         <option value="1">Seasonal Fruits</option>
                                        <option value="2">Dry Fruits</option>
                                   </select>
                                </div>
                                 <div class="form-group">
                                    <label for="name">Sub Category:</label>
                                   <select class="form-control">
                                        <option value="">Select</option>
                                        <option value="1">Seasonal Fruits</option>
                                        <option value="2">Dry Fruits</option>
                                         <option value="1">Seasonal Fruits</option>
                                        <option value="2">Dry Fruits</option>
                                   </select>
                                </div>
                                 <div class="form-group">
                                    <label for="name">Brand:</label>
                                   <select class="form-control">
                                        <option value="">Select</option>
                                        <option value="1">Seasonal Fruits</option>
                                        <option value="2">Dry Fruits</option>
                                         <option value="1">Seasonal Fruits</option>
                                        <option value="2">Dry Fruits</option>
                                   </select>
                                </div>
                                
                                <div class="form-group">
                            	   <label for="name">Price Range:</label><br/><br/>
	                               <input id="ex12c" type="text"/><br/>
						        </div>
                                <div class="button-group filter-button-group">
                           		      <button type="submit" class="btn btn-lg  btn-block" id="btnContactUs">Submit! &rarr;</button>
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
$(document).ready(function() {
	loadProducts();
	
	
	$("#ex12c").slider({ id: "slider12c",step: 1, min: 0, max: 1000, range: true, value: [10, 500] });
	//change tooltip format on initial load
	_changeTooltipFormat();
	
	//This is to add formatting for price range tooltip
	 $("#ex12c").on("slide slideStop", function(slideEvt) {
		  $('#slider12c').attr('value',$("#ex12c").data('slider').getValue());
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




//This is the function to load get the product information
function loadProducts() {
	var dataArray = {};
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
										'<a class="cart" href="#">Add to Cart</a>'+
									'</div>'+
								'</div>'+
								'<div class="why-text">'+
									'<h4>'+productInfoList[i][1]+'</h4>'+
									'<h5>'+productInfoList[i][2]+'</h5>'+
								'</div>'+
							'</div>'+
						'</div>';
		}
	
	   productHtml +='</div>';
	   $('#productList').append(productHtml);
}
</script>
</html>