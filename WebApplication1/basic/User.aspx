<%@ Page Title="User Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="User.aspx.cs" Inherits="WebApplication1.UserPage" %>
    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="d-flex align-items-center mb-4 border-bottom pb-2">
            <h2 class="text-dark m-0"><i class="bi bi-people me-2"></i> User Directory
            </h2>
        </div>

        <div class="card shadow-sm border">
            <div class="card-body">
                <div class="mb-4">
                    <h5 class="text-dark fw-bold mb-1">Manage Users</h5>
                    <p class="text-secondary small">Add, edit or remove system users and account details.</p>
                </div>

                <!-- Feedback Message -->
                <asp:Panel ID="MessagePanel" runat="server" Visible="false"
                    CssClass="alert alert-dismissible fade show mb-4" role="alert">
                    <asp:Label ID="MessageLabel" runat="server" Text=""></asp:Label>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </asp:Panel>


                <!-- Add New User Form -->
                <div class="bg-light p-4 rounded-3 border mb-5">
                    <h6 class="text-uppercase fw-bold text-muted mb-4 small"><i class="bi bi-plus-circle me-1"></i>
                        Register New User</h6>
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="USER_ID" DataSourceID="SqlDataSource1"
                        DefaultMode="Insert" Width="100%">
                        <InsertItemTemplate>
                            <div class="row g-3">
                                <div class="col-md-3">
                                    <label class="form-label small fw-bold text-secondary">User ID</label>
                                    <asp:TextBox ID="USER_IDTextBox" runat="server" Text='<%# Bind("USER_ID") %>'
                                        CssClass="form-control form-control-sm" placeholder="e.g. 101" />
                                    <asp:RequiredFieldValidator ID="rfvID" runat="server"
                                        ControlToValidate="USER_IDTextBox" ErrorMessage="ID is required"
                                        Display="Dynamic" CssClass="text-danger smaller" />
                                    <asp:CompareValidator ID="cvID" runat="server" ControlToValidate="USER_IDTextBox"
                                        Operator="DataTypeCheck" Type="Integer" ErrorMessage="Must be numeric"
                                        Display="Dynamic" CssClass="text-danger smaller" />
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label small fw-bold text-secondary">Full Name</label>
                                    <asp:TextBox ID="USER_NAMETextBox" runat="server" Text='<%# Bind("USER_NAME") %>'
                                        CssClass="form-control form-control-sm" placeholder="Enter name" />
                                    <asp:RequiredFieldValidator ID="rfvName" runat="server"
                                        ControlToValidate="USER_NAMETextBox" ErrorMessage="Name is required"
                                        Display="Dynamic" CssClass="text-danger smaller" />
                                </div>
                                <div class="col-md-5">
                                    <label class="form-label small fw-bold text-secondary">Address</label>
                                    <asp:TextBox ID="USER_ADDRESSTextBox" runat="server"
                                        Text='<%# Bind("USER_ADDRESS") %>' CssClass="form-control form-control-sm"
                                        placeholder="Enter location" />
                                </div>
                                <div class="col-12 mt-3 text-end text-md-start">
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True"
                                        CommandName="Insert" Text='<i class="bi bi-person-plus me-1"></i> Add User'
                                        CssClass="btn btn-dark btn-sm px-4" />
                                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                        CommandName="Cancel" Text="Clear"
                                        CssClass="btn btn-link btn-sm text-decoration-none text-secondary" />
                                </div>
                            </div>
                        </InsertItemTemplate>
                    </asp:FormView>
                </div>

                <!-- Users Directory Table -->
                <div class="table-responsive">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cw %>"
                        ProviderName="<%$ ConnectionStrings:cw.ProviderName %>"
                        SelectCommand="SELECT * FROM &quot;USERS&quot;"
                        InsertCommand="INSERT INTO &quot;USERS&quot; (&quot;USER_ID&quot;, &quot;USER_NAME&quot;, &quot;USER_ADDRESS&quot;) VALUES (:USER_ID, :USER_NAME, :USER_ADDRESS)"
                        UpdateCommand="UPDATE &quot;USERS&quot; SET &quot;USER_NAME&quot; = :USER_NAME, &quot;USER_ADDRESS&quot; = :USER_ADDRESS WHERE &quot;USER_ID&quot; = :USER_ID"
                        DeleteCommand="DELETE FROM &quot;USERS&quot; WHERE &quot;USER_ID&quot; = :USER_ID"
                        OnInserted="User_Inserted">

                        <InsertParameters>
                            <asp:Parameter Name="USER_ID" Type="Decimal" />
                            <asp:Parameter Name="USER_NAME" Type="String" />
                            <asp:Parameter Name="USER_ADDRESS" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="USER_NAME" Type="String" />
                            <asp:Parameter Name="USER_ADDRESS" Type="String" />
                            <asp:Parameter Name="USER_ID" Type="Decimal" />
                        </UpdateParameters>
                        <DeleteParameters>
                            <asp:Parameter Name="USER_ID" Type="Decimal" />
                        </DeleteParameters>
                    </asp:SqlDataSource>

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USER_ID"
                        DataSourceID="SqlDataSource1" AllowPaging="True"
                        CssClass="table table-hover border align-middle mt-2" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="USER_ID" HeaderText="ID" ReadOnly="True"
                                SortExpression="USER_ID">
                                <HeaderStyle CssClass="bg-light py-2" />
                            </asp:BoundField>
                            <asp:BoundField DataField="USER_NAME" HeaderText="Name" SortExpression="USER_NAME">
                                <HeaderStyle CssClass="bg-light py-2" />
                            </asp:BoundField>
                            <asp:BoundField DataField="USER_ADDRESS" HeaderText="Address" SortExpression="USER_ADDRESS">
                                <HeaderStyle CssClass="bg-light py-2" />
                            </asp:BoundField>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button"
                                ControlStyle-CssClass="btn btn-sm btn-outline-secondary" EditText="Edit"
                                DeleteText="Remove">
                                <HeaderStyle CssClass="bg-light py-2 text-center" />
                                <ItemStyle CssClass="text-center" />
                            </asp:CommandField>
                        </Columns>
                        <PagerStyle CssClass="pagination-neutral" HorizontalAlign="Center" />
                        <EmptyDataTemplate>
                            <div class="alert alert-secondary text-center mt-3" role="alert">
                                No user records currently available.
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>

        <style>
            .smaller {
                font-size: 0.75rem;
            }

            .pagination-neutral table>tbody>tr>td>a,
            .pagination-neutral table>tbody>tr>td>span {
                padding: 6px 12px;
                color: #212529;
                background-color: #fff;
                border: 1px solid #dee2e6;
                text-decoration: none;
            }

            .pagination-neutral table>tbody>tr>td>span {
                background-color: #212529;
                color: #fff;
            }
        </style>

    </asp:Content>