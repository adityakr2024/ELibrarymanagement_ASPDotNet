<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="user-login.aspx.cs" Inherits="WebApplication1.user_login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">

                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150" src="imgs/user.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Member Login</h3>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <hr />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Member ID</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txtBoxMemberID" runat="server"
                                        placeholder="Member ID"></asp:TextBox>
                                </div>

                                <label>Password</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txtBoxPassword" runat="server"
                                        placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:Button class="btn btn-success btn-block" ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />

                                </div>
                                <div class="form-group">
                                    <a href="usersignup.aspx" ><input class="btn btn-info btn-block" id="btnSignUp" type="button" value="Sign Up" />
                                    </a>
                                </div>
                            </div>
                        </div>

                       
                    </div>
                </div>

                <a href="homepage.aspx"><< Back to Home</a>
                
            </div>
        </div>

    </div>

    <br />
</asp:Content>
