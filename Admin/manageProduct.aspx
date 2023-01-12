<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="manageProduct.aspx.cs" Inherits="FoodHub.Admin.WebForm3" %>
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
                        <li class="breadcrumb-item active" aria-current="page"><i class="fas fa-list"></i>Manage Product</li>
                      </ol>
                    </nav>             
                   </div>  


               <div class="buttons">
                     <button type="button" class="btn btn-icon icon-left btn-primary"  data-toggle="modal" data-target="#exampleModal"><i class="fas fa-plus-circle"></i> Add New Product</button>
                    </div>
              
                  <asp:Repeater ID="ProductData" runat="server" >
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
                            <th>Action</th>
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
                     <td><asp:Label ID="Label3" runat="server" Text='<%#Eval("CategoryName")%>'></asp:Label></td>
                     <td><asp:Label ID="Label4" runat="server" Text='<%#Eval("product_unit")%>'></asp:Label></td>
                       <td><asp:Label ID="Label5" runat="server" Text='<%#Eval("product_description")%>'></asp:Label></td>
                     <td><asp:Image ID="Image1" runat="server" class="rounded-circle" width="35" data-toggle="tooltip" ImageUrl='<%#"assets/Images/ProductPhoto/" + Eval("product_image")%>' /></td>
                     <td>    
                    
                         <asp:LinkButton ID="btnUpdateProduct" CssClass="btn btn-primary" OnClick="EditProduct_Click" OnClientClick="return confirm('Do you want to edit this category?');" CommandArgument='<%# Eval("Product_id") %>' runat="server">Edit</asp:LinkButton>
                
                     <asp:LinkButton ID="btnDeleteProduct" CssClass="btn btn-danger" OnClick="DeleteProduct_Click" OnClientClick="return confirm('Do you want to delete this category?');" CommandArgument='<%# Eval("Product_id") %>' runat="server">Delete</asp:LinkButton>

                   </td>
                     
        
             
         
                     </ItemTemplate>
                          
                    <FooterTemplate>
               </tr>
                    </table>
                              
                    </FooterTemplate>
              </asp:Repeater>




              </div>
              </section>
         </div>


         <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="formModal"
          aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="formModal">Add Product</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">

                  <div class="form-group">
                    <label>Product Name</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <div class="input-group-text">
                          <i class="fas fa-box-open"></i>
                        </div>
                      </div>
                        <asp:TextBox ID="txtProductName"  CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                  </div>

                       <div class="form-group">
                    <label>Product Category</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                      </div>
                        <asp:DropDownList ID="txtProductCategory" runat="server" CssClass="custom-select"></asp:DropDownList>

                        </div>
                          </div>

                  <div class="form-group">
                    <label>Product Price </label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <div class="input-group-text">
                          <i class="fas fa-ellipsis-h"></i>
                        </div>
                      </div>
                        <asp:TextBox ID="txtProductPrice" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                  </div>

                       <div class="form-group">
                    <label>Product Unit </label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <div class="input-group-text">
                          <i class="fas fa-ellipsis-h"></i>
                        </div>
                      </div>
                        <asp:TextBox ID="txtProductUnit" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                  </div>

                         <div class="form-group">
                    <label>Product Photo</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                         
                       <asp:FileUpload ID="productPhoto" runat="server" class="form-control" />
                      </div>
                       
                    </div>
                  </div>

                     <div class="form-group">
                    <label>Product Description </label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <div class="input-group-text">
                          <i class="fas fa-ellipsis-h"></i>
                        </div>
                      </div>
                        <asp:TextBox ID="txtProductDescription" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                  </div>



                       <div class="modal-footer">
                     <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  <asp:LinkButton ID="AddProduct" OnClick="AddProduct_click" CssClass="btn btn-primary" runat="server"><i class="fas fa-plus-circle"> Add Product</i></asp:LinkButton>
              </div>

                  </div>
                </div>
              
              </div>

                </div>


     <%-- Edit Model --%>
  

   
</asp:Content>
