<%@ Page Title="Shows Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="show.aspx.cs" Inherits="WebApplication1.show" %>

    <script runat="server">
    protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null) {
                MessagePanel.Visible = true;
                MessagePanel.CssClass = "alert alert-danger alert-dismissible fade show mb-4";
                if (e.Exception.Message.Contains("ORA-00001"))
                    MessageLabel.Text = "<strong>Error:</strong> This Show ID is already taken. Please use a unique ID.";
                else
                    MessageLabel.Text = "<strong>Error:</strong> " + e.Exception.Message;
                e.ExceptionHandled = true;
            }
            else {
                MessagePanel.Visible = true;
                MessagePanel.CssClass = "alert alert-success alert-dismissible fade show mb-4";
                MessageLabel.Text = "<strong>Success!</strong> The show has been scheduled successfully.";
            }
        }
    </script>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="d-flex align-items-center mb-4 border-bottom pb-2">
            <h2 class="text-dark m-0"><i class="bi bi-camera-reels me-2"></i> Show Scheduling</h2>
        </div>

        <div class="card shadow-sm border">
            <div class="card-body">
                <div class="mb-4">
                    <h5 class="text-dark fw-bold mb-1">Manage Schedules</h5>
                    <p class="text-secondary small">Configure cinema showtimes and scheduling across all available
                        halls.</p>
                </div>

                <!-- Feedback Message -->
                <asp:Panel ID="MessagePanel" runat="server" Visible="false"
                    CssClass="alert alert-dismissible fade show mb-4" role="alert">
                    <asp:Label ID="MessageLabel" runat="server" Text=""></asp:Label>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </asp:Panel>

                <!-- Add New Show Form -->
                <div class="bg-light p-4 rounded-3 border mb-5">
                    <h6 class="text-uppercase fw-bold text-muted mb-4 small"><i class="bi bi-plus-circle me-1"></i>
                        Register New Schedule</h6>
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="SHOW_ID" DataSourceID="SqlDataSource1"
                        DefaultMode="Insert" Width="100%">
                        <InsertItemTemplate>
                            <div class="row g-3">
                                <div class="col-md-2">
                                    <label class="form-label small fw-bold text-secondary">Show ID</label>
                                    <asp:TextBox ID="SHOW_IDTextBox" runat="server" Text='<%# Bind("SHOW_ID") %>'
                                        CssClass="form-control form-control-sm" placeholder="e.g. 501" />
                                    <asp:RequiredFieldValidator ID="rfvShowId" runat="server"
                                        ControlToValidate="SHOW_IDTextBox" ErrorMessage="Required" Display="Dynamic"
                                        CssClass="text-danger smaller" ValidationGroup="AddShowGroup" />
                                    <asp:CompareValidator ID="cvShowId" runat="server"
                                        ControlToValidate="SHOW_IDTextBox" Operator="DataTypeCheck" Type="Integer"
                                        ErrorMessage="Numeric" Display="Dynamic" CssClass="text-danger smaller" ValidationGroup="AddShowGroup" />
                                </div>
                                <div class="col-md-2">
                                    <label class="form-label small fw-bold text-secondary">Movie ID</label>
                                    <asp:TextBox ID="MOVIE_IDTextBox" runat="server" Text='<%# Bind("MOVIE_ID") %>'
                                        CssClass="form-control form-control-sm" placeholder="e.g. 101" />
                                    <asp:RequiredFieldValidator ID="rfvMovieId" runat="server"
                                        ControlToValidate="MOVIE_IDTextBox" ErrorMessage="Required" Display="Dynamic"
                                        CssClass="text-danger smaller" ValidationGroup="AddShowGroup" />
                                </div>
                                <div class="col-md-2">
                                    <label class="form-label small fw-bold text-secondary">Hall ID</label>
                                    <asp:TextBox ID="HALL_IDTextBox" runat="server" Text='<%# Bind("HALL_ID") %>'
                                        CssClass="form-control form-control-sm" placeholder="e.g. 1" />
                                    <asp:RequiredFieldValidator ID="rfvHallId" runat="server"
                                        ControlToValidate="HALL_IDTextBox" ErrorMessage="Required" Display="Dynamic"
                                        CssClass="text-danger smaller" ValidationGroup="AddShowGroup" />
                                </div>
                                <div class="col-md-3">
                                    <label class="form-label small fw-bold text-secondary">Date & Time</label>
                                    <div class="input-group input-group-sm">
                                        <asp:TextBox ID="SHOW_DATETextBox" runat="server"
                                            Text='<%# Bind("SHOW_DATE") %>' CssClass="form-control"
                                            placeholder="YYYY-MM-DD" />
                                        <asp:TextBox ID="SHOW_TIMETextBox" runat="server"
                                            Text='<%# Bind("SHOW_TIME") %>' CssClass="form-control"
                                            placeholder="HH:MM AM/PM" />
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label class="form-label small fw-bold text-secondary">Price ID</label>
                                    <asp:TextBox ID="PRICE_IDTextBox" runat="server" Text='<%# Bind("PRICE_ID") %>'
                                        CssClass="form-control form-control-sm" />
                                </div>
                                <div class="col-12 mt-3 text-end text-md-start">
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True"
                                        CommandName="Insert" ValidationGroup="AddShowGroup"
                                        Text='<i class="bi bi-calendar-plus me-1"></i> Schedule Show'
                                        CssClass="btn btn-dark btn-sm px-4" />
                                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                        CommandName="Cancel" Text="Clear"
                                        CssClass="btn btn-link btn-sm text-decoration-none text-secondary" />
                                </div>
                            </div>
                        </InsertItemTemplate>
                    </asp:FormView>
                </div>

                <!-- Showtimes Directory Table -->
                <div class="table-responsive">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cw %>"
                        ProviderName="<%$ ConnectionStrings:cw.ProviderName %>"
                        SelectCommand="SELECT * FROM &quot;SHOW&quot;"
                        DeleteCommand="DELETE FROM &quot;SHOW&quot; WHERE &quot;SHOW_ID&quot; = :SHOW_ID"
                        InsertCommand="INSERT INTO &quot;SHOW&quot; (&quot;SHOW_ID&quot;, &quot;SHOW_TIME&quot;, &quot;SHOW_DATE&quot;, &quot;MOVIE_ID&quot;, &quot;HALL_ID&quot;, &quot;PRICE_ID&quot;) VALUES (:SHOW_ID, :SHOW_TIME, :SHOW_DATE, :MOVIE_ID, :HALL_ID, :PRICE_ID)"
                        UpdateCommand="UPDATE &quot;SHOW&quot; SET &quot;SHOW_TIME&quot; = :SHOW_TIME, &quot;SHOW_DATE&quot; = :SHOW_DATE, &quot;MOVIE_ID&quot; = :MOVIE_ID, &quot;HALL_ID&quot; = :HALL_ID, &quot;PRICE_ID&quot; = :PRICE_ID WHERE &quot;SHOW_ID&quot; = :SHOW_ID"
                        OnInserted="SqlDataSource1_Inserted">
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
                        CssClass="table table-hover border align-middle mt-2" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="SHOW_ID" HeaderText="ID" ReadOnly="True"
                                SortExpression="SHOW_ID">
                                <HeaderStyle CssClass="bg-light py-2" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MOVIE_ID" HeaderText="Movie" SortExpression="MOVIE_ID">
                                <HeaderStyle CssClass="bg-light py-2" />
                            </asp:BoundField>
                            <asp:BoundField DataField="HALL_ID" HeaderText="Hall" SortExpression="HALL_ID">
                                <HeaderStyle CssClass="bg-light py-2" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SHOW_DATE" HeaderText="Date" SortExpression="SHOW_DATE"
                                DataFormatString="{0:MMM dd, yyyy}">
                                <HeaderStyle CssClass="bg-light py-2" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SHOW_TIME" HeaderText="Time" SortExpression="SHOW_TIME"
                                DataFormatString="{0:t}">
                                <HeaderStyle CssClass="bg-light py-2" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PRICE_ID" HeaderText="Price ID" SortExpression="PRICE_ID">
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
                                No scheduling records currently available.
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
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