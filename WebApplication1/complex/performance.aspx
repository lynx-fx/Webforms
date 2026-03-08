<%@ Page Title="User Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="performance.aspx.cs" Inherits="WebApplication1.Performance" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="d-flex align-items-center mb-4 border-bottom pb-2">
            <h2 class="text-dark m-0"><i class="bi bi-people me-2"></i> Top performing halls</h2>
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
                        SelectCommand="SELECT 
    m.MOVIE_TITLE,
    tch.THEATER_CITY_HALL_NAME,
    SUM(h.HALL_CAPACITY) AS total_seats,
    NVL(SUM(CASE WHEN t.STATUS = 'PAID' THEN 1 ELSE 0 END), 0) AS paid_tickets_count,
    ROUND(
        NVL(SUM(CASE WHEN t.STATUS = 'PAID' THEN 1 ELSE 0 END), 0) / NULLIF(SUM(h.HALL_CAPACITY),0) * 100,
        2
    ) AS occupancy_percentage
FROM SHOW s
JOIN MOVIE m ON s.MOVIE_ID = m.MOVIE_ID
JOIN HALL h ON s.HALL_ID = h.HALL_ID
JOIN THEATER_CITY_HALL_HALL tchw ON h.HALL_ID = tchw.HALL_ID
JOIN THEATER_CITY_HALL tch ON tchw.THEATER_CITY_HALL_ID = tch.THEATER_CITY_HALL_ID
JOIN BOOKING b ON b.SHOW_ID = s.SHOW_ID
JOIN TICKET t ON t.BOOKING_ID = b.BOOKING_ID
WHERE m.MOVIE_ID = :MOVIE_ID
GROUP BY 
    m.MOVIE_TITLE,
    tch.THEATER_CITY_HALL_NAME
ORDER BY occupancy_percentage DESC"
                        UpdateCommand="UPDATE &quot;USERS&quot; SET &quot;USER_NAME&quot; = :USER_NAME, &quot;USER_ADDRESS&quot; = :USER_ADDRESS WHERE &quot;USER_ID&quot; = :USER_ID">
                        <DeleteParameters>
                            <asp:Parameter Name="USER_ID" Type="Decimal" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="USER_ID" Type="Decimal" />
                            <asp:Parameter Name="USER_NAME" Type="String" />
                            <asp:Parameter Name="USER_ADDRESS" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="MOVIE_ID" PropertyName="SelectedValue" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="USER_NAME" Type="String" />
                            <asp:Parameter Name="USER_ADDRESS" Type="String" />
                            <asp:Parameter Name="USER_ID" Type="Decimal" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2"
                        DataTextField="MOVIE_TITLE" DataValueField="MOVIE_ID" AutoPostBack="True" EnableTheming="False">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cw %>"
                        ProviderName="<%$ ConnectionStrings:cw.ProviderName %>"
                        SelectCommand="SELECT &quot;MOVIE_ID&quot;, &quot;MOVIE_TITLE&quot; FROM &quot;MOVIE&quot;" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM &quot;MOVIE&quot; WHERE &quot;MOVIE_ID&quot; = :original_MOVIE_ID AND &quot;MOVIE_TITLE&quot; = :original_MOVIE_TITLE" InsertCommand="INSERT INTO &quot;MOVIE&quot; (&quot;MOVIE_ID&quot;, &quot;MOVIE_TITLE&quot;) VALUES (:MOVIE_ID, :MOVIE_TITLE)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE &quot;MOVIE&quot; SET &quot;MOVIE_TITLE&quot; = :MOVIE_TITLE WHERE &quot;MOVIE_ID&quot; = :original_MOVIE_ID AND &quot;MOVIE_TITLE&quot; = :original_MOVIE_TITLE">
                        <DeleteParameters>
                            <asp:Parameter Name="original_MOVIE_ID" Type="Decimal" />
                            <asp:Parameter Name="original_MOVIE_TITLE" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="MOVIE_ID" Type="Decimal" />
                            <asp:Parameter Name="MOVIE_TITLE" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="MOVIE_TITLE" Type="String" />
                            <asp:Parameter Name="original_MOVIE_ID" Type="Decimal" />
                            <asp:Parameter Name="original_MOVIE_TITLE" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True"
                        CssClass="table table-hover table-bordered align-middle" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="MOVIE_TITLE" HeaderText="MOVIE_TITLE"
                                SortExpression="MOVIE_TITLE">
                            </asp:BoundField>
                            <asp:BoundField DataField="THEATER_CITY_HALL_NAME" HeaderText="THEATER_CITY_HALL_NAME" SortExpression="THEATER_CITY_HALL_NAME">
                            </asp:BoundField>
                            <asp:BoundField DataField="TOTAL_SEATS" HeaderText="TOTAL_SEATS"
                                SortExpression="TOTAL_SEATS" />
                            <asp:BoundField DataField="PAID_TICKETS_COUNT" HeaderText="PAID_TICKETS_COUNT" SortExpression="PAID_TICKETS_COUNT" />
                            <asp:BoundField DataField="OCCUPANCY_PERCENTAGE" HeaderText="OCCUPANCY_PERCENTAGE"
                                SortExpression="OCCUPANCY_PERCENTAGE" />
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