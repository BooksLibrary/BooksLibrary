<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="All.aspx.cs" Inherits="BooksLibrary.Web.Authors.All" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h1 class="col-md-2 col-md-offset-5 center">Authors</h1>
    <div>
        <asp:GridView runat="server" ID="AuthorsGridView" ItemType="BooksLibrary.Models.Author" HorizontalAlign="Center"
            AutoGenerateColumns="False"
            SelectMethod="AuthorsGridView_GetData"
            AllowPaging="True" DataKeyNames="Id" PageSize="5"
            OnPageIndexChanged="AuthorsGridView_PageIndexChanged"
            AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="500px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Author Name" SortExpression="Name" />
                <asp:HyperLinkField HeaderText="Details" Text="Details"
                    DataNavigateUrlFields="Id" DataNavigateUrlFormatString="/Authors/Details.aspx?id={0}" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    </div>
</asp:Content>
