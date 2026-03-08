<%@ Page Title="Tickets Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Ticket.aspx.cs" Inherits="WebApplication1.Ticket" %>

    <script runat="server">
    protected void SqlDataSource_Ticket_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null) {
                MessagePanel.Visible = true;
                MessagePanel.CssClass = "alert alert-danger alert-dismissible fade show mb-4";
                if (e.Exception.Message.Contains("ORA-00001"))
                    MessageLabel.Text = "<strong>Error:</strong> This Ticket Ref # already exists. Please use a unique ID.";
                else
                    MessageLabel.Text = "<strong>Error:</strong> " + e.Exception.Message;
                e.ExceptionHandled = true;
            }
            else {
                MessagePanel.Visible = true;
                MessagePanel.CssClass = "alert alert-success alert-dismissible fade show mb-4";
                MessageLabel.Text = "<strong>Success!</strong> Ticket has been issued and linked to booking.";
            }
        }
    </script>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="d-flex align-items-center mb-4 border-bottom pb-2">
            <h2 class="text-dark m-0"><i class="bi bi-ticket-perforated me-2"></i> Ticket Management</h2>
        </div>

        <div class="card shadow-sm border mb-5">
            <div class="card-body">
                <div class="mb-4">
                    <h5 class="text-dark fw-bold mb-1">Issue & Manage Tickets</h5>
                    <p class="text-secondary small">Associate issued tickets with valid booking references and track
                        their current status.</p>
                </div>

                <!-- Feedback Message -->
                <asp:Panel ID="MessagePanel" runat="server" Visible="false"
                    CssClass="alert alert-dismissible fade show mb-4" role="alert">
                    <asp:Label ID="MessageLabel" runat="server" Text=""></asp:Label>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </asp:Panel>

                <!-- Add New Ticket Form -->
                <div class="bg-light p-4 rounded-3 border mb-5">
                    <h6 class="text-uppercase fw-bold text-muted mb-4 small"><i class="bi bi-plus-circle me-1"></i>
                        Issue New Ticket</h6>
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="TICKET_ID"
                        DataSourceID="SqlDataSource_Ticket" DefaultMode="Insert" Width="100%">
                        <InsertItemTemplate>
                            <div class="row g-3">
                                <div class="col-md-3">
                                    <label class="form-label small fw-bold text-secondary">Ticket Ref #</label>
                                    <asp:TextBox ID="TICKET_IDTextBox" runat="server" Text='<%# Bind("TICKET_ID") %>'
                                        CssClass="form-control form-control-sm" placeholder="e.g. 9001" />
                                    <asp:RequiredFieldValidator ID="rfvTicketId" runat="server"
                                        ControlToValidate="TICKET_IDTextBox" ErrorMessage="Required" Display="Dynamic"
                                        CssClass="text-danger smaller" />
                                    <asp:CompareValidator ID="cvTicketId" runat="server"
                                        ControlToValidate="TICKET_IDTextBox" Operator="DataTypeCheck" Type="Integer"
                                        ErrorMessage="Numeric" Display="Dynamic" CssClass="text-danger smaller" />
                                </div>
                                <div class="col-md-3">
                                    <label class="form-label small fw-bold text-secondary">Booking Ref #</label>
                                    <asp:TextBox ID="BOOKING_IDTextBox" runat="server" Text='<%# Bind("BOOKING_ID") %>'
                                        CssClass="form-control form-control-sm" placeholder="e.g. 8001" />
                                    <asp:RequiredFieldValidator ID="rfvBookingId" runat="server"
                                        ControlToValidate="BOOKING_IDTextBox" ErrorMessage="Required" Display="Dynamic"
                                        CssClass="text-danger smaller" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label small fw-bold text-secondary">Status</label>
                                    <asp:TextBox ID="STATUSTextBox" runat="server" Text='<%# Bind("STATUS") %>'
                                        CssClass="form-control form-control-sm"
                                        placeholder="e.g. Paid, Printed, Cancelled" />
                                </div>
                                <div class="col-12 mt-3 text-end text-md-start">
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True"
                                        CommandName="Insert" Text='<i class="bi bi-printer me-1"></i> Issue Ticket'
                                        CssClass="btn btn-dark btn-sm px-4" />
                                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                        CommandName="Cancel" Text="Clear"
                                        CssClass="btn btn-link btn-sm text-decoration-none text-secondary" />
                                </div>
                            </div>
                        </InsertItemTemplate>
                    </asp:FormView>
                </div>

                <!-- Active Tickets Table -->
                <div class="table-responsive">
                    <asp:SqlDataSource ID="SqlDataSource_Ticket" runat="server"
                        ConnectionString="<%$ ConnectionStrings:cw %>"
                        ProviderName="<%$ ConnectionStrings:cw.ProviderName %>"
                        SelectCommand="SELECT * FROM &quot;TICKET&quot;"
                        DeleteCommand="DELETE FROM &quot;TICKET&quot; WHERE &quot;TICKET_ID&quot; = :TICKET_ID"
                        InsertCommand="INSERT INTO &quot;TICKET&quot; (&quot;TICKET_ID&quot;, &quot;BOOKING_ID&quot;, &quot;STATUS&quot;) VALUES (:TICKET_ID, :BOOKING_ID, :STATUS)"
                        UpdateCommand="UPDATE &quot;TICKET&quot; SET &quot;BOOKING_ID&quot; = :BOOKING_ID, &quot;STATUS&quot; = :STATUS WHERE &quot;TICKET_ID&quot; = :TICKET_ID"
                        OnInserted="SqlDataSource_Ticket_Inserted">
                        <DeleteParameters>
                            <asp:Parameter Name="TICKET_ID" Type="Decimal" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="TICKET_ID" Type="Decimal" />
                            <asp:Parameter Name="BOOKING_ID" Type="Decimal" />
                            <asp:Parameter Name="STATUS" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="BOOKING_ID" Type="Decimal" />
                            <asp:Parameter Name="STATUS" Type="String" />
                            <asp:Parameter Name="TICKET_ID" Type="Decimal" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                    <h6 class="text-dark fw-bold mb-3 mt-2"><i class="bi bi-list-check me-1"></i> Issued Tickets
                        Directory</h6>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TICKET_ID"
                        DataSourceID="SqlDataSource_Ticket" AllowPaging="True"
                        CssClass="table table-hover border align-middle" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="TICKET_ID" HeaderText="Ticket #" ReadOnly="True"
                                SortExpression="TICKET_ID">
                                <HeaderStyle CssClass="bg-light py-2" />
                            </asp:BoundField>
                            <asp:BoundField DataField="BOOKING_ID" HeaderText="Booking Ref" SortExpression="BOOKING_ID">
                                <HeaderStyle CssClass="bg-light py-2" />
                            </asp:BoundField>
                            <asp:BoundField DataField="STATUS" HeaderText="Status" SortExpression="STATUS">
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
                                No tickets have been issued yet.
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>

        <!-- Reference: Internal Bookings Log -->
        <div class="card shadow-sm border">
            <div class="card-header bg-white border-bottom py-3">
                <h6 class="m-0 fw-bold text-dark"><i class="bi bi-journal-text me-2"></i> Booking Reference Log</h6>
            </div>
            <div class="card-body">
                <p class="text-secondary mb-4 small">This log contains all valid bookings within the system. Use this as
                    a reference when issuing tickets.</p>
                <div class="table-responsive">
                    <asp:SqlDataSource ID="SqlDataSource_Booking" runat="server"
                        ConnectionString="<%$ ConnectionStrings:cw %>"
                        ProviderName="<%$ ConnectionStrings:cw.ProviderName %>"
                        SelectCommand="SELECT * FROM &quot;BOOKING&quot;"></asp:SqlDataSource>

                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="BOOKING_ID"
                        DataSourceID="SqlDataSource_Booking" AllowPaging="True" PageSize="5"
                        CssClass="table table-sm table-hover border align-middle" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="BOOKING_ID" HeaderText="Booking #" ReadOnly="True"
                                SortExpression="BOOKING_ID" />
                            <asp:BoundField DataField="MOVIE_ID" HeaderText="Movie ID" SortExpression="MOVIE_ID" />
                            <asp:BoundField DataField="BOOKING_DATE" HeaderText="Date" SortExpression="BOOKING_DATE"
                                DataFormatString="{0:d}" />
                            <asp:BoundField DataField="BOOKING_TYPE" HeaderText="Type" SortExpression="BOOKING_TYPE" />
                            <asp:BoundField DataField="USER_ID" HeaderText="User ID" SortExpression="USER_ID" />
                        </Columns>
                        <HeaderStyle CssClass="bg-light" />
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