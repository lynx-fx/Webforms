<%@ Page Title="User Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="movieHall.aspx.cs" Inherits="WebApplication1.MovieHall" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="d-flex align-items-center mb-4 border-bottom pb-2">
            <h2 class="text-dark m-0"><i class="bi bi-building me-2"></i> Movie Hall & Show Directory</h2>
        </div>

        <div class="card shadow-sm border">
            <div class="card-body">
                <p class="text-secondary mb-4 small">Browse theaters, halls, and show schedules. Select a theater from
                    the dropdown to filter the results.</p>

                <div class="table-responsive">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cw %>"
                        ProviderName="<%$ ConnectionStrings:cw.ProviderName %>" SelectCommand="SELECT 
    th.THEATER_CITY_HALL_ID,
    th.THEATER_CITY_HALL_NAME,
    HALL.HALL_NAME,
    s.SHOW_ID,
    s.SHOW_TIME,
    s.SHOW_DATE,
    s.MOVIE_ID,
    s.HALL_ID AS EXPR3,
    s.PRICE_ID
FROM THEATER_CITY_HALL th
JOIN THEATER_CITY_HALL_HALL h 
    ON th.THEATER_CITY_HALL_ID = h.THEATER_CITY_HALL_ID
JOIN HALL 
    ON h.HALL_ID = HALL.HALL_ID
JOIN SHOW s 
    ON HALL.HALL_ID = s.HALL_ID
WHERE th.THEATER_CITY_HALL_ID = :THEATER_CITY_HALL_ID">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="THEATER_CITY_HALL_ID"
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2"
                        DataTextField="THEATER_CITY_HALL_NAME" DataValueField="THEATER_CITY_HALL_ID"
                        AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cw %>"
                        ProviderName="<%$ ConnectionStrings:cw.ProviderName %>"
                        SelectCommand="SELECT &quot;THEATER_CITY_HALL_NAME&quot;, &quot;THEATER_CITY_HALL_ID&quot; FROM &quot;THEATER_CITY_HALL&quot;"
                        DeleteCommand="DELETE FROM &quot;THEATER_CITY_HALL&quot; WHERE &quot;THEATER_CITY_HALL_ID&quot; = :THEATER_CITY_HALL_ID"
                        InsertCommand="INSERT INTO &quot;THEATER_CITY_HALL&quot; (&quot;THEATER_CITY_HALL_NAME&quot;, &quot;THEATER_CITY_HALL_ID&quot;) VALUES (:THEATER_CITY_HALL_NAME, :THEATER_CITY_HALL_ID)"
                        UpdateCommand="UPDATE &quot;THEATER_CITY_HALL&quot; SET &quot;THEATER_CITY_HALL_NAME&quot; = :THEATER_CITY_HALL_NAME WHERE &quot;THEATER_CITY_HALL_ID&quot; = :THEATER_CITY_HALL_ID">
                        <DeleteParameters>
                            <asp:Parameter Name="THEATER_CITY_HALL_ID" Type="Decimal" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="THEATER_CITY_HALL_NAME" Type="String" />
                            <asp:Parameter Name="THEATER_CITY_HALL_ID" Type="Decimal" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="THEATER_CITY_HALL_NAME" Type="String" />
                            <asp:Parameter Name="THEATER_CITY_HALL_ID" Type="Decimal" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="THEATER_CITY_HALL_ID,SHOW_ID" DataSourceID="SqlDataSource1" AllowPaging="True"
                        CssClass="table table-hover table-bordered align-middle" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="THEATER_CITY_HALL_ID" HeaderText="THEATER_CITY_HALL_ID"
                                ReadOnly="True" SortExpression="THEATER_CITY_HALL_ID">
                            </asp:BoundField>
                            <asp:BoundField DataField="THEATER_CITY_HALL_NAME" HeaderText="THEATER_CITY_HALL_NAME"
                                SortExpression="THEATER_CITY_HALL_NAME">
                            </asp:BoundField>
                            <asp:BoundField DataField="HALL_NAME" HeaderText="HALL_NAME" SortExpression="HALL_NAME">
                            </asp:BoundField>
                            <asp:BoundField DataField="SHOW_ID" HeaderText="SHOW_ID" SortExpression="SHOW_ID"
                                ReadOnly="True" />
                            <asp:BoundField DataField="SHOW_TIME" HeaderText="SHOW_TIME" SortExpression="SHOW_TIME" />
                            <asp:BoundField DataField="SHOW_DATE" HeaderText="SHOW_DATE" SortExpression="SHOW_DATE" />
                            <asp:BoundField DataField="MOVIE_ID" HeaderText="MOVIE_ID" SortExpression="MOVIE_ID" />
                            <asp:BoundField DataField="EXPR3" HeaderText="EXPR3" SortExpression="EXPR3" />
                            <asp:BoundField DataField="PRICE_ID" HeaderText="PRICE_ID" SortExpression="PRICE_ID" />
                        </Columns>
                        <PagerStyle CssClass="pagination-neutral" HorizontalAlign="Center" />
                        <EmptyDataTemplate>
                            <div class="alert alert-secondary text-center mt-3" role="alert">
                                No theater or show records currently available for the selected hall.
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