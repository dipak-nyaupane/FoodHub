<%@ Page Title="" Language="C#" MasterPageFile="~/Frontend/Users/User.Master" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="FoodHub.Frontend.Users.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <link rel="stylesheet" href="../../Admin/assets/css/app.min.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       <div class="container-fluid page-header mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container">
            <h1 class="display-3 mb-3 animated slideInDown">User</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a class="text-body" href="#">Home</a></li>
                    <li class="breadcrumb-item"><a class="text-body" href="#"> <asp:Label  ID="lbl_fullname" runat="server" Font-Bold="True"></asp:Label></a></li>
                    <li class="breadcrumb-item text-dark active" aria-current="page">Manage User Profile</li>
                </ol>
            </nav>
        </div>
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
           

</asp:Content>
