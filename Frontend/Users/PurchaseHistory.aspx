<%@ Page Title="" Language="C#" MasterPageFile="~/Frontend/Users/User.Master" AutoEventWireup="true" CodeBehind="PurchaseHistory.aspx.cs" Inherits="FoodHub.Frontend.Users.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       
 <link rel="stylesheet" href="../../Admin/assets/bundles/datatables/DataTables-1.10.16/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="../../Admin/assets/bundles/prism/prism.css">
   
 
    <style>
  .main-content {
  padding-left: 70px;
  padding-right: 60px;
  width: 100%;
  position: relative;
}

        @media (max-width: 1024px) {
             .main-content {
    padding-left: 30px;
    padding-right: 30px;
    width: 100% !important;
  }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
          <!-- Page Header Start -->
    <div class="container-fluid page-header mb-5 wow fadeIn" data-wow-delay="0.1s">
   <div class="container">
            <h1 class="display-3 mb-3 animated slideInDown">Purchase History</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a class="text-body" href="#">Home</a></li>
                    <li class="breadcrumb-item text-dark active" aria-current="page">Purchase History</li>
                </ol>
            </nav>
        </div>
    </div>
            
        <div class="main-content" >
      
            <div class="row">
              <div class="col-12">
                <div class="card">
                  <div class="card-header">
                    <h4>Order Status </h4>
                  </div>
              

                  <div class="card-body">
                    <div class="table-responsive">
                      <table class="table table-striped" id="table-1">
                        <thead>
                          <tr>
                           
                            <th>Invoice Number</th>
                            <th>Total Ammount</th>
                         
                              <th>Number of Items</th>
                            <th>Delivery Status</th>
                         
                            <th>Action</th>
                          </tr>
                        </thead>
                                
                       <tbody>
                           <asp:Repeater ID="viewStatus" runat="server">
 
                        <ItemTemplate>
                          
                            <tr>
                            
                            
                            <td>
                             <asp:Label ID="Invoice_Number" runat="server"  Text='<%#Eval("Invoice_Number")%>'></asp:Label></td>
                            <td> <asp:Label ID="TotalAmount"  runat="server" Text='<%#Eval("totalSum")%>'></asp:Label></td>
                      
                            <td><asp:Label ID="Label2"  runat="server" Text='<%#Eval("total_items")%>'></asp:Label></td>
                            <td><asp:Label ID="Label3"  runat="server" Text='<%#Eval("Status_Name")%>'></asp:Label>
                            <asp:Label ID="Label5"  runat="server" hidden="True" Text='<%#Eval("Status")%>'></asp:Label></td>
                             <td>
                                 <asp:LinkButton class="btn btn-info" ID="LinkButton1" onclick="ViewInvoice_Click" CommandArgument='<%# Eval("Invoice_Number") %>' runat="server"> <i class="fas fa-door-open"> &nbsp; </i>View Invoice</asp:LinkButton>

                      </td>
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
           
         
           </div>   



    
                        
         
              
                 
 
    
		
    <script src="../../Admin/assets/js/app.min.js"></script>
  <!-- JS Libraies -->
  <script src="../../Admin/assets/bundles/datatables/datatables.min.js"></script>
  <script src="../../Admin/assets/bundles/datatables/DataTables-1.10.16/js/dataTables.bootstrap4.min.js"></script>
  <script src="../../Admin/assets/bundles/jquery-ui/jquery-ui.min.js"></script>
  <!-- Page Specific JS File -->
  <script src="../../Admin/assets/js/page/datatables.js"></script>
  <!-- Template JS File -->
  <script src="../../Admin/assets/js/scripts.js"></script>
  <!-- Custom JS File -->
  <script src="../../Admin/assets/js/custom.js"></script>
      <script src="../../Admin/assets/bundles/prism/prism.js"></script>
  <!-- Page Specific JS File -->

</asp:Content>
