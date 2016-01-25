<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="All.aspx.cs" Inherits="BooksLibrary.Web.Categories.All1" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <asp:ListView ID="CategoriesListView"
        DataKeyNames="Id"
        SelectMethod="CategoriesListView_GetData"
        ItemType="BooksLibrary.Models.Category"
        runat="server">
        <LayoutTemplate>
            <h2>Categories</h2>
            <ul class="list-group">
                <li id="itemPlaceholder" runat="server"></li>
            </ul>
        </LayoutTemplate>
        <ItemTemplate>
            <li class="list-group-item"><a href="/Books/All?category=<%# Item.Name %>"><%# Item.Name %></a></li>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>
