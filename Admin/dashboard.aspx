<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="FoodHub.Admin.WebForm12" %>
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
                      
                      </ol>
                    </nav>             
                   </div>  
  
          <div class="row ">
              <asp:Repeater ID="DataDetails" runat="server"> <ItemTemplate>
            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
              <div class="card">
                <div class="card-statistic-4">
                  <div class="align-items-center justify-content-between">
                    <div class="row ">
                      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pr-0 pt-3">
                        <div class="card-content">
                          <h5 class="font-15">Users</h5>
                          <h2 class="mb-3 font-18">
                              <asp:Label ID="Label1" runat="server" Text='<%#Eval("TotalUser")%>'></asp:Label></h2>
                        
                        </div>
                      </div>
                      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pl-0">
                        <div class="banner-img">
                          <img src="assets/img/banner/1.png" alt="">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
           
             </ItemTemplate></asp:Repeater>
           <asp:Repeater ID="DataDetails1" runat="server"> <ItemTemplate>
            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
              <div class="card">
                <div class="card-statistic-4">
                  <div class="align-items-center justify-content-between">
                    <div class="row ">
                      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pr-0 pt-3">
                        <div class="card-content">
                          <h5 class="font-15">Total Product</h5>
                          <h2 class="mb-3 font-18"> <asp:Label ID="Label2" runat="server" Text='<%#Eval("TotalUser")%>'></asp:Label></h2>
                         
                        </div>
                      </div>
                      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pl-0">
                        <div class="banner-img">
                          <img src="assets/img/banner/2.png" alt="">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
  
                           </ItemTemplate></asp:Repeater>
                <asp:Repeater ID="DataDetails2" runat="server"> <ItemTemplate>
            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
              <div class="card">
                <div class="card-statistic-4">
                  <div class="align-items-center justify-content-between">
                    <div class="row ">
                      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pr-0 pt-3">
                        <div class="card-content">
                          <h5 class="font-15">Total Category</h5>
                          <h2 class="mb-3 font-18"> <asp:Label ID="Label3" runat="server" Text='<%#Eval("TotalUser")%>'></asp:Label></h2>
                      
                        </div>
                      </div>
                      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pl-0">
                        <div class="banner-img">
                          <img src="assets/img/banner/cat.Jpg" alt="">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
                                   </ItemTemplate></asp:Repeater>
                <asp:Repeater ID="DataDetails3" runat="server"> <ItemTemplate>

            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
              <div class="card">
                <div class="card-statistic-4">
                  <div class="align-items-center justify-content-between">
                    <div class="row ">
                      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pr-0 pt-3">
                        <div class="card-content">
                          <h5 class="font-15">Total Order</h5>
                          <h2 class="mb-3 font-18"> <asp:Label ID="Label4" runat="server" Text='<%#Eval("TotalUser")%>'></asp:Label></h2>
                        
                        </div>
                      </div>
                      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pl-0">
                        <div class="banner-img">
                          <img src="assets/img/banner/order.png" alt="">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
                                 </ItemTemplate></asp:Repeater>
                <asp:Repeater ID="DataDetails4" runat="server"> <ItemTemplate>
            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
              <div class="card">
                <div class="card-statistic-4">
                  <div class="align-items-center justify-content-between">
                    <div class="row ">
                      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pr-0 pt-3">
                        <div class="card-content">
                          <h5 class="font-15">Delivered Order</h5>
                          <h2 class="mb-3 font-18"> <asp:Label ID="Label5" runat="server" Text='<%#Eval("TotalUser")%>'></asp:Label></h2>
                        
                        </div>
                      </div>
                      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pl-0">
                        <div class="banner-img">
                          <img src="assets/img/products/1.jpg" alt="">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
                               </ItemTemplate></asp:Repeater>
                <asp:Repeater ID="DataDetails5" runat="server"> <ItemTemplate>
            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
              <div class="card">
                <div class="card-statistic-4">
                  <div class="align-items-center justify-content-between">
                    <div class="row ">
                      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pr-0 pt-3">
                        <div class="card-content">
                          <h5 class="font-15">Pending Order</h5>
                          <h2 class="mb-3 font-18"> <asp:Label ID="Label6" runat="server" Text='<%#Eval("TotalUser")%>'></asp:Label></h2>
                        
                        </div>
                      </div>
                      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pl-0">
                        <div class="banner-img">
                          <img src="assets/img/banner/3.png" alt="">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
                                   </ItemTemplate></asp:Repeater>


              <asp:Repeater ID="DataDetails6" runat="server"> <ItemTemplate>
            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
              <div class="card">
                <div class="card-statistic-4">
                  <div class="align-items-center justify-content-between">
                    <div class="row ">
                      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pr-0 pt-3">
                        <div class="card-content">
                          <h5 class="font-15">Check Out Order</h5>
                          <h2 class="mb-3 font-18"> <asp:Label ID="Label6" runat="server" Text='<%#Eval("TotalUser")%>'></asp:Label></h2>
                        
                        </div>
                      </div>
                      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pl-0">
                        <div class="banner-img">
                          <img src="assets/img/banner/os.png" alt="">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
                                   </ItemTemplate></asp:Repeater>
              

          </div>
            
</div>
            </section>
            </div>
</asp:Content>
