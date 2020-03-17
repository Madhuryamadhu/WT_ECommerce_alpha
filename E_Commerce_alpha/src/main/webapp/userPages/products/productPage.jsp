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
                            <button class="active" data-filter="*">All</button>
                            <button data-filter=".top-featured">Top featured</button>
                            <button data-filter=".best-seller">Best seller</button>
							<button data-filter=".best-filter" data-toggle="modal" data-target="#myModal">Filter</button>
                        </div>
                    </div>
                </div>
            </div>
            
            	<div class="row special-list">
	                <div class="col-lg-3 col-md-6 special-grid best-seller">
	                    <div class="products-single fix">
	                        <div class="box-img-hover">
	                            <div class="type-lb">
	                                <p class="sale">Sale</p>
	                            </div>
	                            <img src="${pageContext.request.contextPath}/resources/images/img-pro-01.jpg" class="img-fluid" alt="Image">
	                            <div class="mask-icon">
	                                <ul>
	                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
	                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>
	                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
	                                </ul>
	                                <a class="cart" href="#">Add to Cart</a>
	                            </div>
	                        </div>
	                        <div class="why-text">
	                            <h4>Lorem ipsum dolor sit amet</h4>
	                            <h5> $7.79</h5>
	                        </div>
	                    </div>
	                </div>
	
	                <div class="col-lg-3 col-md-6 special-grid top-featured">
	                    <div class="products-single fix">
	                        <div class="box-img-hover">
	                            <div class="type-lb">
	                                <p class="new">New</p>
	                            </div>
	                            <img src="${pageContext.request.contextPath}/resources/images/img-pro-02.jpg" class="img-fluid" alt="Image">
	                            <div class="mask-icon">
	                                <ul>
	                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
	                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>
	                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
	                                </ul>
	                                <a class="cart" href="#">Add to Cart</a>
	                            </div>
	                        </div>
	                        <div class="why-text">
	                            <h4>Lorem ipsum dolor sit amet</h4>
	                            <h5> $9.79</h5>
	                        </div>
	                    </div>
	                </div>
	
	                <div class="col-lg-3 col-md-6 special-grid top-featured">
	                    <div class="products-single fix">
	                        <div class="box-img-hover">
	                            <div class="type-lb">
	                                <p class="sale">Sale</p>
	                            </div>
	                            <img src="${pageContext.request.contextPath}/resources/images/img-pro-03.jpg" class="img-fluid" alt="Image">
	                            <div class="mask-icon">
	                                <ul>
	                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
	                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>
	                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
	                                </ul>
	                                <a class="cart" href="#">Add to Cart</a>
	                            </div>
	                        </div>
	                        <div class="why-text">
	                            <h4>Lorem ipsum dolor sit amet</h4>
	                            <h5> $10.79</h5>
	                        </div>
	                    </div>
	                </div>
	
	                <div class="col-lg-3 col-md-6 special-grid best-seller">
	                    <div class="products-single fix">
	                        <div class="box-img-hover">
	                            <div class="type-lb">
	                                <p class="sale">Sale</p>
	                            </div>
	                            <img src="${pageContext.request.contextPath}/resources/images/img-pro-04.jpg" class="img-fluid" alt="Image">
	                            <div class="mask-icon">
	                                <ul>
	                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
	                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>
	                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
	                                </ul>
	                                <a class="cart" href="#">Add to Cart</a>
	                            </div>
	                        </div>
	                        <div class="why-text">
	                            <h4>Lorem ipsum dolor sit amet</h4>
	                            <h5> $15.79</h5>
	                        </div>
	                    </div>
	                </div>
	            </div>
            </div>

            
        </div>
</body>

<script type="text/javascript">
$(document).ready(function() {
	loadProducts();
});

function loadProducts() {
	
	
	var dataArray = {};
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "loadProducts",
		data : JSON.stringify(dataArray),
		timeout : 100000,
		success : function(data) {
				 buildProducts();
		},
		error : function(e) {
			console.log("ERROR: ", e);
		},
		done : function(e) {
			console.log("getTypeDetails DONE");
		}
	});

}


function buildProducts(productInfoMap){
	
}
</script>
</html>