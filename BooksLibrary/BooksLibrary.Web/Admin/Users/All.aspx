<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="All.aspx.cs" Inherits="BooksLibrary.Web.Admin.Users.All" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <asp:ListView runat="server" ID="UsersListView" ItemType="BooksLibrary.Models.User"
        DataKeyNames="Id"
        SelectMethod="UsersListView_GetData">
        <LayoutTemplate>
            <table class="table table-striped table-hover col-sm-2">
                <tr id="itemplaceholder" runat="server"></tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <th><%#: Item.UserName %></th>
                <th>
                    <asp:Button runat="server" ID="DeleteButton" Text="Delete" OnClick="UsersListView_DeleteItem" CommandArgument="<%# Item.Id %>" class="btn btn-danger"/></th>
            </tr>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>
