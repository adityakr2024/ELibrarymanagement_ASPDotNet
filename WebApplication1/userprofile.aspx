<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userprofile.aspx.cs" Inherits="WebApplication1.userprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">

                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150px" src="imgs/signup-icon.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Your Profile</h4>
                                    <span>Account Status -</span>
                                    <asp:Label class="badge bg-success" ID="Label1" runat="server" Text="Your Status"></asp:Label>

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
                            <div class="col-md-6">
                                <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox1" runat="server"
                                        placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>


                            <div class="col-md-6">
                                <label>Date of Birth</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox3" runat="server"
                                        placeholder="Date of Birth" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Contact Number</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox2" runat="server"
                                        placeholder="Contact Number" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>


                            <div class="col-md-6">
                                <label>Email ID</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox4" runat="server"
                                        placeholder="Email ID" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>



                        <div class="row">
                            <div class="col-md-4">
                                <label>State</label>
                                <div class="form-group">
                                    <asp:DropDownList Class="form-control" ID="DropDownList1" runat="server">
                                        <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                        <asp:ListItem Text="Andhra Pradesh" Value="Andhra Pradesh"></asp:ListItem>
                                        <asp:ListItem Text="Arunachal Pradesh" Value="Arunachal Pradesh"></asp:ListItem>
                                        <asp:ListItem Text="Assam" Value="Assam"></asp:ListItem>
                                        <asp:ListItem Text="Bihar" Value="Bihar"></asp:ListItem>
                                        <asp:ListItem Text="Chhattisgarh" Value="Chhattisgarh"></asp:ListItem>
                                        <asp:ListItem Text="Goa" Value="Goa"></asp:ListItem>
                                        <asp:ListItem Text="Gujarat" Value="Gujarat"></asp:ListItem>
                                        <asp:ListItem Text="Haryana" Value="Haryana"></asp:ListItem>
                                        <asp:ListItem Text="Himachal Pradesh" Value="Himachal Pradesh"></asp:ListItem>
                                        <asp:ListItem Text="Jharkhand" Value="Jharkhand"></asp:ListItem>
                                        <asp:ListItem Text="Karnataka" Value="Karnataka"></asp:ListItem>
                                        <asp:ListItem Text="Kerala" Value="Kerala"></asp:ListItem>
                                        <asp:ListItem Text="Madhya Pradesh" Value="Madhya Pradesh"></asp:ListItem>
                                        <asp:ListItem Text="Maharashtra" Value="Maharashtra"></asp:ListItem>
                                        <asp:ListItem Text="Manipur" Value="Manipur"></asp:ListItem>
                                        <asp:ListItem Text="Meghalaya" Value="Meghalaya"></asp:ListItem>
                                        <asp:ListItem Text="Mizoram" Value="Mizoram"></asp:ListItem>
                                        <asp:ListItem Text="Nagaland" Value="Nagaland"></asp:ListItem>
                                        <asp:ListItem Text="Odisha" Value="Odisha"></asp:ListItem>
                                        <asp:ListItem Text="Punjab" Value="Punjab"></asp:ListItem>
                                        <asp:ListItem Text="Rajasthan" Value="Rajasthan"></asp:ListItem>
                                        <asp:ListItem Text="Sikkim" Value="Sikkim"></asp:ListItem>
                                        <asp:ListItem Text="Tamil Nadu" Value="Tamil Nadu"></asp:ListItem>
                                        <asp:ListItem Text="Telangana" Value="Telangana"></asp:ListItem>
                                        <asp:ListItem Text="Tripura" Value="Tripura"></asp:ListItem>
                                        <asp:ListItem Text="Uttar Pradesh" Value="Uttar Pradesh"></asp:ListItem>
                                        <asp:ListItem Text="Uttarakhand" Value="Uttarakhand"></asp:ListItem>
                                        <asp:ListItem Text="West Bengal" Value="West Bengal"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>City</label>
                                <div class="form-group">
                                    <asp:TextBox Class="form-control" ID="TextBox5" runat="server"
                                        placeholder="City"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Pin Code</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox6" runat="server"
                                        placeholder="Pin Code" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <label>Address</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox7" runat="server"
                                        placeholder="Full Address" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <div class="row justify-content-center">
                            <div class="col-auto">
                                <span class="badge bg-info">Credentials</span>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-4">
                                <label>User ID</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox8" runat="server"
                                        placeholder="User ID"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Current Password</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox9" runat="server"
                                        placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Update Password</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox10" runat="server"
                                        placeholder="New Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-8 mx-auto">
                                <center>
                                    <div class="form-group">
                                        <asp:Button class="btn btn-primary btn-block" ID="Button1" runat="server" Text="Update" />
                                    </div>
                                </center>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="homepage.aspx"><< Back to Home</a>
            </div>


            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150px" src="imgs/books.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Issued Books</h4>
                                    <asp:Label class="badge bg-success" ID="Label2" runat="server" Text="Your books info"></asp:Label>

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
                                <asp:GridView class="table table-striped table-bordered" 
                                    ID="GridView1" runat="server"></asp:GridView>
                            </div>
                        </div>

                    </div>
                </div>
                <br />
            </div>
        </div>
    </div>
</asp:Content>