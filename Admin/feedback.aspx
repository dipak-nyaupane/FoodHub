<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="FoodHub.Admin.WebForm13" %>
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
                        <li class="breadcrumb-item active" aria-current="page"><i class="fas fa-comment"></i>  Feedback</a></li>
                      
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
                          
                            <th>Customer Name </th>
                            <th>Product Name</th>
                            <th>Ratings</th>
                            <th>Feedback</th>
                          <th>Action</th>
                            </tr>
                        </thead>
                          <tbody>   
            </HeaderTemplate>

            <ItemTemplate>
              
                   <tr>

                   <td><asp:Label ID="Label1" runat="server" Text='<%#Eval("username")%>'></asp:Label></td>
                    <td><asp:Label ID="Label2" runat="server" Text='<%#Eval("product_name")%>'></asp:Label>
                        <asp:Label ID="Label5" runat="server" hidden="true" Text='<%#Eval("Product_id")%>'></asp:Label>
                    </td>
                      <td><asp:Label ID="Label3" runat="server" Text='<%#Eval("Ratings")%>'></asp:Label></td>
                        <td><asp:Label ID="Label4" runat="server" Text='<%#Eval("Feedback")%>'></asp:Label></td>
              <td> <asp:LinkButton ID="btnDeleteUser" CssClass="btn btn-danger" CommandName="delete" OnClientClick="return confirm('Do you want to delete Feedback?');" CommandArgument='<%#Eval("Product_id")%>'  Text="Delete" runat="server">Delete Feedback</asp:LinkButton></td>
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



