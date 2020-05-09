<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
   <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Cart</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Shop</a></li>
                        <li class="breadcrumb-item active">Cart</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <!-- Start Cart  -->
    <div class="cart-box-main">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="table-main table-responsive">
                        <table class="table" id="productCartTable">
                            <thead>
                                <tr>
                                    <th>Images</th>
                                    <th>Product Name</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th>Remove</th>
                                </tr>
                            </thead>
                            <tbody id="cartTableBody"></tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="row my-5">
                <div class="col-lg-6 col-sm-6">
                    <div class="coupon-box">
                        <div class="input-group input-group-sm">
                            <input class="form-control" placeholder="Enter your coupon code" aria-label="Coupon code" type="text">
                            <div class="input-group-append">
                                <button class="btn btn-theme" type="button">Apply Coupon</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-sm-6">
                    <div class="update-box">
                        <input value="Update Cart" type="submit">
                    </div>
                </div>
            </div>

            <div class="row my-5">
                <div class="col-lg-8 col-sm-12"></div>
                <div class="col-lg-4 col-sm-12">
                    <div class="order-box">
                        <h3>Order summary</h3>
                        <div class="d-flex">
                            <h4>Sub Total</h4>
                            <div class="ml-auto font-weight-bold" id="cartSummary_totalProductAmount">-</div>
                        </div>
                        <div class="d-flex">
                            <h4>Discount</h4>
                            <div class="ml-auto font-weight-bold" id="cartSummary_totalDiscount">-</div>
                        </div>
                        <hr class="my-1">
                        <div class="d-flex">
                            <h4>Coupon Discount</h4>
                            <div class="ml-auto font-weight-bold" id="cartSummary_totalCoupanDiscount">-</div>
                        </div>
                        <div class="d-flex">
                            <h4>Tax</h4>
                            <div class="ml-auto font-weight-bold" id="cartSummary_totalTax">-</div>
                        </div>
                        <div class="d-flex">
                            <h4>Shipping Cost</h4>
                            <div class="ml-auto font-weight-bold" id="cartSummary_totalShippingCost">-</div>
                        </div>
                        <hr>
                        <div class="d-flex gr-total">
                            <h5>Grand Total</h5>
                            <div class="ml-auto h5" id="cartSummary_totalAmount">-</div>
                        </div>
                        <hr> </div>
                </div>
                <div class="col-12 d-flex shopping-box"><a href="#" onclick="loadCheckOutPage()" class="ml-auto btn hvr-hover">Checkout</a> </div>
            </div>

        </div>
    </div>
    <!-- End Cart -->
</body>

<script type="text/javascript">

var cartQtyMap={};
var productIdList=[];
$(document).ready(function() {
	cartQtyString='${parameters.cartQtyMap}';
	cartQtyMap=formObjMap(cartQtyString);
	for (var key in cartQtyMap) {
	    if (cartQtyMap.hasOwnProperty(key)) {
	        productIdList.push(key);
	    }
	}
	
	setTimeout(function(){ loadProductsForCart(); }, 30);
	
});



//This is the function to load get the product information
function loadProductsForCart() {
	var dataArray = {};
	dataArray["productIdList"]= productIdList;
	dataArray["offset"]= "0";
	dataArray["limit"]= "20";
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "loadProducts",
		data : JSON.stringify(dataArray),
		timeout : 100000,
		success : function(data) {
				 buildCartDetails(data.productList);
		},
		error : function(e) {
			console.log("ERROR: ", e);
		},
		done : function(e) {
			console.log("getTypeDetails DONE");
		}
	});

}


function buildCartDetails(productInfoList){
	var cartHtml="";
	for(var i=0;i<productInfoList.length;i++){	
		cartHtml+='<tr>'+
				       '<td class="thumbnail-img">'+
			       			 '<a href="#">'+
								'<img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/productImages/'+productInfoList[i][3]+'.jpg" alt="" />'+
							 '</a>'+
			   			'</td>'+
			   			'<td class="name-pr">'+
			       			'<a href="#">'+productInfoList[i][1]+'</a>'+
			 		   '</td>'+
			  		   '<td class="price-pr">'+
			     		   '<p  id="quantity_amount_'+productInfoList[i][0]+'">'+productInfoList[i][2]+'</p>'+
			   		   '</td>'+
			   		   '<td class="quantity-box"><input type="number" id="quantity_total_'+productInfoList[i][0]+'" size="4" id min="0" step="1" onchange="calculateCartDetails('+productInfoList[i][0]+')" class="c-input-text qty text"></td>'+
			   		   '<td class="total-pr">'+
			      		  '<p class="cartTablePrice" id="quantity_totalAmount_'+productInfoList[i][0]+'"></p>'+
			    	   '</td>'+
			   		   '<td class="remove-pr">'+
			       		 '<a href="#">'+
							'<i class="fas fa-times"></i>'+
						 '</a>'+
			  		   '</td>'+
				'</tr>';
		$('#cartTableBody').append(cartHtml);
		calculateCartDetails(productInfoList[i][0],cartQtyMap[productInfoList[i][0]]);
		cartHtml="";
	}
}


function calculateCartDetails(prodId,prodQty){
	var prodQtyTemp="";
	if(isValid(prodQty)){
		prodQtyTemp=prodQty;
	}else{
		prodQtyTemp=$('#quantity_total_'+prodId).val();
	}
	
	var productAmount=$('#quantity_amount_'+prodId).text();
	
	
	var prodTotalAmount=(parseFloat(productAmount))*(parseInt(prodQtyTemp));
	$('#quantity_totalAmount_'+prodId).text(prodTotalAmount);
	$('#quantity_total_'+prodId).val(prodQtyTemp);
	selectedProduct[prodId+""]=$('#quantity_total_'+prodId).val();
	calculateCartSummary();
}

function calculateCartSummary(){
	var str=0.0;
	$('.cartTablePrice').each(function(){
		  str += parseFloat($(this).text());
	})

	var totalProd=str;
	var totalDiscount=0.0;
	var totalCoupanDiscount=0.0;
	var totalTax=0.0;
	var totalShippingCost=0.0;
	
	var grandTotal=parseFloat(totalProd)-(parseFloat(totalDiscount)+parseFloat(totalCoupanDiscount))+(parseFloat(totalTax)+parseFloat(totalShippingCost));

	$('#cartSummary_totalProductAmount').text(totalProd);
	$('#cartSummary_totalDiscount').text(totalDiscount);
	$('#cartSummary_totalCoupanDiscount').text(totalCoupanDiscount);
	$('#cartSummary_totalTax').text(totalTax);
	$('#cartSummary_totalShippingCost').text(totalShippingCost);
	$('#cartSummary_totalAmount').text(grandTotal);
}

function loadCheckOutPage(){
	var parameters = new Object();
	parameters["cartQtyMap"]=selectedProduct;
	
	var pagePath="/userPages/checkout/checkout.jsp";
	var appendId="contentDivMain";
	
	loadNewPage(pagePath,parameters,appendId);
	
	$('#closeCart').click();
}


</script>
</html>
