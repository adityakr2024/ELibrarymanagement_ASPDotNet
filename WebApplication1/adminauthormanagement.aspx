<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminauthormanagement.aspx.cs" Inherits="WebApplication1.adminauthormanagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            try {
                $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            } catch (error) {
                console.error("Error initializing DataTable: ", error);
            }
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container">
        <div class="row">

            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Author Details</h4>

                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100" src="imgs/author-profile.png" />
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
                            <div class="col-md-4">
                                <label>Author ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox class="form-control" ID="txtBoxAuthorId" runat="server"
                                            placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-info " ID="btnGoAuthorId" runat="server" Text="GO" OnClick="btnGoAuthorId_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <label>Author Name</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txtBoxAuthorName" runat="server"
                                        placeholder="Author Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="btnAddAuthor" class="btn btn-block btn-primary" runat="server" Text="Add" OnClick="btnAddAuthor_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="btnUpdateAuthor" class="btn btn-block btn-success" runat="server" Text="Update" OnClick="btnUpdateAuthor_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="btnDeleteAuthor" class="btn btn-block btn-danger" runat="server" Text="Delete" OnClick="btnDeleteAuthor_Click" />
                            </div>
                        </div>

                    </div>
                </div>
                <br />
            </div>


            <div class="col-md-7">

                <div class="card">
                    <div class="card-body">
                       
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Author List</h4>
                                    
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                    <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT * FROM [author_master_tbl]"></asp:SqlDataSource>
                                <asp:GridView class="table table-striped table-bordered" 
                                    ID="GridViewAuthors" runat="server" AutoGenerateColumns="False" DataKeyNames="author_id" DataSourceID="SqlDataSource1" >
                                    <Columns>
                                        <asp:BoundField DataField="author_id" HeaderText="author_id" ReadOnly="True" SortExpression="author_id" />
                                        <asp:BoundField DataField="author_name" HeaderText="author_name" SortExpression="author_name" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>


                    </div>
                </div>
            </div>

        </div>
    </div>




</asp:Content>
