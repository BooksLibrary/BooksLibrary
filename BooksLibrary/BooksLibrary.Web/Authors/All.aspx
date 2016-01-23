<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="All.aspx.cs" Inherits="BooksLibrary.Web.Authors.All" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h1>Authors</h1>
    <asp:GridView runat="server" ID="AuthorsGridView" ItemType="BooksLibrary.Models.Author"
        AutoGenerateColumns="false"
        SelectMethod="AuthorsGridView_GetData" 
        AllowPaging="True" DataKeyNames="Id" PageSize="5"
        OnPageIndexChanged="AuthorsGridView_PageIndexChanged"
        AllowSorting="true">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Author Name" SortExpression="Name"/>
            <asp:HyperLinkField HeaderText="Details" Text="Details"
                DataNavigateUrlFields="Id" DataNavigateUrlFormatString="/Authors/Details.aspx?id={0}" />
        </Columns>
    </asp:GridView>
</asp:Content>
