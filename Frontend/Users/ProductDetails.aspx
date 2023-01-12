<%@ Page Title="" Language="C#" MasterPageFile="~/Frontend/Users/User.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="FoodHub.Frontend.Users.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid page-header mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container">
            <h1 class="display-3 mb-3 animated slideInDown">Product Details</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a class="text-body" href="#">Home</a></li>
                    <li class="breadcrumb-item text-dark active" aria-current="page">Product Details</li>
                </ol>
            </nav>
        </div>
    </div>
  <!-- About Start -->

      
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-5 align-items-center">
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">

                    <div class="about-img position-relative overflow-hidden p-5 pe-0">
                        <asp:Label ID="lblEditPhoto" runat="server" ></asp:Label>
                    <asp:Image ID="Image" runat="server" CssClass="img-fluid w-100"   /> 
                     
                    </div>
               </div>
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
                    <h1 class="display-5 mb-4">Product Name: <asp:Label ID="Product_Name" runat="server" Text="Label"></asp:Label></h1>
               
                       
                    <p><i class="fa fa-check text-primary me-3"></i>Product Id: <asp:Label ID="editProductId" runat="server" Text="Label"></asp:Label></p>
                    <p><i class="fa fa-check text-primary me-3"></i>Product Description: <asp:Label ID="Product_description" runat="server" Text="Label"></asp:Label></p>
                    <p><i class="fa fa-check text-primary me-3"></i>Product Price: <asp:Label ID="Product_price" runat="server" Text="Label"></asp:Label></p>
                      <p><i class="fa fa-check text-primary me-3"></i>Category: <asp:Label ID="Product_category_id" runat="server" Text="Label"></asp:Label></p>
                    <asp:Label ID="Product_category_id1" runat="server" Hidden="True" ></asp:Label>
                    <asp:LinkButton ID="productId1" CssClass="btn btn-primary rounded-pill py-3 px-5 mt-3" OnClick="AddToCart_Click"  runat="server">Add To Cart</asp:LinkButton>

                </div>
         
                    
            </div>
        </div>
    </div>
                 
</asp:Content>
