﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="manageOrder.aspx.cs" Inherits="FoodHub.Admin.WebForm9" %>
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
                        <li class="breadcrumb-item"><a href="#"><i class="far fa-file"></i>Order</a></li>
                        <li class="breadcrumb-item active" aria-current="page"><i class="fas fa-list"></i>Manage Order</li>
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
                            <th>Invoice Number</th>
                              <th>Customer Name</th>
                            <th>Total Items</th>
                            <th>Total Amount</th>
                              <th>Delivery Status</th>
                            <th>Delivery Options</th>
                          
                            
                             <th>Action</th>
                            </tr>
                        </thead>
                          <tbody>   
            </HeaderTemplate>

            <ItemTemplate>
              
                   <tr>

                    <td><asp:Label ID="Label5" runat="server" Text='<%#Eval("Invoice_Number")%>'></asp:Label></td>
                    <td><asp:Label ID="Label9" runat="server" Text='<%#Eval("username")%>'></asp:Label></td>
                    <td><asp:Label ID="Label1" runat="server" Text='<%#Eval("total_items")%>'></asp:Label></td>
                    <td><asp:Label ID="Label2" runat="server" Text='<%#Eval("totalSum")%>'></asp:Label></td>
                    <td><asp:Label ID="Label6" runat="server" Text='<%#Eval("Status_Name")%>'></asp:Label></td>               

                    
                       <td>
                           <asp:DropDownList ID="editStatus" CssClass="custom-select" runat="server">
                               <asp:ListItem Value="2">Sent Out For Delivered</asp:ListItem>
                                <asp:ListItem Value="3">Delivered</asp:ListItem>
                           </asp:DropDownList>

                       </td>
                    <td><asp:LinkButton ID="btnUpdateStatus" CssClass="btn btn-primary" OnClick="UpdateStatus_Click"  CommandArgument='<%# Eval("Invoice_Number") %>' runat="server">Action</asp:LinkButton>
      <%--              <asp:Button ID="Delete" class="btn btn-danger" CommandName="Delete"  CommandArgument='<%#Eval("Order_id")%>' runat="server" Text="Delete " />--%>

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




           

</asp:Content>
