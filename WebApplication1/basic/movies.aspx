<%@ Page Title="Movies Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="movies.aspx.cs" Inherits="WebApplication1.movies" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="d-flex align-items-center mb-4 border-bottom pb-2">
            <h2 class="text-dark m-0"><i class="bi bi-film me-2"></i> Movie Inventory</h2>
        </div>

        <div class="card shadow-sm border">
            <div class="card-body">
                <div class="mb-4">
                    <h5 class="text-dark fw-bold mb-1">Catalogue Management</h5>
                    <p class="text-secondary small">Add or update movie titles, durations, and details.</p>
                </div>

                <!-- Feedback Message -->
                <asp:Panel ID="MessagePanel" runat="server" Visible="false"
                    CssClass="alert alert-dismissible fade show mb-4" role="alert">
                    <asp:Label ID="MessageLabel" runat="server" Text=""></asp:Label>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </asp:Panel>

                <!-- Add New Movie Form -->
                <div class="bg-light p-4 rounded-3 border mb-5">
                    <h6 class="text-uppercase fw-bold text-muted mb-4 small"><i class="bi bi-plus-circle me-1"></i>
                        Register New Movie</h6>
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="MOVIE_ID" DataSourceID="SqlDataSource1"
                        DefaultMode="Insert" Width="100%">
                        <InsertItemTemplate>
                            <div class="row g-3">
                                <div class="col-md-2">
                                    <label class="form-label small fw-bold text-secondary">Ref #</label>
                                    <asp:TextBox ID="MOVIE_IDTextBox" runat="server" Text='<%# Bind("MOVIE_ID") %>'
                                        CssClass="form-control form-control-sm" placeholder="ID" />
                                    <asp:RequiredFieldValidator ID="rfvID" runat="server"
                                        ControlToValidate="MOVIE_IDTextBox" ErrorMessage="ID Required" Display="Dynamic"
                                        CssClass="text-danger smaller" ValidationGroup="AddMovieGroup" />
                                    <asp:CompareValidator ID="cvID" runat="server" ControlToValidate="MOVIE_IDTextBox"
                                        Operator="DataTypeCheck" Type="Integer" ErrorMessage="Numeric" Display="Dynamic"
                                        CssClass="text-danger smaller" ValidationGroup="AddMovieGroup" />
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label small fw-bold text-secondary">Movie Title</label>
                                    <asp:TextBox ID="MOVIE_TITLETextBox" runat="server"
                                        Text='<%# Bind("MOVIE_TITLE") %>' CssClass="form-control form-control-sm"
                                        placeholder="Enter title" />
                                    <asp:RequiredFieldValidator ID="rfvTitle" runat="server"
                                        ControlToValidate="MOVIE_TITLETextBox" ErrorMessage="Title Required"
                                        Display="Dynamic" CssClass="text-danger smaller" ValidationGroup="AddMovieGroup" />
                                </div>
                                <div class="col-md-2">
                                    <label class="form-label small fw-bold text-secondary">Duration (min)</label>
                                    <asp:TextBox ID="MOVIE_DURATIONTextBox" runat="server"
                                        Text='<%# Bind("MOVIE_DURATION") %>' CssClass="form-control form-control-sm" />
                                </div>
                                <div class="col-md-2">
                                    <label class="form-label small fw-bold text-secondary">Language</label>
                                    <asp:TextBox ID="MOVIE_LANGUAGETextBox" runat="server"
                                        Text='<%# Bind("MOVIE_LANGUAGE") %>' CssClass="form-control form-control-sm" />
                                </div>
                                <div class="col-md-2">
                                    <label class="form-label small fw-bold text-secondary">Genre</label>
                                    <asp:TextBox ID="MOVIE_GENRETextBox" runat="server"
                                        Text='<%# Bind("MOVIE_GENRE") %>' CssClass="form-control form-control-sm" />
                                </div>
                                <div class="col-12 mt-3 text-end text-md-start">
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True"
                                        CommandName="Insert" Text='<i class="bi bi-plus-square me-1"></i> Add Movie'
                                        CssClass="btn btn-dark btn-sm px-4" ValidationGroup="AddMovieGroup" />
                                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                        CommandName="Cancel" Text="Clear"
                                        CssClass="btn btn-link btn-sm text-decoration-none text-secondary" />
                                </div>
                            </div>
                        </InsertItemTemplate>
                    </asp:FormView>
                </div>

                <div class="table-responsive">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cw %>"
                        ProviderName="<%$ ConnectionStrings:cw.ProviderName %>"
                        SelectCommand="SELECT * FROM &quot;MOVIE&quot;"
                        DeleteCommand="DELETE FROM &quot;MOVIE&quot; WHERE &quot;MOVIE_ID&quot; = :MOVIE_ID"
                        InsertCommand="INSERT INTO &quot;MOVIE&quot; (&quot;MOVIE_ID&quot;, &quot;MOVIE_TITLE&quot;, &quot;MOVIE_DURATION&quot;, &quot;MOVIE_LANGUAGE&quot;, &quot;MOVIE_GENRE&quot;) VALUES (:MOVIE_ID, :MOVIE_TITLE, :MOVIE_DURATION, :MOVIE_LANGUAGE, :MOVIE_GENRE)"
                        UpdateCommand="UPDATE &quot;MOVIE&quot; SET &quot;MOVIE_TITLE&quot; = :MOVIE_TITLE, &quot;MOVIE_DURATION&quot; = :MOVIE_DURATION, &quot;MOVIE_LANGUAGE&quot; = :MOVIE_LANGUAGE, &quot;MOVIE_GENRE&quot; = :MOVIE_GENRE WHERE &quot;MOVIE_ID&quot; = :MOVIE_ID"
                        OnInserted="SqlDataSource1_Inserted">
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
                        CssClass="table table-hover border align-middle mt-2" GridLines="None" PageSize="10">
                        <Columns>
                            <asp:BoundField DataField="MOVIE_ID" HeaderText="Ref #" ReadOnly="True"
                                SortExpression="MOVIE_ID">
                                <HeaderStyle CssClass="bg-light py-2" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MOVIE_TITLE" HeaderText="Movie Title"
                                SortExpression="MOVIE_TITLE">
                                <HeaderStyle CssClass="bg-light py-2" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MOVIE_DURATION" HeaderText="Duration"
                                SortExpression="MOVIE_DURATION">
                                <HeaderStyle CssClass="bg-light py-2" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MOVIE_LANGUAGE" HeaderText="Language"
                                SortExpression="MOVIE_LANGUAGE">
                                <HeaderStyle CssClass="bg-light py-2" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MOVIE_GENRE" HeaderText="Genre" SortExpression="MOVIE_GENRE">
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
                                No movie records available.
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