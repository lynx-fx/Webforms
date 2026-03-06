<%@ Page Title="User Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="User.aspx.cs" Inherits="WebApplication1.User" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="d-flex align-items-center mb-4 border-bottom pb-2">
            <h2 class="text-dark m-0"><i class="bi bi-people me-2"></i> User Directory</h2>
        </div>

        <div class="card shadow-sm border">
            <div class="card-body">
                <p class="text-secondary mb-4 small">Manage system users, staff, and account details. Use the table
                    controls to edit or remove entries.</p>

                <div class="table-responsive">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cw %>"
                        DeleteCommand="DELETE FROM &quot;USERS&quot; WHERE &quot;USER_ID&quot; = :USER_ID"
                        InsertCommand="INSERT INTO &quot;USERS&quot; (&quot;USER_ID&quot;, &quot;USER_NAME&quot;, &quot;USER_ADDRESS&quot;) VALUES (:USER_ID, :USER_NAME, :USER_ADDRESS)"
                        ProviderName="<%$ ConnectionStrings:cw.ProviderName %>"
                        SelectCommand="SELECT * FROM &quot;USERS&quot;"
                        UpdateCommand="UPDATE &quot;USERS&quot; SET &quot;USER_NAME&quot; = :USER_NAME, &quot;USER_ADDRESS&quot; = :USER_ADDRESS WHERE &quot;USER_ID&quot; = :USER_ID">
                        <DeleteParameters>
                            <asp:Parameter Name="USER_ID" Type="Decimal" />
                        </DeleteParameters>
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
                    </asp:SqlDataSource>

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USER_ID"
                        DataSourceID="SqlDataSource1" AllowPaging="True"
                        CssClass="table table-hover table-bordered align-middle" GridLines="None" PageSize="10">
                        <Columns>
                            <asp:BoundField DataField="USER_ID" HeaderText="ID" ReadOnly="True"
                                SortExpression="USER_ID">
                                <HeaderStyle CssClass="bg-light text-dark fw-bold" />
                            </asp:BoundField>
                            <asp:BoundField DataField="USER_NAME" HeaderText="User Name" SortExpression="USER_NAME">
                                <HeaderStyle CssClass="bg-light text-dark fw-bold" />
                            </asp:BoundField>
                            <asp:BoundField DataField="USER_ADDRESS" HeaderText="Location / Address"
                                SortExpression="USER_ADDRESS">
                                <HeaderStyle CssClass="bg-light text-dark fw-bold" />
                            </asp:BoundField>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"
                                ControlStyle-CssClass="btn btn-sm btn-outline-dark me-1" ButtonType="Button">
                                <HeaderStyle CssClass="bg-light text-dark text-center" Width="180px" />
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
            .pagination-neutral {
                display: inline-block;
                padding-left: 0;
                margin: 20px 0;
            }

            .pagination-neutral table>tbody>tr>td {
                display: inline;
            }

            .pagination-neutral table>tbody>tr>td>a,
            .pagination-neutral table>tbody>tr>td>span {
                position: relative;
                float: left;
                padding: 8px 14px;
                margin-left: -1px;
                line-height: 1.5;
                color: #212529;
                text-decoration: none;
                background-color: #fff;
                border: 1px solid #dee2e6;
                font-size: 0.9rem;
            }

            .pagination-neutral table>tbody>tr>td>span {
                z-index: 3;
                color: #fff;
                background-color: #212529;
                border-color: #212529;
                cursor: default;
            }

            .pagination-neutral table>tbody>tr>td>a:hover {
                color: #000;
                background-color: #f8f9fa;
                border-color: #dee2e6;
            }

            .table thead th {
                border-top: 0;
                border-bottom: 2px solid #dee2e6;
                font-size: 0.9rem;
                letter-spacing: 0.5px;
            }

            .btn-sm {
                font-size: 0.8rem;
                padding: 0.25rem 0.6rem;
            }
        </style>
    </asp:Content>