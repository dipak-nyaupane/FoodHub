<%@ Page Title="" Language="C#" MasterPageFile="~/Frontend/Users/User.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="FoodHub.Frontend.Users.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- Carousel Start -->
    <div class="container-fluid p-0 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div id="header-carousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-100" src="../assests/img/carousel-1.jpg" alt="Image">
                    <div class="carousel-caption">
                        <div class="container">
                            <div class="row justify-content-start">
                                <div class="col-lg-7">
                                    <h1 >Organic Food Is Good For Health</h1>
                                    <a href="#" class="btn btn-primary rounded-pill py-sm-3 px-sm-5">Products</a>
                                    <a href="#" class="btn btn-secondary rounded-pill py-sm-3 px-sm-5 ms-3">Services</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="../assests/img/carousel-2.jpg" alt="Image">
                    <div class="carousel-caption">
                        <div class="container">
                            <div class="row justify-content-start">
                                <div class="col-lg-7">
                                    <h1>Natural Food Is Always Healthy</h1>
                                    <a href="Product.aspx" class="btn btn-primary rounded-pill py-sm-3 px-sm-5">Products</a>
                                    <a href="#" class="btn btn-secondary rounded-pill py-sm-3 px-sm-5 ms-3">Services</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#header-carousel"
                data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#header-carousel"
                data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
    <!-- Carousel End -->
     <!-- Feature Start -->
    <div class="container-fluid bg-light bg-icon py-6">
        <div class="container">
            <div class="section-header text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <h1 class="display-5 mb-3">Our Features</h1>
                <p></p>
            </div>
            <div class="row g-4">
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="bg-white text-center h-100 p-4 p-xl-5">
                        <img class="img-fluid mb-4" src="../img/icon-1.png" alt="">
                        <h4 class="mb-3">Online Ordering and Delivery</h4>
                        <p class="mb-4">The market is growing as the consumer popularity of online meal ordering grows. It’s a good idea to think about mobile app development to increase your return on investment. The market is brimming with possibilities, and now is the time to seize them.</p>
                        <a class="btn btn-outline-primary border-2 py-2 px-4 rounded-pill" href="#">Read More</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="bg-white text-center h-100 p-4 p-xl-5">
                        <img class="img-fluid mb-4" src="img/icon-2.png" alt="">
                        <h4 class="mb-3">On-Demand Food Ordering</h4>
                        <p class="mb-4">With the rapid growth of online meal ordering, it’s understandable to have many food delivery apps on your phone. </p>
                        <a class="btn btn-outline-primary border-2 py-2 px-4 rounded-pill" href="#">Read More</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="bg-white text-center h-100 p-4 p-xl-5">
                        <img class="img-fluid mb-4" src="../img/icon-3.png" alt="">
                        <h4 class="mb-3">Simple Payment Methods</h4>
                        <p class="mb-4">Payments play an essential part in any firm, according to the perspective of a business owner. Even though it is the final step in the order placement process, consumers will not try again if they have any minor or significant issues.</p>
                        <a class="btn btn-outline-primary border-2 py-2 px-4 rounded-pill" href="#">Read More</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Feature End -->

      <div class="container-xxl py-5">
           <div class="container">
            <div class="row g-0 gx-5 align-items-end">
                <div class="col-lg-6">
                    <div class="section-header text-start mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                        <h1 class="display-5 mb-3">Our Products</h1>
                        <p>Our Pride</p>
                    </div>
                </div>         <div class="col-lg-6 text-start text-lg-end wow slideInRight" data-wow-delay="0.1s">
                      
                        <asp:Repeater ID="rptCAtegory" runat="server">
                            <ItemTemplate>
                     <ul class="nav nav-pills d-inline-flex justify-content-end mb-5">  
                        <li class="nav-item me-2">               

                             <asp:HyperLink ID="HyperLink1" CssClass="btn btn-outline-primary border-2 " ToolTip='<%#Eval("CategoryName")%>' NavigateUrl='<%# Eval("Category_id","Product.aspx?cat={0}") %>' runat="server"> <%#DataBinder.Eval(Container.DataItem,"CategoryName") %> </asp:HyperLink>
                            </li>
                        </ul>
                                
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>


                    </div>
         
             <div class="tab-content">
                <div id="tab-1" class="tab-pane fade show p-0 active">
                    <div class="row g-4">
                      
    <asp:Repeater ID="ProductData" runat="server" >

            <ItemTemplate>
                          <div class="col-xl-3 col-lg-6 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="product-item">
                       
                             <div class="position-relative bg-light overflow-hidden">
                                   
                                     <asp:Image ID="Image1" runat="server" class="img-fluid w-100" width="22"  Height="150" data-toggle="tooltip" ImageUrl='<%#"../../Admin/assets/Images/ProductPhoto/" + Eval("product_image")%>' />
                                   
                               </div>

                                <div class="text-center p-4">
                                      <asp:Label ID="Label6" class="d-block h5 mb-2" runat="server" Text='<%#Eval("Product_id")%>' visible="False"></asp:Label>
                                      <asp:Label ID="Label1" class="d-block h5 mb-2" runat="server" Text='<%#Eval("product_name")%>'></asp:Label>
                                Rs <asp:Label ID="price" runat="server" Text='<%#Eval("product_price")%>'></asp:Label>

                           <asp:Label ID="CategoryId" runat="server" hidden="True" Text='<%#Eval("product_category_id")%>'></asp:Label>
                                </div>
                                <div class="text-center p-4">

                                           <div class="d-flex border-top">
                                    <small class="w-50 text-center border-end py-2"> 
                                        <asp:LinkButton ID="btnView" CssClass="text-body" CommandArgument='<%# Eval("Product_id") %>' onclick="ClickProductDetails" runat="server"><i class="fa fa-eye text-primary me-2"></i>View Details</asp:LinkButton>
                                              </small>
                                                  <small class="w-50 text-center py-2">
                                                           <asp:LinkButton ID="btnUpdateProduct" CssClass="text-body" OnClick="AddToCart_Click" CommandArgument='<%# Eval("Product_id") %>' runat="server"><i class="fa fa-shopping-bag text-primary me-2"></i>Add to cart</asp:LinkButton>
                                                      </small>
                                               </div>
                                         </div>
                                 </div>

                            </div>
                     </ItemTemplate>

             </asp:Repeater>
                          <div class="col-12 text-center">
                            <a class="btn btn-primary rounded-pill py-3 px-5" href="Product.aspx">Browse More Products</a>
                        </div>

                        </div>
                    </div>
                </div>          
            </div>
          </div>




</asp:Content>
