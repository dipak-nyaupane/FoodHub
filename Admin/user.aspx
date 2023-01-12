<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="user.aspx.cs" Inherits="FoodHub.Admin.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


         <!-- Main Content -->
 <div class="main-content">
        <section class="section">
          <div class="section-body">
              <div class="card-body">

                  <nav aria-label="breadcrumb">
                      <ol class="breadcrumb bg-primary text-white-all">
                        <li class="breadcrumb-item"><a href="dashboard.aspx"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                        <li class="breadcrumb-item"><a href="#"><i class="far fa-file"></i>User </a></li>
                        <li class="breadcrumb-item active" aria-current="page"><i class="fas fa-list"></i>Manage User</li>
                      </ol>
                    </nav>             
                   </div>  

                    <div class="buttons">
                     <button type="button" class="btn btn-icon icon-left btn-primary"  data-toggle="modal" data-target="#exampleModal"><i class="fas fa-user-plus"></i> Add User</button>
                    </div>


                  <asp:Repeater ID="GetData" runat="server" >

                <HeaderTemplate>
                    

                    <div class="row">
              <div class="col-12">
                <div class="card">
                
                  <div class="card-body">
                    <div class="table-responsive">
                      <table class="table table-striped" id="table-2">

                           <thead>
                          <tr>
                            <th>Id</th>
                            <th>User Name </th>
                            <th>Email Address</th>
                             <th>User Role</th>
                             <th>Address</th>
                             <th>Mobile Number</th>
                             <th>Gender</th>
                             <th>Photo</th>
                            <th>Action</th>
                          </tr>
                        </thead>
                          <tbody>

                   
            </HeaderTemplate>

            <ItemTemplate>
                 <tr>
                            <td class="text-center pt-2">

                             <asp:Label ID="Label8" runat="server" Text='<%#Eval("id")%>'></asp:Label>

                            </td>
                     <td><asp:Label ID="Label1" runat="server" Text='<%#Eval("username")%>'></asp:Label></td>
                     <td><asp:Label ID="Label2" runat="server" Text='<%#Eval("email")%>'></asp:Label></td>
                     <td><asp:Label ID="Label3" runat="server" Text='<%#Eval("user_role")%>'></asp:Label></td>
                     <td><asp:Label ID="Label4" runat="server" Text='<%#Eval("address")%>'></asp:Label></td>
                     <td><asp:Label ID="Label5" runat="server" Text='<%#Eval("mobile_number")%>'></asp:Label></td>
                     <td><asp:Label ID="Label6" runat="server" Text='<%#Eval("gender")%>'></asp:Label></td>
                     <td><asp:Image ID="Image1" runat="server" class="rounded-circle" width="35" data-toggle="tooltip" ImageUrl='<%#"assets/Images/UserProfile/" + Eval("photo")%>' /></td>
                     <td>

