<%@ Page Title="" Language="C#" MasterPageFile="~/Frontend/Users/User.Master" AutoEventWireup="true" CodeBehind="CartPage.aspx.cs" Inherits="FoodHub.Frontend.Users.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        

    </style>
<!------ Include the above in your HEAD tag ---------->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid page-header mb-5 wow fadeIn" data-wow-delay="0.1s">
     <div class="container">
            <h1 class="display-3 mb-3 animated slideInDown">Cart </h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a class="text-body" href="#">Home</a></li>
               
                    <li class="breadcrumb-item text-dark active" aria-current="page">Cart Details</li>
                </ol>
            </nav>
        </div>
    </div>
    
 <section class="h-100 gradient-custom">
     
  <div class="container py-5">
    <div class="row d-flex justify-content-center my-4">

        
      <div class="col-md-8">
        <div class="card mb-4">
             
          <div class="card-header py-3">
            <h5 class="mb-0">Cart</h5>
          </div>
            <asp:Repeater ID="ProductData" runat="server" >

            <ItemTemplate>
          <div class="card-body">
            <!-- Single item -->
            <div class="row">
              <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
                <!-- Image -->
                <div class="bg-image hover-overlay hover-zoom ripple rounded" data-mdb-ripple-color="light">
                 <asp:Image ID="Image1" runat="server" class="img-fluid w-100" width="22" data-toggle="tooltip" ImageUrl='<%#"../../Admin/assets/Images/ProductPhoto/" + Eval("product_image")%>' />
                  <a href="#!">
                    <div class="mask" style="background-color: rgba(251, 251, 251, 0.2)"></div>
                  </a>
                </div>
                <!-- Image -->
              </div>

              <div class="col-lg-5 col-md-6 mb-4 mb-lg-0">
                <!-- Data -->
                <p>Product Name<strong><asp:Label ID="Label6" class="d-block h5 mb-2" runat="server" Text='<%#Eval("product_name")%>' ></asp:Label></strong></p>
                <p>Product Description
                 <asp:Label ID="Label1" class="d-block h5 mb-2" runat="server" Text='<%#Eval("product_description")%>' ></asp:Label> </p>
                
                 <p> Cost Per Unit: 
                  <strong><asp:Label ID="Label2" class="d-block h5 mb-2" runat="server" Text='<%#Eval("product_price")%>' >RS</asp:Label></strong></p>
                
                     <p> Total Cost: 
                  <strong><asp:Label ID="Label3" class="d-block h5 mb-2" runat="server" Text='<%#Eval("totalCost")%>' >RS</asp:Label></strong></p>
                
         
                  <asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary mb-2" OnClick="UpdateQty_Click" CommandArgument='<%# Eval("Product_id") %>'  runat="server">Update Quantity  </i></asp:LinkButton>

                  <asp:LinkButton ID="LinkButton2" CssClass="btn btn-danger  mb-2" OnClick="DeleteCat_Click" CommandArgument='<%# Eval("Product_id") %>'  runat="server"><i class="fa fa-minus"></i>&nbsp;Remove</asp:LinkButton>
         
                       
                <!-- Data -->
              </div>

              <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                <!-- Quantity -->
                <div class="d-flex mb-4" style="max-width: 300px">
                
                  <div class="form-outline">
                      <label class="form-label">Quantity</label>
                      <asp:TextBox ID="intQty" Type="number"  min="0" class="form-control" Text='<%#Eval("Quantity")%>' runat="server"></asp:TextBox>
                 </div>
                   

                </div>
              
                  
              </div>
                <hr class="my-4" />
            </div>
             
          </div>
                </ItemTemplate>
          </asp:Repeater>
        </div>
      </div>
         
      <div class="col-md-4">
        <div class="card mb-4">
          <div class="card-header py-3">
            <h5 class="mb-0">Summary</h5>
          </div>

            
               
          <div class="card-body">
                <asp:Repeater ID="ProductTotalData" runat="server" >

            <ItemTemplate>
            <ul class="list-group list-group-flush">
                
              <li
                class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
                Total Products
                <span><asp:Label ID="TotalItems" class="d-block h5 mb-2" runat="server" Text='<%#Eval("total_items")%>' ></asp:Label>
                   
                </span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                Shipping
                <span>Free</span>
              </li>
              <li
                class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                <div>
                  <strong>Total amount</strong>
                  <strong>
                    <p class="mb-0">(including VAT)</p>
                  </strong>
                </div>
            <strong>RS<asp:Label ID="TotalAmount" class="d-block h5 mb-2" runat="server" Text='<%#Eval("totalSum")%>' ></asp:Label></strong>
              </li>
                 </ul>
                
              <asp:LinkButton ID="ContinueShopping" CssClass="btn btn-info mb-3" OnClick="ContinueShopping_Click" runat="server">Continue Shopping</asp:LinkButton>
              <asp:LinkButton ID="GotoCheckout" CssClass="btn btn-primary mb-3" OnClick="GotoCheckout_Click" runat="server">  Go to Checkout</asp:LinkButton>
                  </ItemTemplate>
        </asp:Repeater>
           

          </div>
        </div>
  
 </div>
    </div>
  </div>
          
</section>
</asp:Content>
