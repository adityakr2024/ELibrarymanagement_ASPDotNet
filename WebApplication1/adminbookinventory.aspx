<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookinventory.aspx.cs" Inherits="WebApplication1.adminbookinventory" %>

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
    <script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>


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
                                    <h4>Book Details</h4>

                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img id="imgview" height="150" width="100" src="book_inventory/books.png" />
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
                                <asp:FileUpload onchange="readURL(this);" CssClass="form-control" ID="FileUpload1" runat="server" />
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-4">
                                <label>Book ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox class="form-control" ID="txtBoxBookId" runat="server"
                                            placeholder="Book ID"></asp:TextBox>
                                        <asp:Button CssClass="btn btn-primary" ID="btnGo" runat="server" Text="Go" OnClick="btnGo_Click" />
                                    </div>

                                </div>
                            </div>
                            <div class="col-md-8">
                                <label>Book Name</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txtBoxBookName" runat="server"
                                        placeholder="Book Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Language</label>
                                <div class="form-group">
                                    <asp:DropDownList CssClass="form-control" ID="ddlLanguage" runat="server">
                                        <asp:ListItem Text="English" Value="English" />
                                        <asp:ListItem Text="Hindi" Value="Hindi" />
                                        <asp:ListItem Text="Marathi" Value="Marathi" />
                                        <asp:ListItem Text="French" Value="French" />
                                        <asp:ListItem Text="German" Value="German" />
                                        <asp:ListItem Text="Urdu" Value="Urdu" />
                                    </asp:DropDownList>
                                </div>
                                <label>Publisher Name</label>
                                <div class="form-group">
                                    <asp:DropDownList CssClass="form-control" ID="ddlPublisherName" runat="server">
                                        <asp:ListItem Text="Publisher 1" Value="Publisher 1" />
                                        <asp:ListItem Text="Publisher 2" Value="Publisher 2" />
                                        <asp:ListItem Text="Publisher 3" Value="Publisher 3" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Author Name</label>
                                <div class="form-group">
                                    <asp:DropDownList CssClass="form-control" ID="ddlAuthorName" runat="server">
                                        <asp:ListItem Text="Author 1" Value="Author 1" />
                                        <asp:ListItem Text="Author 2" Value="Author 2" />
                                        <asp:ListItem Text="Author 3" Value="Author 3" />
                                    </asp:DropDownList>
                                </div>
                                <label>Publish Date</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtBoxPublishDate" runat="server" Placeholder="Date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Genre</label>
                                <div class="form-group">
                                    <asp:ListBox CssClass="form-control" ID="lstBoxGenre" runat="server" SelectionMode="Multiple" Rows="5">
                                        <asp:ListItem Text="Fiction" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Non-Fiction" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Science Fiction" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Fantasy" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="Mystery" Value="5"></asp:ListItem>
                                        <asp:ListItem Text="Romance" Value="6"></asp:ListItem>
                                        <asp:ListItem Text="Thriller" Value="7"></asp:ListItem>
                                        <asp:ListItem Text="Biography" Value="8"></asp:ListItem>
                                        <asp:ListItem Text="History" Value="9"></asp:ListItem>
                                        <asp:ListItem Text="Poetry" Value="10"></asp:ListItem>
                                        <asp:ListItem Text="Horror" Value="11"></asp:ListItem>
                                        <asp:ListItem Text="Self-Help" Value="12"></asp:ListItem>
                                        <asp:ListItem Text="Adventure" Value="13"></asp:ListItem>
                                        <asp:ListItem Text="Young Adult" Value="14"></asp:ListItem>
                                        <asp:ListItem Text="Graphic Novel" Value="15"></asp:ListItem>
                                        <asp:ListItem Text="Children's" Value="16"></asp:ListItem>
                                        <asp:ListItem Text="Classics" Value="17"></asp:ListItem>
                                        <asp:ListItem Text="Philosophy" Value="18"></asp:ListItem>
                                        <asp:ListItem Text="Religion" Value="19"></asp:ListItem>
                                        <asp:ListItem Text="Psychology" Value="20"></asp:ListItem>
                                        <asp:ListItem Text="Health" Value="21"></asp:ListItem>
                                        <asp:ListItem Text="Cookbook" Value="22"></asp:ListItem>
                                        <asp:ListItem Text="Travel" Value="23"></asp:ListItem>
                                        <asp:ListItem Text="Science" Value="24"></asp:ListItem>
                                        <asp:ListItem Text="Memoir" Value="25"></asp:ListItem>
                                        <asp:ListItem Text="Autobiography" Value="26"></asp:ListItem>
                                        <asp:ListItem Text="Business" Value="27"></asp:ListItem>
                                        <asp:ListItem Text="Politics" Value="28"></asp:ListItem>
                                        <asp:ListItem Text="Art" Value="29"></asp:ListItem>
                                        <asp:ListItem Text="Music" Value="30"></asp:ListItem>
                                    </asp:ListBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Edition</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txtBoxEdition" runat="server"
                                        placeholder="Edtion"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Book Cost(per unit)</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txtBoxBookCost" runat="server" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Pages</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txtBoxPages" runat="server" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Actual Stock</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txtBoxActualStock" runat="server"
                                        placeholder="Actual Stock"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Current Stock</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txtBoxCurrentStock" runat="server"
                                        ReadOnly="true" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Issued Books</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txtBoxIssuedBooks" runat="server"
                                        ReadOnly="true" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>





                        <div class="row">
                            <div class="col-md-12">
                                <label>Book Description</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txtBoxBookDescription" runat="server"
                                        placeholder="Book Description" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="btnAdd" class="btn btn-block btn-success" runat="server"
                                    Text="Add" OnClick="btnAdd_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="btnUpdate" class="btn btn-block btn-warning" runat="server"
                                    Text="Update" OnClick="btnUpdate_Click" />
                            </div>
                            <div class="col-4" style="height: 31px">
                                <asp:Button ID="btnDelete" class="btn btn-block btn-danger" runat="server"
                                    Text="Delete" OnClick="btnDelete_Click" />
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
                                    <h4>Book Inventory List</h4>

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
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT * FROM [book_master_tbl]"></asp:SqlDataSource>
                                <asp:GridView class="table table-striped table-bordered"
                                    ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="book_id" HeaderText="ID" ReadOnly="True" SortExpression="book_id" />
                                        <%--<asp:BoundField DataField="book_name" HeaderText="book_name" SortExpression="book_name" />
                                        <asp:BoundField DataField="genre" HeaderText="genre" SortExpression="genre" />
                                        <asp:BoundField DataField="author_name" HeaderText="author_name" SortExpression="author_name" />
                                        <asp:BoundField DataField="publisher_name" HeaderText="publisher_name" SortExpression="publisher_name" />
                                        <asp:BoundField DataField="publish_date" HeaderText="publish_date" SortExpression="publish_date" />
                                        <asp:BoundField DataField="language" HeaderText="language" SortExpression="language" />
                                        <asp:BoundField DataField="edition" HeaderText="edition" SortExpression="edition" />
                                        <asp:BoundField DataField="book_cost" HeaderText="book_cost" SortExpression="book_cost" />
                                        <asp:BoundField DataField="no_of_pages" HeaderText="no_of_pages" SortExpression="no_of_pages" />
                                        <asp:BoundField DataField="book_description" HeaderText="book_description" SortExpression="book_description" />
                                        <asp:BoundField DataField="actual_stock" HeaderText="actual_stock" SortExpression="actual_stock" />
                                        <asp:BoundField DataField="current_stock" HeaderText="current_stock" SortExpression="current_stock" />
                                        <asp:BoundField DataField="book_img_link" HeaderText="book_img_link" SortExpression="book_img_link" />--%>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <div class="col-lg-10">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <asp:Label ID="lblBookName" runat="server"
                                                                        Text='<%# Eval("book_name") %>' Font-Size="Large"
                                                                        Font-Bold="True"></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12" style="font-weight: normal">
                                                                    Author-
                                                                    <asp:Label ID="lblAuthorName" Font-Bold="true" runat="server" Text='<%# Eval("author_name") %>'></asp:Label>
                                                                    | 
                                                                    Genre - 
                                                                    <asp:Label ID="lblGenre" Font-Bold="true" runat="server" Text='<%# Eval("genre") %>'></asp:Label>
                                                                    | 
                                                                    Language - 
                                                                    <asp:Label ID="lblLanguage" Font-Bold="true" runat="server" Text='<%# Eval("language") %>'></asp:Label>

                                                                </div>
                                                            </div>
                                                            <br />
                                                            <div class="row">
                                                                <div class="col-12" style="font-weight: normal">
                                                                    Publisher -
                                                                    <asp:Label ID="lblPublisher" Font-Bold="true" runat="server" Text='<%# Eval("publisher_name") %>'></asp:Label>
                                                                    |
                                                                    Publish Date -
                                                                    <asp:Label ID="lblPublishDate" Font-Bold="true" runat="server" Text='<%# Eval("publish_date") %>'></asp:Label>
                                                                    |
                                                                    Pages - 
                                                                    <asp:Label ID="lblPages" Font-Bold="true" runat="server" Text='<%# Eval("no_of_pages") %>'></asp:Label>
                                                                    |
                                                                    Edition - 
                                                                    <asp:Label ID="lblEdition" Font-Bold="true" runat="server" Text='<%# Eval("edition") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                            <br />
                                                            <div class="row">
                                                                <div class="col-12" style="font-weight: normal">
                                                                    Cost -
                                                                    <asp:Label ID="lblCost" Font-Bold="true" runat="server" Text='<%# Eval("book_cost") %>'></asp:Label>
                                                                    |
                                                                    Actual Stock -
                                                                    <asp:Label ID="lblActualStock" Font-Bold="true" runat="server" Text='<%# Eval("actual_stock") %>'></asp:Label>
                                                                    |
                                                                    Available - 
                                                                    <asp:Label ID="lblAvailable" Font-Bold="true" runat="server" Text='<%# Eval("current_stock") %>'></asp:Label>
                                                                    |
                                                                </div>
                                                            </div>
                                                            <br />
                                                            <div class="row">
                                                                <div class="col-12" style="font-weight: normal">
                                                                    Description -
                                                                    <asp:Label ID="lblDescription" Font-Bold="true" runat="server" Text='<%# Eval("book_description") %>'></asp:Label>
                                                                    
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-2">
                                                            <asp:Image CssClass="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("book_img_link") %>' />
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
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
