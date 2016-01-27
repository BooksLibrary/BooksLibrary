<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="All.aspx.cs" Inherits="BooksLibrary.Web.Authors.All1" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <asp:ListView runat="server" ID="AuthorsListView" ItemType="BooksLibrary.Models.Author" DataKeyNames="Id"
        SelectMethod="AuthorsGridView_GetData">
        <EmptyDataTemplate>
            <h1>No Authors to display.</h1>
        </EmptyDataTemplate>
        <LayoutTemplate>
            <br />
            <asp:Button runat="server" ID="SortByNameButton" CommandArgument="Name" CommandName="Sort" Text="Sort by name" CssClass="btn btn-primary col-md-2" />
            <div class="form-group col-md-4 pull-right">
                <div class="input-group">
                    <span class="input-group-addon">$</span>
                    <asp:TextBox runat="server" ID="FilterByNameInput" class="form-control"></asp:TextBox>
                    <span class="input-group-btn">
                        <asp:Button runat="server" class="btn btn-default" type="button" id="FilterByNameButton" onclick="FilterByNameButtonClick" Text="Filter"/>
                    </span>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <tr runat="server" id="itemplaceholder"></tr>
            </table>
            <asp:DataPager runat="server" PagedControlID="AuthorsListView">
                <Fields>
                    <asp:NumericPagerField ButtonType="Link" />
                </Fields>
            </asp:DataPager>
        </LayoutTemplate>
        <ItemTemplate>
            <tr runat="server">
                <td>
                    <asp:Image runat="server" ImageUrl="<%# Item.ImageUrl %>" AlternateText="No Image" Height="100" /></td>
                <td>
                    <asp:Literal runat="server" Text="<%# Item.Name %>" /></td>
                <td>
                    <asp:Literal runat="server" Text="<%# Item.Info %>" /></td>
                <td>
                    <a class="btn btn-info" href="/books/all?author=<%# Item.Id %>">Books</a>
                </td>
            </tr>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>
