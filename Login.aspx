<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FoodHub.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="UTF-8" />
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport" />
  <title>Login</title>
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
    <div class="loader"></div>
  <div id="app">
    <section class="section">
      <div class="container mt-5">
        <div class="row">
          <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
            <div class="card card-primary">
              <div class="card-header">
                <h4>Login</h4>
              </div>
              <div class="card-body">
            <form id="form1" runat="server" class="needs-validation" novalidate="">

                 <%--<div class="form-group">

                    <label for="email">User Role</label>
                     <asp:DropDownList ID="txtUserRole" CssClass="form-control" runat="server" required="true" ></asp:DropDownList>
                   
                  </div>--%>

            <div class="form-group">

                    <label for="email">Email</label>
                    <asp:TextBox runat="server" ID="txtEmail" type="email" CssClass="form-control" placeholder="Enter Email"  required="true" autofocus="True"></asp:TextBox>
                    <div class="invalid-feedback">
                      Please fill in your email
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="d-block">
                      <label for="password" class="control-label">Password</label>
                      <div class="float-right">
                       <%-- Forgot Password --%>
                      </div>
                    </div>
                      <asp:TextBox runat="server" ID="txtpassword" CssClass="form-control" TextMode="Password" placeholder="Enter Password" required="True"></asp:TextBox>  
                    <div class="invalid-feedback">
                      please fill in your password
                    </div>
                  </div>
                  
                  <div class="form-group">
               <%-- <asp:Label ID="lblUserRole" runat="server" Text="lblUserRole" visible="false"></asp:Label>--%>
                  
          <asp:Button runat="server" ID="btn_Login" CssClass="btn btn-primary btn-lg btn-block" Text="Login" OnClick="Btn_Login_Click" ValidationGroup="loginbtn" />

                  </div>


                  <div class="mt-5 text-muted text-center">
              Don't have an account? <asp:LinkButton ID="Signup" runat="server" CssClass=""  OnClick="Btn_signup">Sign Up </asp:LinkButton>
            </div>
    </form>

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
  <!-- Page Specific JS File -->
  <!-- Template JS File -->
  <script src="Admin/assets/js/scripts.js"></script>
  <!-- Custom JS File -->
  <script src="Admin/assets/js/custom.js"></script>

</body>
</html>