<%--                           
                     <button type="button" class="btn btn-primary"  data-toggle="modal" data-target='#edit_<%#Eval("id")%>'> <i class="fas fa-edit"></i> Edit</button>--%>
                         <asp:LinkButton ID="editUser" CssClass="btn btn-primary" OnClick="EditUser_Click" OnClientClick="return confirm('Do you want to Edit this User?');" CommandArgument='<%#Eval("id")%>' runat="server">Edit</asp:LinkButton>

                   
                  <asp:LinkButton ID="btnDeleteUser" CssClass="btn btn-danger" OnClick="DeleteUser_Click" OnClientClick="return confirm('Do you want to delete this category?');" CommandArgument='<%#Eval("id")%>' runat="server">Delete</asp:LinkButton>

                   </td>
                     
        
             
         
                     </ItemTemplate>
                          
                    <FooterTemplate>
               </tr>
                    </table>
                              
                    </FooterTemplate>
              </asp:Repeater>
         </div>
        </div>


   
     </section>
     </div>
   


                       <!-- Modal with form -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="formModal" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="formModal">Add User</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">

                  <div class="form-group">
                    <label>Full Name</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <div class="input-group-text">
                          <i class="fas fa-user-alt"></i>
                        </div>
                      </div>
                        <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server"></asp:TextBox>
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
                        <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                  </div>

                  <div class="form-group">
                    <label>Mobile Number</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <div class="input-group-text">
                          <i class="fas fa-mobile-alt"></i>
                        </div>
                      </div>
                        <asp:TextBox ID="txtMobileNumber" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                  </div>

                  <div class="form-group">
                    <label>Address</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <div class="input-group-text">
                          <i class="fas fa-address-card"></i>
                        </div>
                      </div>
                        <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                  </div>
               
            

                      <div class="form-group">
                    <label>User Role</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                      </div>
                        <asp:DropDownList ID="txtUserRole" runat="server" CssClass="custom-select"></asp:DropDownList>

                        </div>
                          </div>


                      <div class="form-group">
                    <label>Gender</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                      </div>

                <asp:DropDownList ID="txtGender" runat="server" CssClass="custom-select"></asp:DropDownList>


                        </div>
                          </div>

                   <div class="form-group">
                    <label>User Photo</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                         
                       <asp:FileUpload ID="filePhoto" runat="server" class="form-control" />
                      </div>
                       
                    </div>
                  </div>

                     
                 

                   <div class="form-group">
                    <label>Password</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <div class="input-group-text">
                          <i class="fas fa-lock"></i>
                        </div>
                      </div>
                        <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                  </div>

                  <div class="modal-footer">
                     <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>


                      <asp:LinkButton ID="AddNewuser" onclick="AddNewuser_click"  CssClass="btn btn-primary" runat="server">Create New User</asp:LinkButton>
  
                 
              </div>
                  </div>


                </div>
                </div>
              </div>
       
  <%-- Edit Model --%>
  <%--  <asp:Repeater ID="editUser" runat="server">
        <ItemTemplate>
         <div class="modal fade" ID='edit_<%#Eval("id")%>' tabindex="-1" role="dialog" aria-labelledby="formModal" aria-hidden="true">
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
                    <label>Full Name</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <div class="input-group-text">
                          <i class="fas fa-user-alt"></i>
                        </div>
                      </div>
                        <asp:TextBox ID="editUserName" CssClass="form-control" Text='<%#Eval("username")%>'  runat="server"></asp:TextBox>
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
                        <asp:TextBox ID="editEmail" CssClass="form-control" Text='<%#Eval("email")%>' runat="server"></asp:TextBox>
                    </div>
                  </div>

                  <div class="form-group">
                    <label>Mobile Number</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <div class="input-group-text">
                          <i class="fas fa-mobile-alt"></i>
                        </div>
                      </div>
                        <asp:TextBox ID="editMobileNumber" Text='<%#Eval("mobile_number")%>' CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                  </div>

                  <div class="form-group">
                    <label>Address</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <div class="input-group-text">
                          <i class="fas fa-address-card"></i>
                        </div>
                      </div>
                        <asp:TextBox ID="editAddress" CssClass="form-control" Text='<%#Eval("address")%>' runat="server"></asp:TextBox>
                    </div>
                  </div>

                <div class="form-group">
                    <label>User Role</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                      </div>
                        
                        <asp:DropDownList ID="editUserRole" runat="server" CssClass="custom-select">    
                        <asp:ListItem Text="Admin" Value="Admin" />
                        <asp:ListItem Text="User" Value="User" />
                        </asp:DropDownList>

                        </div>
                          </div>


                <div class="form-group">
                    <label>Gender</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                      </div>
                        <asp:DropDownList ID="editGender" runat="server" CssClass="custom-select"></asp:DropDownList>

                        </div>
                          </div>

                 <div class="form-group">
                    <label>User Photo</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                       <asp:FileUpload ID="editfilePhoto" Text='<%#Eval("photo")%>'  runat="server" class="form-control" />
                      </div>
                       
                    </div>
                  </div>


                 

                  <div class="modal-footer">
                     <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>


                      <asp:LinkButton ID="editUser" OnClick="editUser_click"  CommandArgument='<%#Eval("id")%>'  CssClass="btn btn-primary" runat="server"><i class="fas fa-edit"></i> Update </asp:LinkButton>
  
                 
              </div>
                  </div>


                </div>
                </div>
              </div>
            </ItemTemplate>
    </asp:Repeater>--%>
</asp:Content>
