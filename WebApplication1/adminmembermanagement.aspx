<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminmembermanagement.aspx.cs" Inherits="WebApplication1.adminmembermanagement" %>

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


    <div class="container-fluid">
        <div class="row">

            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Member Details</h4>

                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100" src="imgs/user.png" />
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
                            <div class="col-md-3">
                                <label>Member ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox class="form-control" ID="txtBoxMemberId" runat="server"
                                            placeholder="Member ID"></asp:TextBox>
                                        <asp:Button CssClass="btn btn-primary" ID="btnGo" runat="server" Text="Go" OnClick="btnGo_Click" />
                                    </div>

                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txtBoxFullName" runat="server"
                                        placeholder="Full Name" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <label>Account Status</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox class="form-control" ID="txtBoxAccountStatus" runat="server"
                                            placeholder="Account Status" ReadOnly="true"></asp:TextBox>
                                        <asp:LinkButton CssClass="btn btn-success" ID="btnApprove" runat="server" Text="Approve" style="margin: 0 1px;" OnClick="btnApprove_Click">
                                            <i class="fa-solid fa-check-circle"></i> 
                                        </asp:LinkButton>
                                        <asp:LinkButton CssClass="btn btn-warning" ID="btnPending" runat="server" Text="Pending" style="margin-right: 1px;" OnClick="btnPending_Click">
                                            <i class="fa-solid fa-clock"></i> 
                                        </asp:LinkButton>
                                        <asp:LinkButton CssClass="btn btn-danger" ID="btnReject" runat="server" Text="Reject" OnClick="btnReject_Click" >
                                            <i class="fa-solid fa-times-circle"></i> 
                                        </asp:LinkButton>
                                    </div>

                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-3">
                                <label>DOB</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txtBoxDoB" runat="server"
                                        placeholder="DOB" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Contact No</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txtBoxContactNo" runat="server"
                                        placeholder="Contact No" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <label>Email ID</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txtBoxEmailId" runat="server"
                                        placeholder="Email ID" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>State</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txtBoxState" runat="server"
                                        placeholder="State" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>City</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txtBoxCity" runat="server"
                                        placeholder="City" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Pin Code</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txtBoxPinCde" runat="server"
                                        placeholder="Pin Code" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>





                        <div class="row">
                            <div class="col-md-12">
                                <label>Full Postal Address</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txtBoxFullAddresss" runat="server"
                                        placeholder="Full Address" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <asp:Button ID="btnDeletePermanently" class="btn btn-block btn-danger" runat="server"
                                    Text="Delete User Permanently" OnClick="btnDeletePermanently_Click" />
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
                                    <h4>Issued Book List</h4>

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
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT * FROM [member_master_tbl]"></asp:SqlDataSource>
                                <asp:GridView class="table table-striped table-bordered"
                                    ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="member_id" HeaderText="ID" ReadOnly="True" SortExpression="member_id" />
                                        <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                        <asp:BoundField DataField="account_status" HeaderText="Account Status" SortExpression="account_status" />
                                        <asp:BoundField DataField="contact_no" HeaderText="Contact No" SortExpression="contact_no" />
                                        <asp:BoundField DataField="email" HeaderText="Email ID" SortExpression="email" />
                                        <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                                        <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
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
