<%@ Page Title="Movies Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="movies.aspx.cs" Inherits="WebApplication1.movies" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="d-flex align-items-center mb-4 border-bottom pb-2">
            <h2 class="text-dark m-0"><i class="bi bi-film me-2"></i> Movie Inventory</h2>
        </div>

        <div class="card shadow-sm border">
            <div class="card-body">
                <p class="text-secondary mb-4 small">Catalogue and manage the cinema movie database. Define titles,
                    duration, and classification details below.</p>

                <div class="table-responsive">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cw %>"
                        ProviderName="<%$ ConnectionStrings:cw.ProviderName %>"
                        SelectCommand="SELECT * FROM &quot;MOVIE&quot;"
                        DeleteCommand="DELETE FROM &quot;MOVIE&quot; WHERE &quot;MOVIE_ID&quot; = :MOVIE_ID"
                        InsertCommand="INSERT INTO &quot;MOVIE&quot; (&quot;MOVIE_ID&quot;, &quot;MOVIE_TITLE&quot;, &quot;MOVIE_DURATION&quot;, &quot;MOVIE_LANGUAGE&quot;, &quot;MOVIE_GENRE&quot;) VALUES (:MOVIE_ID, :MOVIE_TITLE, :MOVIE_DURATION, :MOVIE_LANGUAGE, :MOVIE_GENRE)"
                        UpdateCommand="UPDATE &quot;MOVIE&quot; SET &quot;MOVIE_TITLE&quot; = :MOVIE_TITLE, &quot;MOVIE_DURATION&quot; = :MOVIE_DURATION, &quot;MOVIE_LANGUAGE&quot; = :MOVIE_LANGUAGE, &quot;MOVIE_GENRE&quot; = :MOVIE_GENRE WHERE &quot;MOVIE_ID&quot; = :MOVIE_ID">
                        <DeleteParameters>
                            <asp:Parameter Name="MOVIE_ID" Type="Decimal" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="MOVIE_ID" Type="Decimal" />
                            <asp:Parameter Name="MOVIE_TITLE" Type="String" />
                            <asp:Parameter Name="MOVIE_DURATION" Type="Decimal" />
                            <asp:Parameter Name="MOVIE_LANGUAGE" Type="String" />
                            <asp:Parameter Name="MOVIE_GENRE" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="MOVIE_TITLE" Type="String" />
                            <asp:Parameter Name="MOVIE_DURATION" Type="Decimal" />
                            <asp:Parameter Name="MOVIE_LANGUAGE" Type="String" />
                            <asp:Parameter Name="MOVIE_GENRE" Type="String" />
                            <asp:Parameter Name="MOVIE_ID" Type="Decimal" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MOVIE_ID"
                        DataSourceID="SqlDataSource1" AllowPaging="True"
                        CssClass="table table-hover table-bordered align-middle" GridLines="None" PageSize="10">
                        <Columns>
                            <asp:BoundField DataField="MOVIE_ID" HeaderText="Ref #" ReadOnly="True"
                                SortExpression="MOVIE_ID">
                                <HeaderStyle CssClass="bg-light text-dark fw-bold small" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MOVIE_TITLE" HeaderText="Movie Title"
                                SortExpression="MOVIE_TITLE">
                                <HeaderStyle CssClass="bg-light text-dark fw-bold small" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MOVIE_DURATION" HeaderText="Length (min)"
                                SortExpression="MOVIE_DURATION">
                                <HeaderStyle CssClass="bg-light text-dark fw-bold small" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MOVIE_LANGUAGE" HeaderText="Language"
                                SortExpression="MOVIE_LANGUAGE">
                                <HeaderStyle CssClass="bg-light text-dark fw-bold small" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MOVIE_GENRE" HeaderText="Genre" SortExpression="MOVIE_GENRE">
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
                                No movie records available.
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>

                <asp:SqlDataSource ID="Booking" runat="server" ConnectionString="<%$ ConnectionStrings:cw %>"
                    ProviderName="<%$ ConnectionStrings:cw.ProviderName %>"
                    SelectCommand="SELECT * FROM &quot;BOOKING&quot;"
                    DeleteCommand="DELETE FROM &quot;BOOKING&quot; WHERE &quot;BOOKING_ID&quot; = :BOOKING_ID"
                    InsertCommand="INSERT INTO &quot;BOOKING&quot; (&quot;BOOKING_ID&quot;, &quot;MOVIE_ID&quot;, &quot;BOOKING_DATE&quot;, &quot;BOOKING_TYPE&quot;, &quot;USER_ID&quot;, &quot;SHOW_ID&quot;) VALUES (:BOOKING_ID, :MOVIE_ID, :BOOKING_DATE, :BOOKING_TYPE, :USER_ID, :SHOW_ID)"
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