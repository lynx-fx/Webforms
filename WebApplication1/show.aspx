<%@ Page Title="Shows Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="show.aspx.cs" Inherits="WebApplication1.show" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="d-flex align-items-center mb-4 border-bottom pb-2">
            <h2 class="text-dark m-0"><i class="bi bi-camera-reels me-2"></i> Show Scheduling</h2>
        </div>

        <div class="card shadow-sm border">
            <div class="card-body">
                <p class="text-secondary mb-4 small">Configure cinema showtimes and scheduling across all available
                    halls. Manage movie IDs and pricing tiers below.</p>

                <div class="table-responsive">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cw %>"
                        ProviderName="<%$ ConnectionStrings:cw.ProviderName %>"
                        SelectCommand="SELECT * FROM &quot;SHOW&quot;"
                        DeleteCommand="DELETE FROM &quot;SHOW&quot; WHERE &quot;SHOW_ID&quot; = :SHOW_ID"
                        InsertCommand="INSERT INTO &quot;SHOW&quot; (&quot;SHOW_ID&quot;, &quot;SHOW_TIME&quot;, &quot;SHOW_DATE&quot;, &quot;MOVIE_ID&quot;, &quot;HALL_ID&quot;, &quot;PRICE_ID&quot;) VALUES (:SHOW_ID, :SHOW_TIME, :SHOW_DATE, :MOVIE_ID, :HALL_ID, :PRICE_ID)"
                        UpdateCommand="UPDATE &quot;SHOW&quot; SET &quot;SHOW_TIME&quot; = :SHOW_TIME, &quot;SHOW_DATE&quot; = :SHOW_DATE, &quot;MOVIE_ID&quot; = :MOVIE_ID, &quot;HALL_ID&quot; = :HALL_ID, &quot;PRICE_ID&quot; = :PRICE_ID WHERE &quot;SHOW_ID&quot; = :SHOW_ID">
                        <DeleteParameters>
                            <asp:Parameter Name="SHOW_ID" Type="Decimal" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="SHOW_ID" Type="Decimal" />
                            <asp:Parameter Name="SHOW_TIME" Type="DateTime" />
                            <asp:Parameter Name="SHOW_DATE" Type="DateTime" />
                            <asp:Parameter Name="MOVIE_ID" Type="Decimal" />
                            <asp:Parameter Name="HALL_ID" Type="Decimal" />
                            <asp:Parameter Name="PRICE_ID" Type="Decimal" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="SHOW_TIME" Type="DateTime" />
                            <asp:Parameter Name="SHOW_DATE" Type="DateTime" />
                            <asp:Parameter Name="MOVIE_ID" Type="Decimal" />
                            <asp:Parameter Name="HALL_ID" Type="Decimal" />
                            <asp:Parameter Name="PRICE_ID" Type="Decimal" />
                            <asp:Parameter Name="SHOW_ID" Type="Decimal" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SHOW_ID"
                        DataSourceID="SqlDataSource1" AllowPaging="True"
                        CssClass="table table-hover table-bordered align-middle" GridLines="None" PageSize="10">
                        <Columns>
                            <asp:BoundField DataField="SHOW_ID" HeaderText="ID" ReadOnly="True"
                                SortExpression="SHOW_ID">
                                <HeaderStyle CssClass="bg-light text-dark fw-bold small" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SHOW_TIME" HeaderText="Start Time" SortExpression="SHOW_TIME"
                                DataFormatString="{0:t}">
                                <HeaderStyle CssClass="bg-light text-dark fw-bold small" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SHOW_DATE" HeaderText="Date" SortExpression="SHOW_DATE"
                                DataFormatString="{0:d}">
                                <HeaderStyle CssClass="bg-light text-dark fw-bold small" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MOVIE_ID" HeaderText="Movie Ref" SortExpression="MOVIE_ID">
                                <HeaderStyle CssClass="bg-light text-dark fw-bold small" />
                            </asp:BoundField>
                            <asp:BoundField DataField="HALL_ID" HeaderText="Hall #" SortExpression="HALL_ID">
                                <HeaderStyle CssClass="bg-light text-dark fw-bold small" />
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
                                No scheduling records currently available.
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
            }

            .btn-sm {
                font-size: 0.82rem;
            }
        </style>
    </asp:Content>