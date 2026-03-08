<%@ Page Title="User Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="movieHall.aspx.cs" Inherits="WebApplication1.MovieHall" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="d-flex align-items-center mb-4 border-bottom pb-2">
            <h2 class="text-dark m-0"><i class="bi bi-people me-2"></i> User's Ticket Directory</h2>
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
                        SelectCommand="SELECT u.USER_ID, u.USER_NAME, u.USER_ADDRESS, b.BOOKING_ID, b.MOVIE_ID, b.BOOKING_DATE, b.BOOKING_TYPE, b.SHOW_ID FROM USERS u, BOOKING b WHERE b.USER_ID = u.USER_ID AND b.booking_date &gt;= ADD_MONTHS(SYSDATE, -6)"
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

                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2"
                        DataTextField="USER_NAME" DataValueField="USER_ID" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cw %>"
                        ProviderName="<%$ ConnectionStrings:cw.ProviderName %>"
                        SelectCommand="SELECT u.USER_ID, u.USER_NAME, u.USER_ADDRESS, b.BOOKING_ID FROM USERS u, BOOKING b WHERE b.USER_ID = u.USER_ID AND b.booking_date &gt;= ADD_MONTHS(SYSDATE, -6)">
                    </asp:SqlDataSource>

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="USER_ID,BOOKING_ID" DataSourceID="SqlDataSource1" AllowPaging="True"
                        CssClass="table table-hover table-bordered align-middle" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="USER_ID" HeaderText="USER_ID" ReadOnly="True"
                                SortExpression="USER_ID">
                            </asp:BoundField>
                            <asp:BoundField DataField="USER_NAME" HeaderText="USER_NAME" SortExpression="USER_NAME">
                            </asp:BoundField>
                            <asp:BoundField DataField="USER_ADDRESS" HeaderText="USER_ADDRESS"
                                SortExpression="USER_ADDRESS">
                            </asp:BoundField>
                            <asp:BoundField DataField="BOOKING_ID" HeaderText="BOOKING_ID" ReadOnly="True"
                                SortExpression="BOOKING_ID" />
                            <asp:BoundField DataField="MOVIE_ID" HeaderText="MOVIE_ID" SortExpression="MOVIE_ID" />
                            <asp:BoundField DataField="BOOKING_DATE" HeaderText="BOOKING_DATE"
                                SortExpression="BOOKING_DATE" />
                            <asp:BoundField DataField="BOOKING_TYPE" HeaderText="BOOKING_TYPE"
                                SortExpression="BOOKING_TYPE" />
                            <asp:BoundField DataField="SHOW_ID" HeaderText="SHOW_ID" SortExpression="SHOW_ID" />
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