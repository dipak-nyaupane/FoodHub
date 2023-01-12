<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="viewCategory.aspx.cs" Inherits="FoodHub.Admin.WebForm6" %>
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
                        <li class="breadcrumb-item"><a href="#"><i class="far fa-file"></i>Category </a></li>
                        <li class="breadcrumb-item active" aria-current="page"><i class="fas fa-list"></i>View Category</li>
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
                            <th>id </th>
                            <th>Category Name </th>
                            <th>Category Descriptions</th>
                            <th>Creted Date</th>
                             <th>Action</th>
                            </tr>
                        </thead>
                          <tbody>   
            </HeaderTemplate>

            <ItemTemplate>
              
                   <tr>
                  <td class="text-center pt-2"> <asp:Label ID="Label8" runat="server" Text='<%#Eval("Category_id")%>'></asp:Label></td>

                   <td><asp:Label ID="Label1" runat="server" Text='<%#Eval("CategoryName")%>'></asp:Label></td>
                    <td><asp:Label ID="Label2" runat="server" Text='<%#Eval("CategoryDescription")%>'></asp:Label></td>
                      <td><asp:Label ID="Label3" runat="server" Text='<%#Eval("created_date")%>'></asp:Label></td>
                <td>
                    <button type="button" class="btn btn-primary"  data-toggle="modal" data-target='#edit_<%#Eval("Category_id")%>'><i class="fas fa-door-open"> &nbsp; </i>View CAtegory</button>
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
    
     <asp:Repeater ID="editCategory" runat="server">
        <ItemTemplate>
         <div class="modal fade" ID='edit_<%#Eval("Category_id")%>' tabindex="-1" role="dialog" aria-labelledby="formModal" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="formModal1">Edit User</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                    <div class="form-group">
                    <label>Category Id</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <div class="input-group-text">
                          <i class="fas fa-exclamation"></i>
                        </div>
                      </div>
                        <asp:TextBox ID="TextBox1" CssClass="form-control" Text='<%#Eval("Category_id")%>'  runat="server" ReadOnly="true"></asp:TextBox>
                    </div>
                  </div>

                  <div class="form-group">
                    <label>Category Name</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <div class="input-group-text">
                          <i class="fas fa-box-open"></i>
                        </div>
                      </div>
                        <asp:TextBox ID="editCategoryName" CssClass="form-control" Text='<%#Eval("CategoryName")%>'  runat="server" ReadOnly="true"></asp:TextBox>
                    </div>
                  </div>

                  <div class="form-group">
                    <label>Category Description</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <div class="input-group-text">
                          <i class="fas fa-ellipsis-h"></i>
                        </div>
                      </div>
                        <asp:TextBox ID="editCategoryDescription" CssClass="form-control" Text='<%#Eval("CategoryDescription")%>' runat="server" ReadOnly="true"></asp:TextBox>
                    </div>
                  </div>

                  <div class="modal-footer">
                     <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
                  </div>
                </div>
                </div>
              </div>
            </ItemTemplate>
    </asp:Repeater>
</asp:Content>
