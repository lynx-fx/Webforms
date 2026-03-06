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
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="THEATER_CITY_HALL_ID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                        <Columns>
                            <asp:BoundField DataField="THEATER_CITY_HALL_ID" HeaderText="THEATER_CITY_HALL_ID" ReadOnly="True" SortExpression="THEATER_CITY_HALL_ID" />
                            <asp:BoundField DataField="THEATER_COMPANY_ID" HeaderText="THEATER_COMPANY_ID" SortExpression="THEATER_COMPANY_ID" />
                            <asp:BoundField DataField="THEATER_CITY_HALL_NAME" HeaderText="THEATER_CITY_HALL_NAME" SortExpression="THEATER_CITY_HALL_NAME" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cw %>" ProviderName="<%$ ConnectionStrings:cw.ProviderName %>" SelectCommand="SELECT * FROM &quot;THEATER_CITY_HALL&quot;" DeleteCommand="DELETE FROM &quot;THEATER_CITY_HALL&quot; WHERE &quot;THEATER_CITY_HALL_ID&quot; = :THEATER_CITY_HALL_ID" InsertCommand="INSERT INTO &quot;THEATER_CITY_HALL&quot; (&quot;THEATER_CITY_HALL_ID&quot;, &quot;THEATER_COMPANY_ID&quot;, &quot;THEATER_CITY_HALL_NAME&quot;) VALUES (:THEATER_CITY_HALL_ID, :THEATER_COMPANY_ID, :THEATER_CITY_HALL_NAME)" UpdateCommand="UPDATE &quot;THEATER_CITY_HALL&quot; SET &quot;THEATER_COMPANY_ID&quot; = :THEATER_COMPANY_ID, &quot;THEATER_CITY_HALL_NAME&quot; = :THEATER_CITY_HALL_NAME WHERE &quot;THEATER_CITY_HALL_ID&quot; = :THEATER_CITY_HALL_ID">
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
