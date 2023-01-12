<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="FoodHub.signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="UTF-8" />
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport" />
  <title>Register</title>
  <!-- General CSS Files -->
   <!-- General CSS Files -->
  <link rel="stylesheet" href="Admin/assets/css/app.min.css" />
  <link rel="stylesheet" href="Admin/assets/bundles/bootstrap-social/bootstrap-social.css" />
  <!-- Template CSS -->
  <link rel="stylesheet" href="Admin/assets/css/style.css" />
  <link rel="stylesheet" href="Admin/assets/css/components.css" />
  <!-- Custom style CSS -->
  <link rel="stylesheet" href="Admin/assets/css/custom.css" />
  <link rel='shortcut icon' type='image/x-icon' href='Main/assets/img/favicon.ico' />
</head>
<body>
    <form id="form1" runat="server" class="needs-validation" novalidate="">
    <div class="loader"></div>
  <div id="app">
    <section class="section">
      <div class="container mt-5">
        <div class="row">
          <div class="col-12 col-sm-10 offset-sm-1 col-md-8 offset-md-2 col-lg-8 offset-lg-2 col-xl-8 offset-xl-2">
            <div class="card card-primary">
              <div class="card-header">
                <h4>Register</h4>
              </div>
              <div class="card-body">

          <div class="row">
              <div class="form-group col-6">
                      <label for="frist_name">Full Name</label>
                   <asp:TextBox ID="fullname" runat="server" CssClass="form-control" placeholder="Full Name"  required="True" autofocus="True" > </asp:TextBox>
                     <div class="invalid-feedback">
                         
                         <asp:RequiredFieldValidator runat="server" ErrorMessage="Name is mandatory" ControlToValidate="FullName" ForeColor="Red" ClientIDMode="Inherit" ValidationGroup="signupbtn"></asp:RequiredFieldValidator>
                         </div>
                    </div>

                 
          <div class="form-group col-6">
             <label for="gender">Gender</label>
              <asp:DropDownList ID="txtGender" CssClass="form-control" runat="server" ></asp:DropDownList>
               <div class="invalid-feedback">
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" ErrorMessage="Please select Gender" ControlToValidate="txtGender" ValidationGroup="signupbtn"></asp:RequiredFieldValidator>
                   </div>

              </div>

                  </div>
                  <div class="form-group">
                    <label for="email">Email</label>
                       <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" type="Email"  placeholder="Email"  required="True" autofocus="True" ></asp:TextBox>

                    <div class="invalid-feedback">
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Email is mandatory" ControlToValidate="txtEmail" ForeColor="Red" ValidationGroup="signupbtn"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email."  ControlToValidate="txtEmail" ForeColor="Red" ValidationGroup="signupbtn" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>
                  </div>

                  <div class="row">
                    <div class="form-group col-6">
                      <label for="password" class="d-block">Password</label>
                       <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control pwstrength" data-indicator="pwindicator" placeholder="Password" required="True" autofocus="True" ></asp:TextBox>
                        <div class="invalid-feedback">
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Password is mandatory" ControlToValidate="txtPassword" ForeColor="Red" ValidationGroup="signupbtn"></asp:RequiredFieldValidator>
                            </div>
                      <div id="pwindicator" class="pwindicator">
                        <div class="bar"></div>
                        <div class="label"></div>
                      </div>
                    </div>
                    <div class="form-group col-6">
                      <label for="password2" class="d-block">Password Confirmation</label>
                 
                         <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Confirm Password"  required="required" autofocus="True"></asp:TextBox>
          
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password did not match." ValidationGroup="signupbtn" ControlToValidate="ConfirmPassword" ForeColor="Red" ControlToCompare="txtPassword"></asp:CompareValidator>
                              <div class="invalid-feedback">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field is mandatory." ControlToValidate="ConfirmPassword" ForeColor="Red" ValidationGroup="signupbtn"></asp:RequiredFieldValidator>
                         </div>
                        </div>

               
               </div>


         <div class="row">
              <div class="form-group col-6">
                      <label for="Address">Address</label>
                   <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Address"  required="True" autofocus="True" > </asp:TextBox>
                     <div class="invalid-feedback">
                         <asp:RequiredFieldValidator runat="server" ErrorMessage="Address is mandatory" ControlToValidate="txtAddress" ForeColor="Red" ClientIDMode="Inherit" ValidationGroup="signupbtn"></asp:RequiredFieldValidator>
                         </div>
                    </div>

                    <div class="form-group col-6">
                      <label for="txtMobileNumber">Mobile Number</label>
                       <asp:TextBox ID="txtMobileNumber" runat="server" CssClass="form-control" placeholder="Mobile Number"  required="True" autofocus="True" > </asp:TextBox>
                           <div class="invalid-feedback">
                               <asp:RequiredFieldValidator runat="server" ErrorMessage="Number is mandatory" ControlToValidate="txtMobileNumber" ForeColor="Red" ClientIDMode="Inherit" ValidationGroup="signupbtn"></asp:RequiredFieldValidator>
                               </div>

                    </div>
                  </div>

                   <div class="form-group col-6">
                      <label for="txtMobileNumber">Image</label>
                       <asp:FileUpload ID="fileUserImage" CssClass="form-control"  required="True" runat="server" />
                           <div class="invalid-feedback">
                               <asp:RequiredFieldValidator runat="server" ErrorMessage="Number is mandatory" ControlToValidate="txtMobileNumber" ForeColor="Red" ClientIDMode="Inherit" ValidationGroup="signupbtn"></asp:RequiredFieldValidator>
                               </div>

                    </div>
              


                
                  <div class="form-group">
                      <asp:Button runat="server" ID="btn_Signup" PostBackUrl="#" CssClass="btn btn-primary btn-lg btn-block" Text="Signup" OnClick="Registration_Click" ValidationGroup="signupbtn" />
                  </div>
        
              </div>
              <div class="mb-4 text-muted text-center">
                Already Registered? <a href="Login.aspx">Login</a>
              </div>
            </div>
          </div>
        </div>
      </div>

       
    </section>
  </div>


  <!-- General JS Scripts -->
  <script src="Admin/assets/js/app.min.js"></script>
  <!-- JS Libraies -->
  <script src="Admin/assets/bundles/jquery-pwstrength/jquery.pwstrength.min.js"></script>
  <script src="Admin/assets/bundles/jquery-selectric/jquery.selectric.min.js"></script>
  <!-- Page Specific JS File -->
  <script src="Admin/assets/js/page/auth-register.js"></script>
  <!-- Template JS File -->
  <script src="Admin/assets/js/scripts.js"></script>
  <!-- Custom JS File -->
  <script src="Admin/assets/js/custom.js"></script>

   </form>  
</body>
</html>