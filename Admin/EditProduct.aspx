<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="FoodHub.Admin.WebForm10" %>
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
                        <li class="breadcrumb-item active" aria-current="page"><i class="fas fa-list"></i>Edit Product</li>
                      </ol>
                    </nav>             
                   </div>  

   
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="formModal1">Edit Product</h5>
              </div>
              <div class="modal-body">

                       <div class="form-group">
                    <label>Product Id</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <div class="input-group-text">
                          <i class="fas fa-box-open"></i>
                        </div>
                      </div>
                        <asp:TextBox ID="editProductId" CssClass="form-control" ReadOnly="true"  runat="server"></asp:TextBox>
                    </div>
                  </div>

                  <div class="form-group">
                    <label>Product Name</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <div class="input-group-text">
                          <i class="fas fa-box-open"></i>
                        </div>
                      </div>
                        <asp:TextBox ID="editProductName" CssClass="form-control"  runat="server"></asp:TextBox>
                    </div>
                  </div>

                       <div class="form-group">
                    <label>Product Category</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                      </div>
                        <asp:DropDownList ID="editProductCategory" value="txtProductName1" runat="server" CssClass="custom-select"></asp:DropDownList>

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
                        <asp:TextBox ID="editProductPrice" CssClass="form-control" runat="server"></asp:TextBox>
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
                        <asp:TextBox ID="editProductUnit" CssClass="form-control"  runat="server"></asp:TextBox>
                    </div>
                  </div>

                         <div class="form-group">
                    <label>Product Photo</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                          <asp:Label ID="lblEditPhoto" runat="server" Text="lblEditPhoto" visible="false"></asp:Label>
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
                        <asp:TextBox ID="editProductDescription" CssClass="form-control"  runat="server"></asp:TextBox>
                    </div>
                  </div>

                  <div class="modal-footer">

                      <asp:LinkButton ID="editUser" OnClick="editProduct_click"  CssClass="btn btn-primary" runat="server"><i class="fas fa-edit"></i> Update </asp:LinkButton>
                </div>
                  </div>


              </div>
              </div>

              </div>
            </section>
         </div>

 


</asp:Content>
