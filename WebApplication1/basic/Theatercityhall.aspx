<%@ Page Title="Theater & City Hall Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Theatercityhall.aspx.cs" Inherits="WebApplication1.Theatercityhall" %>


    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="d-flex align-items-center mb-4 border-bottom pb-2">
            <h2 class="text-dark m-0"><i class="bi bi-building me-2"></i> Location Management</h2>
        </div>

        <div class="card shadow-sm border">
            <div class="card-body">
                <div class="mb-4">
                    <h5 class="text-dark fw-bold mb-1">Manage Venues</h5>
                    <p class="text-secondary small">Register and oversee theater branches and official city hall venues
                        for screenings.</p>
                </div>

                <!-- Feedback Message -->
                <asp:Panel ID="MessagePanel" runat="server" Visible="false"
                    CssClass="alert alert-dismissible fade show mb-4" role="alert">
                    <asp:Label ID="MessageLabel" runat="server" Text=""></asp:Label>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </asp:Panel>

                <!-- Add New Venue Form -->
                <div class="bg-light p-4 rounded-3 border mb-5">
                    <h6 class="text-uppercase fw-bold text-muted mb-4 small"><i class="bi bi-plus-circle me-1"></i>
                        Register New Location</h6>
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="THEATER_CITY_HALL_ID"
                        DataSourceID="SqlDataSource1" DefaultMode="Insert" Width="100%">
                        <InsertItemTemplate>
                            <div class="row g-3">
                                <div class="col-md-2">
                                    <label class="form-label small fw-bold text-secondary">Venue ID</label>
                                    <asp:TextBox ID="THEATER_CITY_HALL_IDTextBox" runat="server"
                                        Text='<%# Bind("THEATER_CITY_HALL_ID") %>'
                                        CssClass="form-control form-control-sm" placeholder="e.g. 1" />
                                    <asp:RequiredFieldValidator ID="rfvVenueId" runat="server"
                                        ControlToValidate="THEATER_CITY_HALL_IDTextBox" ErrorMessage="Required"
                                        Display="Dynamic" CssClass="text-danger smaller" ValidationGroup="AddVenueGroup" />
                                    <asp:CompareValidator ID="cvVenueId" runat="server"
                                        ControlToValidate="THEATER_CITY_HALL_IDTextBox" Operator="DataTypeCheck"
                                        Type="Integer" ErrorMessage="Numeric" Display="Dynamic"
                                        CssClass="text-danger smaller" ValidationGroup="AddVenueGroup" />
                                </div>
                                <div class="col-md-2">
                                    <label class="form-label small fw-bold text-secondary">Company Ref</label>
                                    <asp:TextBox ID="THEATER_COMPANY_IDTextBox" runat="server"
                                        Text='<%# Bind("THEATER_COMPANY_ID") %>' CssClass="form-control form-control-sm"
                                        placeholder="e.g. 10" />
                                    <asp:RequiredFieldValidator ID="rfvCompanyId" runat="server"
                                        ControlToValidate="THEATER_COMPANY_IDTextBox" ErrorMessage="Required"
                                        Display="Dynamic" CssClass="text-danger smaller" ValidationGroup="AddVenueGroup" />
                                </div>
                                <div class="col-md-8">
                                    <label class="form-label small fw-bold text-secondary">Branch Name /
                                        Location</label>
                                    <asp:TextBox ID="THEATER_CITY_HALL_NAMETextBox" runat="server"
                                        Text='<%# Bind("THEATER_CITY_HALL_NAME") %>'
                                        CssClass="form-control form-control-sm"
                                        placeholder="e.g. Grand City Cinema Hall A" />
                                    <asp:RequiredFieldValidator ID="rfvVenueName" runat="server"
                                        ControlToValidate="THEATER_CITY_HALL_NAMETextBox"
                                        ErrorMessage="Name is required" Display="Dynamic"
                                        CssClass="text-danger smaller" ValidationGroup="AddVenueGroup" />
                                </div>
                                <div class="col-12 mt-3 text-end text-md-start">
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True"
                                        CommandName="Insert" ValidationGroup="AddVenueGroup"
                                        Text='<i class="bi bi-building-add me-1"></i> Register Venue'
                                        CssClass="btn btn-dark btn-sm px-4" />
                                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                        CommandName="Cancel" Text="Clear"
                                        CssClass="btn btn-link btn-sm text-decoration-none text-secondary" />
                                </div>
                            </div>
                        </InsertItemTemplate>
                    </asp:FormView>
                </div>

                <!-- Venues Table -->
                <div class="table-responsive">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cw %>"
                        ProviderName="<%$ ConnectionStrings:cw.ProviderName %>"
                        SelectCommand="SELECT * FROM &quot;THEATER_CITY_HALL&quot;"
                        DeleteCommand="DELETE FROM &quot;THEATER_CITY_HALL&quot; WHERE &quot;THEATER_CITY_HALL_ID&quot; = :THEATER_CITY_HALL_ID"
                        InsertCommand="INSERT INTO &quot;THEATER_CITY_HALL&quot; (&quot;THEATER_CITY_HALL_ID&quot;, &quot;THEATER_COMPANY_ID&quot;, &quot;THEATER_CITY_HALL_NAME&quot;) VALUES (:THEATER_CITY_HALL_ID, :THEATER_COMPANY_ID, :THEATER_CITY_HALL_NAME)"
                        UpdateCommand="UPDATE &quot;THEATER_CITY_HALL&quot; SET &quot;THEATER_COMPANY_ID&quot; = :THEATER_COMPANY_ID, &quot;THEATER_CITY_HALL_NAME&quot; = :THEATER_CITY_HALL_NAME WHERE &quot;THEATER_CITY_HALL_ID&quot; = :THEATER_CITY_HALL_ID"
                        OnInserted="SqlDataSource1_Inserted">
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

                    <h6 class="text-dark fw-bold mb-3"><i class="bi bi-list-ul me-1"></i> Registered Locations Directory
                    </h6>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="THEATER_CITY_HALL_ID" DataSourceID="SqlDataSource1" AllowPaging="True"
                        CssClass="table table-hover border align-middle mt-2" GridLines="None" PageSize="10">
                        <Columns>
                            <asp:BoundField DataField="THEATER_CITY_HALL_ID" HeaderText="Venue ID" ReadOnly="True"
                                SortExpression="THEATER_CITY_HALL_ID">
                                <HeaderStyle CssClass="bg-light py-2" />
                            </asp:BoundField>
                            <asp:BoundField DataField="THEATER_COMPANY_ID" HeaderText="Company Ref"
                                SortExpression="THEATER_COMPANY_ID">
                                <HeaderStyle CssClass="bg-light py-2" />
                            </asp:BoundField>
                            <asp:BoundField DataField="THEATER_CITY_HALL_NAME" HeaderText="Branch Name / Location"
                                SortExpression="THEATER_CITY_HALL_NAME">
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
                                No venue records found in the database.
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