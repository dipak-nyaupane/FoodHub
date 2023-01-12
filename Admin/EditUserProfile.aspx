<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="EditUserProfile.aspx.cs" Inherits="FoodHub.Admin.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="main-content">
        <section class="section">
          <div class="container mt-7">
              <div class="card-body">
                    <nav aria-label="breadcrumb">
                      <ol class="breadcrumb bg-primary text-white-all">
                        <li class="breadcrumb-item"><a href="dashboard.aspx"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                        <li class="breadcrumb-item"><a href="#"><i class="far fa-file"></i>User </a></li>
                        <li class="breadcrumb-item active" aria-current="page"><i class="fas fa-list"></i>Edit User</li>
                      </ol>
                    </nav>             
                   </div>  
              
          <div class="col-12 col-sm-10 offset-sm-1 col-md-8 offset-md-2 col-lg-8 offset-lg-2 col-xl-6 offset-xl-2">
            <div class="card card-primary">
              <div class="card-header">
                <h4>Edit User</h4>
              </div>
              <div class="card-body">
             
       
                   <div class="form-group ">
                    <label for="User_Id">User Id</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <div class="input-group-text">
                          <i class="fas fa-key"></i>
                        </div>
                      </div>
                        <asp:TextBox ID="editUserId" CssClass="form-control" ReadOnly="true"  runat="server"></asp:TextBox>
                    </div>
                  </div>
                      

                  <div class="form-group ">
                    <label>Full Name</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <div class="input-group-text">
                          <i class="fas fa-user-alt"></i>
                        </div>
                      </div>
                        <asp:TextBox ID="editUserName" CssClass="form-control"  runat="server"></asp:TextBox>
                    </div>
                  </div>
              
                  <div class="form-group">
                    <label>Email</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <div class="input-group-text">
                          <i class="fas fa-envelope"></i>
                        </div>
                      </div>
                        <asp:TextBox ID="editEmail" CssClass="form-control"  runat="server"></asp:TextBox>
                    </div>
                  </div>
      

                   
   
                  <div class="form-group ">
                    <label>Address</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <div class="input-group-text">
                          <i class="fas fa-address-card"></i>
                        </div>
                      </div>
                        <asp:TextBox ID="editAddress" CssClass="form-control"  runat="server"></asp:TextBox>
                    </div>
                  </div>

                        <div class="form-group ">
                    <label>User Photo</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                          <asp:Label ID="lblEditfilePhoto" runat="server" Text="lblEditPhoto" visible="false"></asp:Label>
                       <asp:FileUpload ID="editfilePhoto" runat="server" class="form-control" />
                      </div>
                       
                    </div>
                  </div>
    


                                
                  <div class="form-group ">
                    <label>Mobile Number</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <div class="input-group-text">
                          <i class="fas fa-mobile-alt"></i>
                        </div>
                      </div>
                        <asp:TextBox ID="editMobileNumber"  CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                  </div>

                <div class="row">

                <div class="form-group col-6">
                    <label>User Role</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                      </div>
                        
                        <asp:DropDownList ID="editUserRole" runat="server" CssClass="custom-select"></asp:DropDownList>

                        </div>
                          </div>
                  


                <div class="form-group col-6">
                    <label>Gender</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                      </div>
                        <asp:DropDownList ID="editGender" runat="server" CssClass="custom-select"></asp:DropDownList>

                        </div>
                          </div>
                      </div>
               
                  <div class="modal-footer">
                   
                      <asp:LinkButton ID="editUser" OnClick="editUser_click"  CssClass="btn btn-primary"  runat="server"><i class="fas fa-edit"></i> Update </asp:LinkButton>

              </div>
                  </div>


                </div>
            
              </div>
              </div>
  
            </section>
            </div>
    


</asp:Content>
