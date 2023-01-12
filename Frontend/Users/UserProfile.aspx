<%@ Page Title="" Language="C#" MasterPageFile="~/Frontend/Users/User.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="FoodHub.Frontend.Users.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid page-header mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container">
            <h1 class="display-3 mb-3 animated slideInDown">User Details</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a class="text-body" href="#">Home</a></li>
                    <li class="breadcrumb-item text-dark active" aria-current="page">User Details</li>
                </ol>
            </nav>
        </div>
    </div>
  <!-- About Start -->
        
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-5 align-items-center">
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">

                    <div class="about-img position-relative overflow-hidden p-5 pe-0">
                        <asp:Label ID="lblEditPhoto" runat="server" ></asp:Label>
                    <asp:Image ID="Image" runat="server" CssClass="img-fluid w-100"   /> 
                     
                    </div>
               </div>
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
                    <h1 class="display-5 mb-4">User Name: <asp:Label ID="txtUserName" runat="server"></asp:Label></h1>
               
                       
                    <p><i class="fas fa-key">&nbsp;</i>User Id: <asp:Label ID="txtUserId" runat="server"></asp:Label></p>
                    <p><i class="fas fa-envelope">&nbsp;</i>Email: <asp:Label ID="txtEmail" runat="server"></asp:Label></p>
                    <p><i class="fas fa-user-alt">&nbsp;</i>Gender: <asp:Label ID="txtGender" runat="server"></asp:Label></p>
                      <p><i class="fas fa-mobile-alt">&nbsp;</i>Mobile Number: <asp:Label ID="txtMobileNumber" runat="server" ></asp:Label></p>
                    <p><i class="fas fa-address-card">&nbsp;</i>Address: <asp:Label ID="txtAddress" runat="server" ></asp:Label></p>
                
                     <asp:LinkButton ID="USER_ID"  CssClass="btn btn-primary rounded-pill py-3 px-5 mt-3" OnClick="btn_User_Click" runat="server"> Edit Profile</asp:LinkButton>
                </div>
         
                    
            </div>
        </div>
    </div>
                 

</asp:Content>
