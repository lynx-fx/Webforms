<%@ Page Title="Tickets Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Ticket.aspx.cs" Inherits="WebApplication1.Ticket" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="d-flex align-items-center mb-4 border-bottom pb-2">
            <h2 class="text-dark m-0"><i class="bi bi-ticket-perforated me-2"></i> Ticket Management</h2>
        </div>

        <div class="row g-4 mb-4">
            <div class="col-12">
                <div class="card shadow-sm border">
                    <div class="card-header bg-light border-bottom py-3">
                        <h6 class="m-0 fw-bold text-dark uppercase-header">Active Tickets</h6>
                    </div>
                    <div class="card-body">
                        <p class="text-secondary mb-4 small">Review and manage issued movie tickets. Associate tickets
                            with valid booking IDs.</p>

                        <div class="table-responsive">
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                ConnectionString="<%$ ConnectionStrings:cw %>"
                                DeleteCommand="DELETE FROM &quot;TICKET&quot; WHERE &quot;TICKET_ID&quot; = :TICKET_ID"
                                InsertCommand="INSERT INTO &quot;TICKET&quot; (&quot;TICKET_ID&quot;, &quot;BOOKING_ID&quot;) VALUES (:TICKET_ID, :BOOKING_ID)"
                                ProviderName="<%$ ConnectionStrings:cw.ProviderName %>"
                                SelectCommand="SELECT * FROM &quot;TICKET&quot;"
                                UpdateCommand="UPDATE &quot;TICKET&quot; SET &quot;BOOKING_ID&quot; = :BOOKING_ID WHERE &quot;TICKET_ID&quot; = :TICKET_ID">
                                <DeleteParameters>
                                    <asp:Parameter Name="TICKET_ID" Type="Decimal" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="TICKET_ID" Type="Decimal" />
                                    <asp:Parameter Name="BOOKING_ID" Type="Decimal" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="BOOKING_ID" Type="Decimal" />
                                    <asp:Parameter Name="TICKET_ID" Type="Decimal" />
                                </UpdateParameters>
                            </asp:SqlDataSource>

                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                                DataKeyNames="TICKET_ID" DataSourceID="SqlDataSource2" AllowPaging="True"
                                CssClass="table table-hover table-bordered align-middle" GridLines="None" PageSize="10">
                                <Columns>
                                    <asp:BoundField DataField="TICKET_ID" HeaderText="Ticket Ref #" ReadOnly="True"
                                        SortExpression="TICKET_ID">
                                        <HeaderStyle CssClass="bg-light text-dark fw-bold small" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="BOOKING_ID" HeaderText="Associated Booking"
                                        SortExpression="BOOKING_ID">
                                        <HeaderStyle CssClass="bg-light text-dark fw-bold small" />
                                    </asp:BoundField>
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"
                                        ControlStyle-CssClass="btn btn-sm btn-outline-dark me-1" ButtonType="Button">
                                        <HeaderStyle CssClass="bg-light text-dark text-center small" Width="180px" />
                                        <ItemStyle CssClass="text-center" />
                                    </asp:CommandField>
                                </Columns>
                                <PagerStyle CssClass="pagination-neutral" HorizontalAlign="Center" />
                                <EmptyDataTemplate>
                                    <div class="alert alert-secondary text-center mt-3" role="alert">
                                        No active ticket records found.
                                    </div>
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12">
                <div class="card shadow-sm border">
                    <div class="card-header bg-light border-bottom py-3">
                        <h6 class="m-0 fw-bold text-dark uppercase-header">Internal Bookings Log</h6>
                    </div>
                    <div class="card-body">
                        <p class="text-secondary mb-4 small">Reference log for existing bookings. Ensure all tickets
                            correspond to a valid log entry.</p>

                        <div class="table-responsive">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:cw %>"
                                DeleteCommand="DELETE FROM &quot;BOOKING&quot; WHERE &quot;BOOKING_ID&quot; = :BOOKING_ID"
                                InsertCommand="INSERT INTO &quot;BOOKING&quot; (&quot;BOOKING_ID&quot;, &quot;MOVIE_ID&quot;, &quot;BOOKING_DATE&quot;, &quot;BOOKING_TYPE&quot;, &quot;USER_ID&quot;, &quot;SHOW_ID&quot;) VALUES (:BOOKING_ID, :MOVIE_ID, :BOOKING_DATE, :BOOKING_TYPE, :USER_ID, :SHOW_ID)"
                                ProviderName="<%$ ConnectionStrings:cw.ProviderName %>"
                                SelectCommand="SELECT * FROM &quot;BOOKING&quot;"
                                UpdateCommand="UPDATE &quot;BOOKING&quot; SET &quot;MOVIE_ID&quot; = :MOVIE_ID, &quot;BOOKING_DATE&quot; = :BOOKING_DATE, &quot;BOOKING_TYPE&quot; = :BOOKING_TYPE, &quot;USER_ID&quot; = :USER_ID, &quot;SHOW_ID&quot; = :SHOW_ID WHERE &quot;BOOKING_ID&quot; = :BOOKING_ID">
                                <DeleteParameters>
                                    <asp:Parameter Name="BOOKING_ID" Type="Decimal" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="BOOKING_ID" Type="Decimal" />
                                    <asp:Parameter Name="MOVIE_ID" Type="Decimal" />
                                    <asp:Parameter Name="BOOKING_DATE" Type="DateTime" />
                                    <asp:Parameter Name="BOOKING_TYPE" Type="String" />
                                    <asp:Parameter Name="USER_ID" Type="Decimal" />
                                    <asp:Parameter Name="SHOW_ID" Type="Decimal" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="MOVIE_ID" Type="Decimal" />
                                    <asp:Parameter Name="BOOKING_DATE" Type="DateTime" />
                                    <asp:Parameter Name="BOOKING_TYPE" Type="String" />
                                    <asp:Parameter Name="USER_ID" Type="Decimal" />
                                    <asp:Parameter Name="SHOW_ID" Type="Decimal" />
                                    <asp:Parameter Name="BOOKING_ID" Type="Decimal" />
                                </UpdateParameters>
                            </asp:SqlDataSource>

                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"
                                DataKeyNames="BOOKING_ID" DataSourceID="SqlDataSource1" AllowPaging="True"
                                CssClass="table table-hover table-bordered align-middle" GridLines="None" PageSize="5">
                                <Columns>
                                    <asp:BoundField DataField="BOOKING_ID" HeaderText="Booking Ref" ReadOnly="True"
                                        SortExpression="BOOKING_ID">
                                        <HeaderStyle CssClass="bg-light text-dark fw-bold small" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="MOVIE_ID" HeaderText="Movie ID"
                                        SortExpression="MOVIE_ID">
                                        <HeaderStyle CssClass="bg-light text-dark fw-bold small" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="BOOKING_DATE" HeaderText="Booking Date"
                                        SortExpression="BOOKING_DATE" DataFormatString="{0:d}">
                                        <HeaderStyle CssClass="bg-light text-dark fw-bold small" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="BOOKING_TYPE" HeaderText="Class/Type"
                                        SortExpression="BOOKING_TYPE">
                                        <HeaderStyle CssClass="bg-light text-dark fw-bold small" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="USER_ID" HeaderText="User Ref" SortExpression="USER_ID">
                                        <HeaderStyle CssClass="bg-light text-dark fw-bold small" />
                                    </asp:BoundField>
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"
                                        ControlStyle-CssClass="btn btn-sm btn-outline-dark me-1" ButtonType="Button">
                                        <HeaderStyle CssClass="bg-light text-dark text-center small" Width="180px" />
                                        <ItemStyle CssClass="text-center" />
                                    </asp:CommandField>
                                </Columns>
                                <PagerStyle CssClass="pagination-neutral" HorizontalAlign="Center" />
                                <EmptyDataTemplate>
                                    <div class="alert alert-secondary text-center mt-3" role="alert">
                                        No internal booking logs available.
                                    </div>
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <style>
            .uppercase-header {
                text-transform: uppercase;
                letter-spacing: 1px;
                font-size: 0.8rem;
            }

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
            }

            .btn-sm {
                font-size: 0.82rem;
            }
        </style>
    </asp:Content>