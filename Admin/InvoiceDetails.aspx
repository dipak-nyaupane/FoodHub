<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="InvoiceDetails.aspx.cs" Inherits="FoodHub.Admin.WebForm5" %>
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
                       <li class="breadcrumb-item"><a href="dashboard.aspx"><i class="fas fa-tachometer-alt"></i>Order</a></li>
                     <li class="breadcrumb-item"><a href="dashboard.aspx"><i class="fas fa-tachometer-alt"></i>Invoice Details</a></li>
                      </ol>
                    </nav>             
                   </div> 
                <div class="row">
              <div class="col-12">
                <div class="card">
                  <div class="card-header">
                    <h4>Purchase Details </div>
                  <div class="card-body">
                    <div class="table-responsive">
                      <table class="table table-striped table-hover" id="tableExport" style="width:100%;">
                        <thead>
                          <tr>
                            <th class="text-center">
                              Invoice Number
                            </th>
                            <th>Customer Name</th>
                            <th>Product Name </th>
                            
                            <th>Product Category</th>
                              <th>Image</th>
                              <th>Quantity</th>
                            <th>Product Unit Price</th>
                            <th>Total Price (Unit*Quantity)</th>                          
                           
                          </tr>
                        </thead>
                          <tfoot>
                              <tr>
                                  <th></th>
                                  <th></th>
                                  <th></th>
                                  <th></th>
                                  <th></th>
                                  <th></th>
                                  <th>Total Price:</th>
                                  <th><asp:Label ID="TotalPrice" runat="server"  ></asp:Label></th>

                              </tr>
                          </tfoot>
                        <tbody>
              
                            <asp:Repeater ID="ProductData" runat="server" >

            <ItemTemplate>
                          <tr>
                            <td>
                              <asp:Label ID="Invoice_Number" runat="server" Text='<%#Eval("Invoice_Number")%>' ></asp:Label>
                            </td>

                            <td><asp:Label ID="Customer_Name" runat="server" Text='<%#Eval("Invoice_Number")%>' ></asp:Label></td>

                            <td class="align-middle">
                            <asp:Label ID="product_name" runat="server" Text='<%#Eval("product_name")%>' ></asp:Label>
                            </td>
                               <td>
                           <asp:Label ID="product_price" runat="server" Text='<%#Eval("CategoryName")%>' ></asp:Label>
                                 
                            </td>
                                         <td>
                                               <asp:Image ID="Image1" runat="server" class="user-img-radious-style" width="65" data-toggle="tooltip" ImageUrl='<%#"assets/Images/ProductPhoto/" + Eval("product_image")%>' />
                            </td>

                            <td>
                               <asp:Label ID="product_description" runat="server" Text='<%#Eval("Quantity")%>' ></asp:Label>
                            </td>
                             
                               <td><asp:Label ID="Label2" runat="server" Text='<%#Eval("product_price")%>' ></asp:Label> </td>
                            <td> <asp:Label ID="Label1" runat="server" Text='<%#Eval("totalCost")%>' ></asp:Label></td>
                          </tr>
                          </ItemTemplate>
          </asp:Repeater>
                        
                        
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
              </section>
        </div>
</asp:Content>
