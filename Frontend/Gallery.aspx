<%@ Page Title="" Language="C#" MasterPageFile="~/frontend/Frontend.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="FoodHub.frontend.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
           <!-- Page Header Start -->
    <div class="container-fluid page-header mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container">
            <h1 class="display-3 mb-3 animated slideInDown">Gallery</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a class="text-body" href="#">Home</a></li>
                    <li class="breadcrumb-item text-dark active" aria-current="page">Gallery</li>
                </ol>
            </nav>
        </div>
    </div>

    

    <!-- Page Header End -->     
    
        <div class="container-xxl py-5">
             <div class="container">
         

             <div class="tab-content">
                <div id="tab-1" class="tab-pane fade show p-0 active">
                    <div class="row g-4">

    <asp:Repeater ID="ProductData" runat="server" >

            <ItemTemplate>
                         <div class="col-xl-3 col-lg-6 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="product-item">
                       
                             <div class="position-relative bg-light overflow-hidden">
                                   
                                     <asp:Image ID="Image1" runat="server" class="img-fluid w-100" width="22" Height="150" data-toggle="tooltip" ImageUrl='<%#"../Admin/assets/Images/ProductPhoto/" + Eval("product_image")%>' />
                                   
                               </div>

                                <div class="text-center p-4">
                                      <asp:Label ID="Label6" class="d-block h5 mb-2" runat="server" Text='<%#Eval("Product_id")%>' visible="False"></asp:Label>
                                      <asp:Label ID="Label1" class="d-block h5 mb-2" runat="server" Text='<%#Eval("product_name")%>'></asp:Label>
                                Rs <asp:Label ID="Label2" runat="server" Text='<%#Eval("product_price")%>'></asp:Label>
                           
                                </div>
                            <div class="d-flex border-top">
                                     <small class="w-100 text-center py-2">
                                         <asp:LinkButton ID="btnView" CssClass="text-body" CommandArgument='<%# Eval("Product_id") %>' onclick="ClickProductDetails" runat="server"><i class="fa fa-eye text-primary me-2"></i>View Details</asp:LinkButton>
                                </small>
                                         </div>
                                 </div>
                            </div>
                     </ItemTemplate>

             </asp:Repeater>
                             
                             
                        </div>
                    </div>
          </div>
            
     </div>

        </div>



</asp:Content>
