<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="All.aspx.cs" Inherits="BooksLibrary.Web.Admin.Users.All" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <asp:ListView runat="server" ID="UsersListView" ItemType="BooksLibrary.Models.User"
        DataKeyNames="Id"
        SelectMethod="UsersListView_GetData">
        <LayoutTemplate>
            <div>
                <h1>Users</h1>
                <asp:Button runat="server" CommandName="Sort" CommandArgument="Username" Text="Sort by Username" class="btn btn-primary pull-right" />
                <br />
                <br />
            </div>
            <table class="table table-striped table-hover col-sm-2">
                <tr id="itemplaceholder" runat="server"></tr>
            </table>
            <asp:DataPager ID="UsersPager" runat="server" PagedControlID="UsersListView" PageSize="2" class="pagination">
                <Fields>
                    <asp:NumericPagerField ButtonType="Link" />
                </Fields>
            </asp:DataPager>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <th><%#: Item.UserName %></th>
                <th>
                    <asp:Button runat="server" ID="DeleteButton" Text="Delete" OnClick="UsersListView_DeleteItem" CommandArgument="<%# Item.Id %>" class="btn btn-danger pull-right" /></th>
            </tr>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>
