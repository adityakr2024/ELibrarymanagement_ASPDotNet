<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="WebApplication1.homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>
        <img src="imgs/home-bg.png" class="img-fluid" />
    </section>

    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                        <h2>Our Features</h2>
                        <p><b>Our 3 Primary Features</b></p>
                    </center>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <center>
                        <img width="150" src="imgs/digital-inventory.png" />
                        <h4>Digital Book Inventory</h4>
                        <p class="text-justify">
                             Keep track of all your books in one place. Our digital inventory system allows 
                            you to organize, update, and manage your collection seamlessly.

                        </p>
                    </center>
                </div>

                <div class="col-md-4">
                    <center>
                        <img width="170" src="imgs/search-books.png" />
                        <h4>Search Books</h4>
                        <p class="text-justify">
                            Find the perfect book in seconds. Use our advanced search feature to browse by title, 
                            author, or genre with ease and precision.

                        </p>
                    </center>
                </div>
                <%--  --%>
                <div class="col-md-4">
                    <center>
                        <img width="150" src="imgs/defaulter-list.png" />
                        <h4>Defaulter List</h4>
                        <p class="text-justify">
                            Stay informed with real-time updates on overdue books. Our defaulter list keeps you 
                            aware of pending returns to ensure smooth management.

                        </p>
                    </center>
                </div>
            </div>
        </div>
    </section>

    <section>
        <img src="imgs/in-homepage-banner.jpg" class="img-fluid" />
    </section>

    <section>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <center>
                    <h2>Our Process</h2>
                    <p><b>We have a Simple 3 Step Process</b></p>
                </center>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <center>
                    <img width="230" src="imgs/sign-up.png" />
                    <h4>Sign Up</h4>
                    <p class="text-justify">
                         Join us to access your personalized library. Sign up and start managing your book collection today.

                    </p>
                </center>
            </div>

            <div class="col-md-4">
                <center>
                    <img width="290" src="imgs/search.png" />
                    <h4>Search Books</h4>
                    <p class="text-justify">
                        Instantly search and discover books by title, author, or genre in our extensive collection.

                    </p>
                </center>
            </div>

            <div class="col-md-4">
                <center>
                    <img width="150" src="imgs/visit-us.png" />
                    <h4>Visit Us</h4>
                    <p class="text-justify">
                        Drop by our library for a complete experience. Our doors are open to help you explore.

                    </p>
                </center>
            </div>
        </div>
    </div>
</section>
</asp:Content>
