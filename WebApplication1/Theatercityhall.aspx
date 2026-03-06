<%@ Page Title="Theater & City Hall Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Theatercityhall.aspx.cs" Inherits="WebApplication1.Theatercityhall" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="d-flex align-items-center mb-4 border-bottom pb-2">
            <h2 class="text-dark m-0"><i class="bi bi-building me-2"></i> Location Management</h2>
        </div>

        <div class="card shadow-sm border">
            <div class="card-body">
                <p class="text-secondary mb-4 small">Manage theater branches and official city hall venues associated
                    with cinema events and screenings.</p>

                <div class="table-responsive">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cw %>"
                        ProviderName="<%$ ConnectionStrings:cw.ProviderName %>"
                        SelectCommand="SELECT * FROM &quot;THEATER_CITY_HALL&quot;"
                        DeleteCommand="DELETE FROM &quot;THEATER_CITY_HALL&quot; WHERE &quot;THEATER_CITY_HALL_ID&quot; = :THEATER_CITY_HALL_ID"
                        InsertCommand="INSERT INTO &quot;THEATER_CITY_HALL&quot; (&quot;THEATER_CITY_HALL_ID&quot;, &quot;THEATER_COMPANY_ID&quot;, &quot;THEATER_CITY_HALL_NAME&quot;) VALUES (:THEATER_CITY_HALL_ID, :THEATER_COMPANY_ID, :THEATER_CITY_HALL_NAME)"
                        UpdateCommand="UPDATE &quot;THEATER_CITY_HALL&quot; SET &quot;THEATER_COMPANY_ID&quot; = :THEATER_COMPANY_ID, &quot;THEATER_CITY_HALL_NAME&quot; = :THEATER_CITY_HALL_NAME WHERE &quot;THEATER_CITY_HALL_ID&quot; = :THEATER_CITY_HALL_ID">
                        <DeleteParameters>
                            <asp:Parameter Name="THEATER_CITY_HALL_ID" Type="Decimal" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="THEATER_CITY_HALL_ID" Type="Decimal" />
                            <asp:Parameter Name="THEATER_COMPANY_ID" Type="Decimal" />
                            <asp:Parameter Name="THEATER_CITY_HALL_NAME" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="THEATER_COMPANY_ID" Type="Decimal" />
                            <asp:Parameter Name="THEATER_CITY_HALL_NAME" Type="String" />
                            <asp:Parameter Name="THEATER_CITY_HALL_ID" Type="Decimal" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="THEATER_CITY_HALL_ID" DataSourceID="SqlDataSource1" AllowPaging="True"
                        CssClass="table table-hover table-bordered align-middle" GridLines="None" PageSize="10">
                        <Columns>
                            <asp:BoundField DataField="THEATER_CITY_HALL_ID" HeaderText="Venue ID" ReadOnly="True"
                                SortExpression="THEATER_CITY_HALL_ID">
                                <HeaderStyle CssClass="bg-light text-dark fw-bold small" />
                            </asp:BoundField>
                            <asp:BoundField DataField="THEATER_COMPANY_ID" HeaderText="Company Ref"
                                SortExpression="THEATER_COMPANY_ID">
                                <HeaderStyle CssClass="bg-light text-dark fw-bold small" />
                            </asp:BoundField>
                            <asp:BoundField DataField="THEATER_CITY_HALL_NAME" HeaderText="Branch Name / Location"
                                SortExpression="THEATER_CITY_HALL_NAME">
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
                                No venue records found in the database.
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