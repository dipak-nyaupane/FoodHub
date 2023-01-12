<%@ Page Title="" Language="C#" MasterPageFile="~/Frontend/Users/User.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="FoodHub.Frontend.Users.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- Page Header Start -->
    <div class="container-fluid page-header mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container">
            <h1 class="display-3 mb-3 animated slideInDown">About Us</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a class="text-body" href="#">Home</a></li>
                    <li class="breadcrumb-item text-dark active" aria-current="page">About Us</li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->


       <!-- About Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-5 align-items-center">
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
                    <div class="about-img position-relative overflow-hidden p-5 pe-0">
                        <img class="img-fluid w-100" src="../assests/img/about.jpg">
                    </div>
                </div>
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
                    <h1 class="display-5 mb-4">Best Organic Fruits And Vegetables And other Oder Items</h1>
                    <p class="mb-4"></p>
                    <p><i class="fa fa-check text-primary me-3"></i></p>
                    <p><i class="fa fa-check text-primary me-3"></i></p>
                    <p><i class="fa fa-check text-primary me-3"></i></p>
                    <a class="btn btn-primary rounded-pill py-3 px-5 mt-3" href="#">Read More</a>
                </div>
            </div>
        </div>
    </div>
    <!-- About End -->


  


    <!-- Feature Start -->
    <div class="container-fluid bg-light bg-icon py-6">
        <div class="container">
            <div class="section-header text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <h1 class="display-5 mb-3">Our Features</h1>
                <p></p>
            </div>
            <div class="row g-4">
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="bg-white text-center h-100 p-4 p-xl-5">
                        <img class="img-fluid mb-4" src="../img/icon-1.png" alt="">
                        <h4 class="mb-3">Online Ordering and Delivery</h4>
                        <p class="mb-4">The market is growing as the consumer popularity of online meal ordering grows. It’s a good idea to think about mobile app development to increase your return on investment. The market is brimming with possibilities, and now is the time to seize them.</p>
                        <a class="btn btn-outline-primary border-2 py-2 px-4 rounded-pill" href="#">Read More</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="bg-white text-center h-100 p-4 p-xl-5">
                        <img class="img-fluid mb-4" src="img/icon-2.png" alt="">
                        <h4 class="mb-3">On-Demand Food Ordering</h4>
                        <p class="mb-4">With the rapid growth of online meal ordering, it’s understandable to have many food delivery apps on your phone. </p>
                        <a class="btn btn-outline-primary border-2 py-2 px-4 rounded-pill" href="#">Read More</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="bg-white text-center h-100 p-4 p-xl-5">
                        <img class="img-fluid mb-4" src="../img/icon-3.png" alt="">
                        <h4 class="mb-3">Simple Payment Methods</h4>
                        <p class="mb-4">Payments play an essential part in any firm, according to the perspective of a business owner. Even though it is the final step in the order placement process, consumers will not try again if they have any minor or significant issues.</p>
                        <a class="btn btn-outline-primary border-2 py-2 px-4 rounded-pill" href="#">Read More</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Feature End -->
</asp:Content>
