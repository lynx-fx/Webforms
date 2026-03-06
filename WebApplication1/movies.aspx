<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    &nbsp;&nbsp;&nbsp;
    <main>
        <section class="row" aria-labelledby="aspnetTitle">
            <h1 id="aspnetTitle">ASP.NET</h1>
            <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
            <p><a href="http://www.asp.net" class="btn btn-primary btn-md">Learn more &raquo;</a></p>
        </section>

        <div class="row">
            <section class="col-md-4" aria-labelledby="gettingStartedTitle">
                <h2 id="gettingStartedTitle">Getting started</h2>
                <p>
                    ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
                A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
                </p>
                <p>
                    <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="BOOKING_ID" DataSourceID="Booking" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                        <Columns>
                            <asp:BoundField DataField="BOOKING_ID" HeaderText="BOOKING_ID" ReadOnly="True" SortExpression="BOOKING_ID" />
                            <asp:BoundField DataField="MOVIE_ID" HeaderText="MOVIE_ID" SortExpression="MOVIE_ID" />
                            <asp:BoundField DataField="BOOKING_DATE" HeaderText="BOOKING_DATE" SortExpression="BOOKING_DATE" />
                            <asp:BoundField DataField="BOOKING_TYPE" HeaderText="BOOKING_TYPE" SortExpression="BOOKING_TYPE" />
                            <asp:BoundField DataField="USER_ID" HeaderText="USER_ID" SortExpression="USER_ID" />
                            <asp:BoundField DataField="SHOW_ID" HeaderText="SHOW_ID" SortExpression="SHOW_ID" />
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="Booking" runat="server" ConnectionString="<%$ ConnectionStrings:cw %>" ProviderName="<%$ ConnectionStrings:cw.ProviderName %>" SelectCommand="SELECT * FROM &quot;BOOKING&quot;" DeleteCommand="DELETE FROM &quot;BOOKING&quot; WHERE &quot;BOOKING_ID&quot; = :BOOKING_ID" InsertCommand="INSERT INTO &quot;BOOKING&quot; (&quot;BOOKING_ID&quot;, &quot;MOVIE_ID&quot;, &quot;BOOKING_DATE&quot;, &quot;BOOKING_TYPE&quot;, &quot;USER_ID&quot;, &quot;SHOW_ID&quot;) VALUES (:BOOKING_ID, :MOVIE_ID, :BOOKING_DATE, :BOOKING_TYPE, :USER_ID, :SHOW_ID)" UpdateCommand="UPDATE &quot;BOOKING&quot; SET &quot;MOVIE_ID&quot; = :MOVIE_ID, &quot;BOOKING_DATE&quot; = :BOOKING_DATE, &quot;BOOKING_TYPE&quot; = :BOOKING_TYPE, &quot;USER_ID&quot; = :USER_ID, &quot;SHOW_ID&quot; = :SHOW_ID WHERE &quot;BOOKING_ID&quot; = :BOOKING_ID">
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
                </p>
            </section>
            <section class="col-md-4" aria-labelledby="librariesTitle">
                <h2 id="librariesTitle">Get more libraries</h2>
                <p>
                    NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
                </p>
                <p>
                    <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
                </p>
            </section>
            <section class="col-md-4" aria-labelledby="hostingTitle">
                <h2 id="hostingTitle">Web Hosting</h2>
                <p>
                    You can easily find a web hosting company that offers the right mix of features and price for your applications.
                </p>
                <p>
                    <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
                </p>
            </section>
        </div>
    </main>

</asp:Content>
