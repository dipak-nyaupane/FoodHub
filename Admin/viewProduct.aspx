<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="viewProduct.aspx.cs" Inherits="FoodHub.Admin.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="main-content">
        <section class="section">
          <div class="section-body">
              <div class="card-body">
                    <nav aria-label="breadcrumb">
                      <ol class="breadcrumb bg-primary text-white-all">
                        <li class="breadcrumb-item"><a href="dashboard.aspx"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                        <li class="breadcrumb-item"><a href="#"><i class="far fa-file"></i>Product </a></li>
                        <li class="breadcrumb-item active" aria-current="page"><i class="fas fa-list"></i>View Product</li>
                      </ol>
                    </nav>             
                   </div>  


                <asp:Repeater ID="GetData" runat="server" onitemcommand="rept_ItemCommand">
                <HeaderTemplate>
                    
             <div class="row">
              <div class="col-12">
                <div class="card">
                
                  <div class="card-body">
                    <div class="table-responsive">
                      <table class="table table-striped" id="table-2">

                           <thead>
                          <tr>
                            <th>Product Id</th>
                            <th>Product Name </th>
                            <th>Product Price</th>
                             <th>Product Category</th>
                             <th>Product Unit</th>
                             <th>Product Description</th>
                             <th>Product Image</th>
                          
                          </tr>
                        </thead>
                       <tbody>

                   
            </HeaderTemplate>

            <ItemTemplate>
                 <tr>
                     
                            <td class="text-center pt-2">

                             <asp:Label ID="Label8" runat="server" Text='<%#Eval("Product_id")%>'></asp:Label>

                            </td>
                     <td><asp:Label ID="Label1" runat="server" Text='<%#Eval("product_name")%>'></asp:Label></td>
                     <td><asp:Label ID="Label2" runat="server" Text='<%#Eval("product_price")%>'></asp:Label></td>
                     <td><asp:Label ID="Label3" runat="server" Text='<%#Eval("product_category_id")%>'></asp:Label></td>
                     <td><asp:Label ID="Label4" runat="server" Text='<%#Eval("product_unit")%>'></asp:Label></td>
                       <td><asp:Label ID="Label5" runat="server" Text='<%#Eval("product_description")%>'></asp:Label></td>
                     <td><asp:Image ID="Image1" runat="server" class="rounded-circle" width="35" data-toggle="tooltip" ImageUrl='<%#"assets/Images/ProductPhoto/" + Eval("product_image")%>' /></td>
                     
                     
        
             
         
                     </ItemTemplate>
                          
                    <FooterTemplate>
               </tr>
                    </table>
                              
                    </FooterTemplate>
              </asp:Repeater>






              </div>
              </section>
         </div>

  

</asp:Content>
